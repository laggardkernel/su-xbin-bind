# su xbin_bind (Magisk)

### Intro

bind mount existing su binary as /system/xbin/su to solve su undetectable issue with some apps.

- Create a soft link as /system/xbin/su,
- which points to an existing su binary from MagiskSU, phh's superuser, SuperSU or the kernel.
- Su binary will **NOT** be added by the module itself.
- Root your devices beforehand.

### Credit

- [Magisk - Root & Universal Systemless Interface \[Android 5.0+\]](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445) by [topjohnwu@XDA](https://forum.xda-developers.com/member.php?u=4470081)
- [su xbin_bind](https://github.com/laggardkernel/su-xbin-bind) by [laggardkernel@GitHub](https://github.com/laggardkernel)

### Support

- [[Magisk][Module] Su xbin_bind post](https://forum.xda-developers.com/apps/magisk/magisk-suxinbind-t3564673) on XDA
