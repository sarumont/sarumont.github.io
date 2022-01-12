---
title: Implementing a Ring Buffer in PostgreSQL
date: '2022-01-12'
description:
categories: ['dev']
---

There are plenty of instances where a persistent ring buffer is a useful construct: search history, remote system stats, etc. This post outlines a method for creating one in PostgreSQL.

# Sequence

A ring buffer is a fixed-size buffer which cycles once full, overwriting the first entry with the `n+1`th (i.e. - if you have a 100-item buffer, the 101st item will overwrite the 1st). To implement something like this with a PostgreSQL table, you will need to key it with a [sequence](https://www.postgresql.org/docs/current/sql-createsequence.html).

```sql
CREATE SEQUENCE IF NOT EXISTS history_sequence MINVALUE 1 MAXVALUE 100 CYCLE;
```

This will create a new sequence which will cycle from 1 to 100.

# Table

Now, create a basic table to store your ring buffer:

```sql
CREATE TABLE history (
  sequence          integer primary key,
  timestamp         timestamp not null default now(),
  data              jsonb
);
```

Simple enough, right?

# Upsertion

To easily implement the write-or-overwrite behavior in a ring buffer, we will need to take advantage of PostgreSQL's "upsert" functionality - `ON CONFLICT DO UPDATE`:

```sql
INSERT INTO history (sequence, timestamp, data) VALUES (nextval("history_sequence"), default, '{''foo'': ''bar''}'::jsonb) ON CONFLICT (sequence) DO UPDATE SET timestamp = now(), data = '{''foo'': ''bar''}';
```

# Putting it all together

Generally, you'll want a sequence per item you're tracking - be it a user, VM, IP-enabled coffee pot, etc. For this, you'll want to expand the table to include a secondary identifier and name your sequence accordingly. Let's use some `pg-promise` templated queries to illustrate the real-world example.

## Sequence management

```sql
CREATE SEQUENCE IF NOT EXISTS $<sequenceName:name> MINVALUE 1 MAXVALUE 100 CYCLE;
```

## Table definition

```sql
CREATE TABLE user_history (
  sequence          integer not null,
  user_id           uuid not null references user_profile(id) on delete cascade,
  timestamp         timestamp not null default now(),
  data              jsonb,
  PRIMARY KEY (sequence, user_id)
);
```

## Upsert statement

```sql
INSERT INTO user_history (
  sequence,
  user_id,
  timestamp,
  data
) VALUES (
  nextval('$<sequenceName:name>'),
  $<userId>,
  default,
  $<history>) 
ON CONFLICT (sequence, user_id) 
DO UPDATE SET timestamp = now(), data = $<history>;
```

## History management


```typescript
const sequenceName = `histseq_${user.id}`;
await pg.none(createSequenceSQL, { sequenceName })
  .then(() => pg.none(insertHistorySQL, { sequenceName, userId, data }));
```

## Cleanup

```sql
DROP SEQUENCE IF EXISTS $<sequenceName:name>;
```

# Conclusion

There you have it - a simple, persistent ring buffer, backed by PostgreSQL.
