---
title: "Video Streaming: Architectural Overview"
---

The goal is to produce a stream of video, with vision and audio mixed in real time, consisting of at least one camera pointed at a presenter, and a recording of their screen while they present, streamed in real-time to at least one internet-hosted location where it is viewable by outside viewers.

The project consists of three "layers":

* The network hardware, a simple router which consumes WiFi, Ethernet or 4G/5G at a location and provides it to AV equipment ("PLUG-Members" WiFi network) and, optionally, PLUG guests ("PLUG" WiFi network)
* The AV equipment, consisting of a laptop (whether PLUG-provided, or presenter-provided) with a webcam for capturing the presenter + HDMI output for presenting on a TV screen or projector at a venue.
* Archiver equipment (optional), consisting of one or more devices at the venue capturing video and audio. Alternatively, this takes the form of BigBlueButton recording, which is currently the preferred method.

Each layer is dependent on the layer above (except the network hardware, which is dependent on having some sort of internet connection to connect to).
