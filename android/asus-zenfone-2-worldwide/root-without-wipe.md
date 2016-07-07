# Root w/o Wipe (TODO)

These are the instructions to root your Zenfone without any data loss.

Notes:
 * Model Number: ZE551ML

Turn on USB debugging and authorize computer.

`adb reboot bootloader`

`fastboot oem shell_cmd "getprop ro.isn > /factory/asuskey"`
...

`fastboot flash /tmp/recovery.zip "RecoveryFileNameHere.zip"`
