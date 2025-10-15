---
title: "April Talk: Confined applications on the desktop"
date: 2018-04-10T18:00:00+08:00
presenters:
  - James Henstridge
---

Traditionally, Linux distributions have relied on package archives
maintained by groups of trusted maintainers. While this works well,
users often end up looking to third party sources for newer versions
or software missing from the main archive. This can reduce the
security of a system, since traditional packaging systems place a lot
of trust in the package maintainers (e.g. running scripts as root
during package installation).

This talk will look at the snapd packaging system, which is inspired
by the confinement strategies used for smart phone applications. In
particular, it will look at how it is used on the Ubuntu Desktop.
