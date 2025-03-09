---
title: "Video Streaming Project History"
date: 2025-03-09T13:18:35+08:00
draft: true
---

Over the years, PLUG has gone through multiple generations of its
video recording/streaming system.

## Version 1: DVswitch

The first recording system was based on [DVswitch][DVswitch]. This was
a client/server video mixing system:

* Clients read DV video or audio sources, and send it over the network.
* Server provides a UI allowing an editor to mix audio and video
  sources in real time to stream online or record to disk.

Our video sources were:

 * [Canon Vixia HV30][Canon] DV camcorders.
 * [Canopus Twinpact 100][Twinpact] VGA capture device. Connected
   between presenter's laptop and projector to capture their slides.

Both devices provided a DV video feed over Firewire, which could be
captured by a laptop and sent over the network using
`dvsource-firewire`.

Microphone audio was routed via a small mixing board that appeared as
a USB sound card, which was sent via `dvsource-alsa`.

These would all feed in to DVswitch, which would produce an output
stream that could be sent to an Icecast server for streaming and
written to disk for later processing.

[DVswitch]: https://web.archive.org/web/20180326132702/http://dvswitch.alioth.debian.org/wiki/
[Canon]: https://global.canon/en/c-museum/product/dhc738.html
[Twinpact]: https://archive.org/details/manualzz-id-908869


## Version 2: BigBlueButton

In 2020 during the COVID pandemic lockdowns, we started investigating
ways of holding meetings remotely. One piece of software we considered
was [BigBlueButton][BBB]: an Open Source web based video conferencing
system with a focus on classroom style meetings with a single
presenter talking to a large audience members.

While we never ended up using BBB for fully remote meetings, it did
offer a way to improve our ability to record in-person meetings:

* Through the use of an HDMI capture device, we could make our
  existing cameras appear as USB webcams.
* As the mixing board acts as a USB sound card, so behave similar to a
  headset.
* The presenter could log in to BBB to show slides or screen share.

We could then live stream the meeting to anyone not present in-person,
and produce a recording.

It also offered a few benefits over the old DVswitch system:

* No dependence on Firewire: these expansion cards could be a bit
  unreliable and it was getting hard to source replacements.
* We were no longer limited to standard definition video.

One downside was that recordings live within the BigBlueButton
instance. Rather than a single video, the slides, screen share, and
webcam footage are all served separately and stitched together by a
web app. This would be a problem if we ever wanted to move off of BBB.

To solve this, we wrote [bbb-render][bbb-render]: some scripts to
download the various files that make up a recording and assemble them
into a [GStreamer Editing Services][GES] project. This could then
render out a single video file suitable for archive and publication on
YouTube.

This also gave an opportunity to add some PLUG branding, in the form
of opening and closing cards and a backdrop.

[BBB]: https://bigbluebutton.org/
[bbb-render]: https://github.com/plugorgau/bbb-render
[GES]: https://gstreamer.freedesktop.org/documentation/gst-editing-services/


## Version 3: OBS Studio?

