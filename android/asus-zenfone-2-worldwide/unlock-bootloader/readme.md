# Research for Asus Zenfone 2 (Worldwide)
*December 22nd, 2015*

I extracted the file at...
http://fota.asus.com/delta_package/phone/WW_Z00A/formal/WW_2.18.40.12_20150529_9543_user_rel-user-WW_Z00A-WW_2.19.40.18_20150612_1183_user_rel-user-WW_Z00A-20150612/WW_551_0529_0612_20150612.zip

I copied the droidboot.img to my working directory, and tried to flash it.

````
C:\myworkingdirectory>fastboot flash fastboot droidboot.img
target reported max download size of 536870912 bytes
sending 'fastboot' (14410 KB)...
OKAY [  0.661s]
writing 'fastboot'...
FAILED (remote: Permission denied
)
finished. total time: 0.826s
````

Ok, I got the error. Maybe the "unlock" command will work.

````
C:\myworkingdirectory>fastboot oem shell_cmd "getprop ro.isn > /factory/asuskey"
...
OKAY [  0.203s]
finished. total time: 0.204s
````

Same output as the last hundred times I tried to run it.
I rebooted the phone.

````
C:\...\myworkingdirectory>fastboot reboot-bootloader
rebooting into bootloader...
OKAY [  0.108s]
finished. total time: 0.109s
````

I put the phone into the bootloader mode. (For anyone reading, to get into the bootloader, turn the phone completely off. Hold the power button until it vibrates. Then hold the volume up key.)

I ran the unlock command twice.

````
C:\myworkingdirectory>fastboot oem shell_cmd "getprop ro.isn > /factory/asuskey"
...
OKAY [  0.291s]
finished. total time: 0.326s

C:\myworkingdirectory>fastboot oem shell_cmd "getprop ro.isn > /factory/asuskey"
...
OKAY [  0.216s]
finished. total time: 0.216s
````

Then I tried to flash the image again.

````
C:\myworkingdirectory>fastboot flash fastboot droidboot.img
target reported max download size of 536870912 bytes
sending 'fastboot' (14410 KB)...
OKAY [  0.690s]
writing 'fastboot'...
OKAY [  0.692s]
finished. total time: 1.384s
````

No error?! I have progress!

----

I believe my bootloader is unlocked. Let me try to flash the recovery. (My recovery was corrupted longggg before doing this.)

````
C:\myworkingdirectory>fastboot flash recovery recovery.img
target reported max download size of 536870912 bytes
sending 'recovery' (11676 KB)...
OKAY [  0.579s]
writing 'recovery'...
OKAY [  0.571s]
finished. total time: 1.153s
````

No permission error! (Before this, I would usually have gotten an error that says "FAILED (remote: Permission denied".)


## Important Notes

**NO WHITE BACKGROUND IN BOOTLOADER.**

Many people have reported seeing an inverted background in the bootloader. I don't have that.

**TRIPLE DOTS IN COMMAND PROMPT**

The triple dots you see when I run the unlock command are actually there. They are not placeholders.

------------

I was able to boot into recovery, flash a new rom, and open the rom with success!
