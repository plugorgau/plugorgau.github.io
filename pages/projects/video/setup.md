---
layout: page
title: Video Setup Procedure
permalink: /projects/video/setup
---

This procedure is to take you from packed up boxes to a live stream. Follow all the steps, none of them are optional unless marked.

## Step 1 - DV Switch & Streaming

Get the main system up and running first and get a stream happening with our pre-recorded PLUG loop. With multiple people helping out then have someone take care of this while the others can get on with Step 2 in parallel.

1. Boot AV2 and start up DV Switch (use the "latest" desktop icon)
2. send pre-recorded PLUG intro loop to dvswitch:  
   ```
   cd ~/Desktop/PLUG-Video/
   dvsource-file -h localhost -p 1234 -l PLUG\ Live.dv
   ```
3. You should see the stream in DV Switch
4. stream the output to our icecast server:  
   ```
   dvsink-command -h 127.0.0.1 -p 1234 -- ffmpeg2theora - -f dv -F 25:5 --speedlevel 0 -v 4 -a 0 -c 1 -H 9600 -o - | oggfwd icecast.plug.org.au 8000 password /PLUG-live.ogg
   ```
5. verify icecast server can see the stream (PLUG-live.ogg): http://icecast.plug.org.au:8000/
6. verify the stream is watchable, use VLC or some other network capable media player with URL: http://icecast.plug.org.au:8000/PLUG-live.ogg

## Step 2 - Video & Audio Sources

For each Camera (use AV3 and AV4) or Twinpac (use AV1) system:

1. Boot system and plug in FW device. Only one FW device per computer.
2. send video to dvswitch with: `dvsource-firewire -h av2.local -p 1234`
3. go to AV2 and check you can see the stream coming into DV Switch

For the audio from the mixing desk use line-in on AV2:

1. connect the wireless mic input to system, use the audio control panel to check the audio levels, it may need amplifying (especially if direct from wireless mic, otherwise adjust level on the mixing board).

2. now send the audio to dvswitch with: `dvsource-alsa -h av2.local -p 1234 hw:X`  
(check the hw device for capture with "aplay -l" and make sure you get the right one!)

## Step 3 - AV Team Communications (with mumble)

We have USB headsets for AV team communications using the mumble client. This avoids any issues with onboard audio and we know the USB headsets work well.

1. connect a USB headset to your system
2. open the audio settings and make sure both in/out sources have the USB headset selected.
3. start the mumble client and connect to av2.local.
4. you may need to run the mumble audio setup wizard to ensure levels are all good

When using mumble - stay muted unless you need to talk.

## Step 4 - Pre-Live Testing

At this point DV Switch should be running and streaming the PLUG intro loop, we should also have one or more other sources connected to DV Switch. With pre-live testing we want to ensure audio levels are coming through OK, we can record OK, a last check of the streaming server, initial camera angles and framing are good, and AV team comms are good.

1. Monitoring, from the local network:  
  ```
  dvsink-command -h av2.local -p 1234 -- mplayer -
  ```
2. Recording the output to disk:  
  ```
  cd /storage/av/
  mkdir
  cd
  dvsink-files -h localhost -p 1234 something.dv
  ```
3. NOTE: the above sets up record but no recording takes place until you select the Record button in the DV Switch interface. Each time you stop/start recording a new file is created.
4. Do a test recording with proper audio. i.e. use the speakers mic (wireless probably) and make sure they're away from other mic sources like the video cameras. Make sure you've selected the correct audio source in DV Switch and hit the record button. You only need a short recording (20 seconds). Once it's done play back the recording with mplayer or vlc with headphones connected and make sure the audio is good. If not then there is some tweaking to do...
5. Double check the stream is still live
6. Check feeds in DV Switch and make sure you're familiar with each (video and audio). Audio is critical so make sure you're on the correct audio feed at all times.

## Step 5 - Going Live
1. Switch over to video and audio feeds for host
2. Hit Record and signal we're rolling
3. the rest is in your hands

## Known Issues
 * Remove TAPES from video cameras if they happen to be in there (usually causes problems)
 * Audio out doesn't work on AV1.
 * AV2 sometimes has a problem booting - please wait as POSTing is slow, if that doesn't work then power it off and on.
 * Plugging 2 FW devices into the one computer is asking for trouble in the form of: both devices stop working, hangs, one works other breaks, etc... until a reboot.

## Minimum Setup Tips

If there is inadequate help then do a minimum setup. Still use the steps above as a guide but only go with the one system (AV2) and one camera. Connect the camera direct to the system along with audio. If enough time then set up the screen capture device so at least you can swtich between screen and camera as needed.

TODO


Update docs to include audio mixing desk setup.
Scripts etc... to help automate or ease the whole setup process.
