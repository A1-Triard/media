1. Create `media` directory in user `$HOME`, and place `refresh` script into it.

2. On Linux install `pmount` utility. That's all,
   but if you also want to have correct device file access rights,
   perform the following steps.

   2.1. Put `51-removable-disks.rules` to `/etc/udev/rules.d`.

   2.2. Change group name in `GROUP="storage"` directive in this file from `storage`
        to appropriate name in your distributive. Often it is `plugdev`.

3. On BSD install `ntfsprogs` package/port, and perform the following steps.

   3.1. Enable `fusefs` kmod loading: add `fusefs_load="YES"` to `/boot/loader.conf`.

   3.2. Allow users mount devices: add `vfs.usermount=1` to `/etc/sysctl.conf`.
   
   3.3. Change removable devices mode: add
   
       [localrules=10]
       add path 'da[0-9]*' mode 0660 group operator
   
   to `/etc/devfs.rules`, and `devfs_system_ruleset="localrules"` to `/etc/rc.conf`.

   3.4. Fix `msdosfs_iconv` "Operation not permitted" issue:
   copy `iconv_fix.sh` into `/usr/local/etc/rc.d` directory.
