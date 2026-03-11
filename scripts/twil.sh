#!/usr/bin/env bash
set -euo pipefail

DRAFTS_DIR="_drafts"
POSTS_DIR="_posts"
TODAY=$(date +%Y-%m-%d)

# Find TWIL drafts and move any dated today or in the past
moved=false
found=false
for f in "$DRAFTS_DIR"/*-twil-*.md; do
	[ -e "$f" ] || continue
	found=true
	# Extract date from filename (YYYY-MM-DD prefix)
	date_str=$(basename "$f" | grep -oE '^[0-9]{4}-[0-9]{2}-[0-9]{2}')
	if [[ -n "$date_str" && ! "$date_str" > "$TODAY" ]]; then
		mv "$f" "$POSTS_DIR/$(basename "$f")"
		echo "Published: $(basename "$f")"
		moved=true
	else
		echo "Draft not yet due: $(basename "$f")"
	fi
done

if $moved; then
	exit 0
fi

if $found; then
	# Found drafts but none ready to publish
	exit 0
fi

# No TWIL drafts — create one for this week's Friday
dow=$(date +%u) # 1=Mon, 7=Sun
if [ "$dow" -le 5 ]; then
	days_until_friday=$((5 - dow))
else
	days_until_friday=$((12 - dow))
fi

if date -v+0d +%Y-%m-%d &>/dev/null; then
	friday=$(date -v+"${days_until_friday}d" +%Y-%m-%d)
else
	friday=$(date -d "+${days_until_friday} days" +%Y-%m-%d)
fi
filename="${friday}-twil-${friday}.md"
filepath="${DRAFTS_DIR}/${filename}"

mkdir -p "$DRAFTS_DIR"

cat > "$filepath" << EOF
---
title: 'TWIL: ${friday}'
description: What I learned the week ending on ${friday}
categories: twil
---

This week I learned:
-
EOF

echo "Created draft: $filename"
