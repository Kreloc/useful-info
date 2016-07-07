# Acer Aspire V3 731-4649

## Audio

This computer uses the `Intel Corporation 7 Series/C210 Series Chipset Family High Definition Audio Controller (rev 04)`
The audio works with the following configuration.

*Load module (use root user)*

 - `modprobe snd-hda-intel`
 - `echo "options snd_hda_intel index=1" > /etc/modprobe.d/alsa.conf`

*Pacmd*

 - `pacmd set-sink-volume 1 125536`

*Set max volume*

 - `amixer set Master 100%`

*Test sound*

 - `aplay /usr/share/sounds/alsa/Front_Center.wav`

*Other commands*

View playback hardware devices
: `aplay -l`

View audio devices
: `lspci | grep -i audio`

### Bluetooth

`apt-get install firmware-atheros`

Reboot system

#### Bluetooth Application

Try `blueman` as a standalone application to control your bluetooth controller.
