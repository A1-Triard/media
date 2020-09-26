1. Create `media` directory in user `$HOME`, and place `update` script into it.

2. On Linux, install `pmount` utility. That's all.

3. On BSD perform the following steps.

   3.1. Enable `fusefs` kmod loading: add `fusefs_load="YES"` to `/boot/loader.conf`.

   3.2. Allow users mount devices: add `vfs.usermount=1` to `/etc/sysctl.conf`.
   
   3.3. Change removable devices mode: add
   
       [localrules=10]
       add path 'da*' mode 0660 group operator
   
   to `/etc/devfs.rules`, and `devfs_system_ruleset="localrules"` to `/etc/rc.conf`.

   3.4. Fix `msdosfs_iconv` "Operation not permitted" issue:
   copy `iconv_fix.sh` into `/usr/local/etc/rc.d` directory.

   3.5. That's all.
