# Root w/o Wipe (TODO)

These are the instructions to root your Zenfone without any data loss.

Downloads
* Download the recovery files from [techmesto.com/root-zenfone-2](https://www.techmesto.com/root-zenfone-2/).
* Download SuperSU from [forum.xda-developers.com/showthread.php?t=1538053](http://forum.xda-developers.com/showthread.php?t=1538053)

You need the following files in your working directory.
* `recovery.launcher`
* `recovery.trigger.new`
* `recovery.zip`

Put the following on your external SD card.
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

**In the recovery, install the SuperSU update file from your external SD card.**
