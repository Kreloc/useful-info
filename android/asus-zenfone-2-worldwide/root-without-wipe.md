# Root w/o Wipe (TODO)

These are the instructions to root your Zenfone without any data loss.

Downloads
* Download the recovery files from [techmesto.com/root-zenfone-2](https://www.techmesto.com/root-zenfone-2/).
* Download SuperSU from [forum.xda-developers.com/showthread.php?t=1538053](http://forum.xda-developers.com/showthread.php?t=1538053)

You need the following files in your working directory.
* `recovery.launcher`
* `recovery.trigger.new`
* `recovery.zip`

Put the following on your phone.
* The SuperSU update file (ex: `UPDATE-SuperSU.zip`)

## Short Instructions

* Boot into fastboot
* Put a custom recovery into working memory
  * Push the `recovery.zip` and `recovery.launcher` to the temporary folder.
  * Overwrite `logcat` with the "recovery trigger" program.
* Once the recovery stars, install SuperSu

## Long Instructions

*Retrieved from [techmesto.com/root-zenfone-2](https://www.techmesto.com/root-zenfone-2/)*

Notes:
 * Model Number: ZE551ML

**Turn on USB debugging and authorize computer.**

### Put Recovery on Memory

**Boot into fastboot.**
```
$ adb reboot bootloader
```

**Make sure your device is accessible.**
```
$ fastboot devices
```
*EXpected Output: `ABCDEF1234567     fastboot`*

**Push the recovery files to a temporary location.**
```
$ fastboot flash /tmp/recovery.zip WORKING_DIRECTORY_HERE/recovery.zip
$ fastboot flash /tmp/recovery.launcher WORKING_DIRECTORY_HERE/recovery.launcher
```
*Please replace `WORKING_DIRECTORY_HERE` with your current working directory!*

*You're going to get "Permission Denied" messages. This is normal.*

**Replace `logcat` with the trigger program.**
```
$ fastboot oem start_partitioning
$ fastboot flash /system/bin/logcat WORKING_DIRECTORY_HERE/recovery.trigger.new
```

**Stop the partitioning.**

This will start the temporary recovery.
```
$ fastboot oem stop_partitioning
```

### Install SuperSU

**In the recovery, install the SuperSU update file..**

*Important: Had trouble installing zip from sideload and external sd card. I highly recommend placing the SuperSU update file on your Android's internal memory.*

---

## Research

**SuperSU**

The su binary was made by Chainfire. This user also has an application on the Google Play Store called SuperSU; an application that manages root access for individual apps.

**update.zip**

The SuperSU update zip has a very specific structure. Every zip installed via recovery (or sideload) must conform to this structure. See [forum.xda-developers.com/showthread.php?t=1610121](https://forum.xda-developers.com/showthread.php?t=1610121).

**What does it mean to root?**

"Rooting" a phone means to place the `su` binary and the application that accesses such binary in the /system partition. For example, the `su` binary is located at `/system/xbin/su` and the SuperSU application is located at `/system/app/SuperSU/SuperSU.apk`.

**What did I do to your phone?**

The instructions above took advantage of an exploit in the firmware. Please correct me if I'm wrong, but I believe that we put our custom recovery into RAM by overwriting an active program called `logcat`. I have an idea of how this is possible but I will refrain from mentioning it here until I verify my suspicision.

**What about other methods? Like the ones that remove my data?**

A lot of other methods use a custom ROM with SuperSU built into itself. The user would flash the rom to the device which will overwrite everything. Instead, we can use an exploit that allows us to modify the current rom.

According to some sources, it should never be possible to modify/view the rom (and its files) if the bootloader is locked. Every phone is going to come with a locked bootloader for security reasons; outsiders would not be able to access your data without your permission.
