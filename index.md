---
layout: base
---

<div class="posts">
    {% assign post = site.posts.first %}
    <article class="post h-entry" itemscope itemtype="http://schema.org/BlogPosting">
        <header class="post-header">
            <h1 class="post-title p-name" itemprop="name headline"><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h1>

        <div class="post-meta">
        {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
{% assign pdate = post.date | date_to_xmlschema %}
{%- if post.modified_date %}<span class="meta-label">Published:</span>{% endif %}
<time class="dt-published" datetime="{{ pdate }}" itemprop="datePublished">
    {{ pdate | date: date_format }}
</time>
{%- if post.modified_date -%}
<span class="bullet-divider">•</span>
<span class="meta-label">Updated:</span>
{%- assign mdate = post.modified_date | date_to_xmlschema %}
<time class="dt-modified" datetime="{{ mdate }}" itemprop="dateModified">
    {{ mdate | date: date_format }}
</time>
{%- endif -%}    
</div>
</header>

<div class="post-content e-content" itemprop="articleBody">
    {{ post.content }}
</div>

</article>
</div>

<hr />
<div>
    <h3><a href="archive">See all posts &raquo;</a></h3>
</div>
