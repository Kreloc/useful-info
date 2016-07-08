# Root w/o Wipe (TODO)

These are the instructions to root your Zenfone without any data loss.

## Short Instructions

* Boot into fastboot
* Push the `recovery.zip` and `recovery.launcher` to the temporary folder.
* Start a partitioning tool
* Overwrite `logcat` with the "recovery trigger" program.
* Stop the partitioning tool

## Long Instructions

*Retrieved from [techmesto.com/root-zenfone-2](https://www.techmesto.com/root-zenfone-2/)*

Notes:
 * Model Number: ZE551ML

Turn on USB debugging and authorize computer.

```
$ adb reboot bootloader
```

```
$ fastboot devices
```

Make sure you see your device in the list. It should say something like...

> ABCDEF1234567     fastboot

**Please replace `WORKING_DIRECTORY_HERE` with your current working directory!**

```
$ fastboot flash /tmp/recovery.zip WORKING_DIRECTORY_HERE/recovery.zip
$ fastboot flash /tmp/recovery.launcher WORKING_DIRECTORY_HERE/recovery.launcher
$ fastboot oem start_partitioning

$ fastboot flash /system/bin/logcat WORKING_DIRECTORY_HERE/recovery.trigger.new
```

The next command will start the temporary recovery

```
$ fastboot oem stop_partitioning
```
