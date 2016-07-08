# Root w/o Wipe (TODO)

These are the instructions to root your Zenfone without any data loss.

## Short Instructions

* Boot into fastboot
* Put a custom recovery into working memory
  * Push the `recovery.zip` and `recovery.launcher` to the temporary folder.
  * Start a partitioning tool
  * Overwrite `logcat` with the "recovery trigger" program.
  * Stop the partitioning tool
* Install SuperSu

## Long Instructions

*Retrieved from [techmesto.com/root-zenfone-2](https://www.techmesto.com/root-zenfone-2/)*

Notes:
 * Model Number: ZE551ML

Turn on USB debugging and authorize computer.

Boot into fastboot.
```
$ adb reboot bootloader
```

Make sure you see your device is accessible.
```
$ fastboot devices
```
*EXpected Output: `ABCDEF1234567     fastboot`*

Push the recovery files to a temporary location.
```
$ fastboot flash /tmp/recovery.zip WORKING_DIRECTORY_HERE/recovery.zip
$ fastboot flash /tmp/recovery.launcher WORKING_DIRECTORY_HERE/recovery.launcher
```
**Please replace `WORKING_DIRECTORY_HERE` with your current working directory!**

Replace `logcat` with the trigger program.
```
$ fastboot oem start_partitioning
$ fastboot flash /system/bin/logcat WORKING_DIRECTORY_HERE/recovery.trigger.new
```
**Please replace `WORKING_DIRECTORY_HERE` with your current working directory!**

Stop the partitioning. This will start the temporary recovery.
```
$ fastboot oem stop_partitioning
```
