---
layout: page
title: "Video Streaming: Architectural Overview"
permalink: /projects/video/overview/
---

The goal is to produce a stream of video, with vision and audio mixed in real time, with live overlays and titling, outputting to an Icecast server (or a tree of Icecast relay servers).

We'll start by talking about the top of the tree: the switching desk.

The switching software selects between a stream of data, and may mix streams with some limited options (eg, dissolve, overlay).

Due to the limited cable length of Firewire cables, each video source is connected to a local PC, which captures the DV frames, and forwards them over the local network. We will use a wired 100 MBit or faster network where possible, with supplemental video source coming from other networks if needed.
