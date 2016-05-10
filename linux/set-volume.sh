#!/bin/bash
get_sink_volume() {
  SINK="$1"
  # https://unix.stackexchange.com/a/230533/97011
  pactl list sinks | grep '^[[:space:]]Volume:' | \
  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}
set_sink_volume() {
  SINK="$1"
  VOLUME="$2"
  pactl set-sink-volume $SINK $VOLUME%
}
SINK=1

LAST_VOLUME=$(get_sink_volume $SINK)

LAST_VOLUME=$(($LAST_VOLUME/2))
VOLUME=$(zenity --scale --text="Set the volume" --min-value=0 --max-value=100 --value=$LAST_VOLUME)
VOLUME=$(($VOLUME*2))

set_sink_volume $SINK $VOLUME
