---
layout: page
title: Committee Archive
permalink: /events/committee/
---

Minutes for the Perth Linux User Group AGMs:

* [2021]({{ site.baseurl }}/events/AGM/2021)
* [2020]({{ site.baseurl }}/events/AGM/2020)
* [2019]({{ site.baseurl }}/events/AGM/2019)
* [2018]({{ site.baseurl }}/events/AGM/2018)
* [2017]({{ site.baseurl }}/events/AGM/2017)
* [2016]({{ site.baseurl }}/events/AGM/2016)

* [2011]({{ site.baseurl }}/events/AGM/2011)
* [2010]({{ site.baseurl }}/events/AGM/2010)
* [2009]({{ site.baseurl }}/events/AGM/2009)
* [2008]({{ site.baseurl }}/events/AGM/2008)
* [2007]({{ site.baseurl }}/events/AGM/2007)
* [2006]({{ site.baseurl }}/events/AGM/2006)
* [2005]({{ site.baseurl }}/events/AGM/2005)
* [2004]({{ site.baseurl }}/events/AGM/2004)
* [2003]({{ site.baseurl }}/events/AGM/2003)
* [2002]({{ site.baseurl }}/events/AGM/2002)

Minutes for PLUG committee meetings:

{% for post in site.posts %}
{% if post.categories contains "minutes" %}
* [{{ post.title }}]({{ post.url }})
{% endif %}
{% endfor %}
