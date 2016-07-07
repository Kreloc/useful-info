# Recovery, ASUS Zenfone 2 (Worldwide)

To boot into recovery, go into the bootloader. Press the volume down until you see "Recovery".

Wait till you see the android error icon. Hold `Power`. Wait 1 second, quickly press `Volume Up`, and release **all** of the buttons.

## Stock Recovery

Unlock bootloader if not unlocked. [Click here for the instructions.](unlock-bootloader/)

Download the recovery `.img` file for your phone.

Flash the file using fastboot

````
fastboot flash recovery stock-recovery.img
````

## Custom Recovery

Unlock bootloader if not unlocked. [Click here for the instructions.](unlock-bootloader/)

Download version 2.8.7.0 at [teamw.in/devices/asuszenfone2.html](http://www.teamw.in/devices/asuszenfone2.html)

Flash the file using fastboot

````
fastboot flash recovery twrp-2.8.7.0-Z00A.img
````
