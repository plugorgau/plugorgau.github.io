---
title: "Shell scripting: why, how, and what not to do"
date: 2004-09-14T19:30:00+08:00
presenters:
  - Cameron Patrick
aliases:
  - /events/seminar/2004-09/
---

This talk will be a short introduction to shell scripting, followed by
some examples from real shell scripts illustrating how the concepts fit
together. Some basic programming knowledge and a moderate understanding
of Linux command-line usage will be assumed.

<!--more-->

<!-- **Where:** Central TAFE Lecture Theatre, Perth -->

**Slides and examples:** Slides from this talk are available in [PDF
format \[60kb\]](slides.pdf). A tar.gz file containing [the example
scripts \[13kb\]](examples.tar.gz) is also available.

Craig Ringer comments:

    > A couple of quick suggestions/ideas:
    >
    > It might be an idea to mention that you're covering berkley-compatible
    > scripting, and there is another flavour (csh/tcsh/ksh) out there.
    >
    > It might also be worth mentioning that arguments can be passed on the
    > hashbang line, eg:
    > #!/bin/bash -eu
    >
    > Finally, I think 'bash -u' / 'set -u' deserves special mention, as it's
    > perhaps the single most important thing to make bash scripting less evil
    > and help the script writer retain their sanity. What crack-head thought
    > "Well, if the variable is invalid let's just substitute an empty string"
    > anyway? *grumble*
    >
    > I'd personally put 'See: autotools" in the section about reading other
    > people's code as a BRILLIANT example of a "don't" but that's just me :-P
