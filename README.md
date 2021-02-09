## PLUG (Perth Linux User Group) website

### Development

This is a [Hugo](https://gohugo.io/) site built to run on [GitHub Pages](https://help.github.com/articles/what-are-github-pages/).

### Getting Started

#### Requirements

* Hugo (extended edition)

#### Migration

All current pages that are currently on plug.org.au should be converted to markdown and added to this site.

There's a github task at https://github.com/plugorgau/website/issues/4
to track the progress.

As some of the html used on the current website is non standard,
running a html -> markdown task gives unsatisfactory results.

For the pages I've done so far I found
https://domchristie.github.io/to-markdown/
useful.

#### Running Locally

Run Hugo with `hugo serve`.

If you are on a PLUG dev box and want to access the site publicly, run `hugo serve --bind 0.0.0.0`
