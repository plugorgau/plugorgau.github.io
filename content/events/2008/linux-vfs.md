---
title: "Linux Filesystem Internals"
date: 2008-03-11T19:30:00+08:00
presenters:
  - Ian Kent
aliases:
  - /events/seminar/2008-03/
---

Linux is able to support many different file systems using the same
method as other Unix variants by using a facility called the Virtual
Filesystem Switch (VFS). The VFS provides a well defined interface to
the kernel for those developing filesystem modules. This talk aims at
describing, very briefly, the structures and methods provided by the VFS
for filesystem implementers and will look more closely at a couple of
these interface functions by describing how the kernel resolves a path
to get a data structure needed for most functions in the VFS.

<!--more-->

<!-- **Where:**
\'[Futuresphere](https://web.archive.org/web/20080906110343/http://www.futuresphere.com.au/)\',
Christ Church Grammar School, Queenslea Drive, Claremont -->
