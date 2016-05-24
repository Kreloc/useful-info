# Linux April Fools 2016

## Prank 1 (Music)

Download a song of your choice.

Create a script to play a portion of the song automatically.

```
$ cat /home/theuser/Music/play-music
#!/bin/bash

# This will use The Final Countdown.

mplayer -af volume=8:1 -ss 118 -endpos 13 /home/theuser/Music/final_countdown.mp3 &
```

Create an autostart entry.
```
$ cat 
[Desktop Entry]
Type=Application
Name=April Fools
NoDisplay=true
Exec=bash /home/theuser/Music/play-music
```

Log-off and log-on!

## Prank 2 (Random Matrix)

Download the `cmatrix` package.

Create a script to run the matrix on another terminal.

```
$ cat /home/theuser/Documents/random-matrix-init
#!/bin/bash

setsid sh -c "cmatrix -u 0 <> /dev/tty2 >&0" &
```

Create a script to run the matrix forever

```
$ cat /home/theuser/Documents/random-matrix-4ever
#!/bin/bash

while true; do sleep 1; /home/theuser/Documents/random-matrix; done &
```

Create the random script.

```
$ cat /home/theuser/Documents/random-matrix
#!/bin/bash

((RANDOM%10==0)) && su -c "chvt 2;sleep 0.5;chvt 7"
```

