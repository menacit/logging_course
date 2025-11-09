---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Linux auditing"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to advanced Linux auditing in logging course"
keywords:
  - "logging"
  - "siem"
  - "course"
color: "#ffffff"
class:
  - "invert"
style: |
  section.center {
    text-align: center;
  }
  table strong {
    color: #d63030;
  }
  table em {
    color: #2ce172;
  }

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Micah Elizabeth Scott (CC BY-SA 2.0)" -->
# Linux auditing
### Peaking beyond /var/log/*

![bg right:30%](images/26-solder_pcb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Micah Elizabeth Scott (CC BY-SA 2.0)" -->
Applications on Linux commonly produce
security related log events and store
them in text-files or syslog.

**P**luggable **A**uthentication **M**odules
provides logging of (most) login attempts.

What about when sensitive configuration
files are modified or suspicious
processes are executed? 

Let's look at some more options for
inspection-based auditing on Linux.

![bg right:30%](images/26-solder_pcb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
## We'll talk about....
- FIM and inotify
- SELinux and AppArmor
- Audit framework
- eBPF and kprobes

![bg right:30%](images/26-rusty_key.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## FIM
**F**ile **I**ntegrity **M**onitoring.  

Detected attempts to
**C**reate, ~~**R**ead~~, **U**pdate and **D**elete
important files/directories.  

Good fit for Linux since "everything is a "file"\*.  

Typically implemented by using a database
of file hashes and scheduled checking.

![bg right:30%](images/26-broken_hdd.jpg)


---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## inotify / fanotify
Features in the Linux kernel
to monitor file access.

Watchers can be registered to notify
a user-space application about
any CRUD operation.  

Provides ability to monitor reads and
get instant notice without expensive
scheduled hashing.

Similar to "object access" auditing
on Windows.

![bg right:30%](images/26-broken_hdd.jpg)

---
```
$ sudo inotifywatch \
  --event access --event modify --event delete \
  --timeout 30 /etc/super_sensitive.conf 

Establishing watches...
Finished establishing watches, now collecting statistics.

total  access  modify  filename
7      5       1       /etc/super_sensitive.conf
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kārlis Dambrāns (CC BY 2.0)" -->
## SELinux and AppArmor
**S**ecurity **E**nhanced Linux.  
  
Extends the basic access control system
consisting of file permissions.  

Policies define what a user or program
can do on the system, like opening
spawning new processes. 
  
Both are examples of
**L**inux **S**ecurity **M**odules.  

"Permissive mode" can be used to only log
(and not block) policy violations.

![bg right:30%](images/26-boarded_door.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kārlis Dambrāns (CC BY 2.0)" -->
```
AVC avc: denied  { name_connect } for pid=1338
comm="nginx" dest=8080
scontext=system_u:system_r:httpd_t:s0
tcontext=system_u:object_r:http_cache_port_t:s0
tclass=tcp_socket permissive=0

[...]

AVC avc: denied { read } for name="sdcard" dev="tmpfs" ino=6474
scontext=u:r:untrusted_app_29:s0:c244,c256,c512,c768
tcontext=u:object_r:mnt_sdcard_file:s0
tclass=lnk_file permissive=0 app=com.example.evilapp

[...]

AVC avc: denied  { execheap } for pid=3675
comm="chromium-browse"
scontext=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
tcontext=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
tclass=process permissive=0
```

![bg right:30%](images/26-boarded_door.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## Audit framework
Feature in Linux kernel for activity auditing.  

Designed to primarily monitor security related events.  

Generated audit records can be consumed by a user-space application for processing/storage.  
  
Only supports one consumer at a time\*.

![bg right:30%](images/26-bird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## Auditd
Historically the main consumer of
audit framework events.  

Provides "rule configuration" and
logging to file/remote hosts.  

Monitor system calls, file access
and "various interesting things".
  
Performs basic event correlation,
allowing user activity tracing
even if tools like sudo are used.

![bg right:30%](images/26-bird.jpg)

<!--
https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/security_guide/sec-audit_record_types#sec-Audit_Record_Types
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
```
type=USER_CMD msg=audit(1700115169.839:611):
pid=8527 uid=1900 auid=1900 ses=1
subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
msg='cwd="/var/www/html/cgi.bin" cmd="whoami" exe="/usr/bin/sudo"
terminal=pts/3 res=success'UID="webapp" AUID="webapp"

[...]

type=NETFILTER_CFG msg=audit(1700164312.524:77):
table=nat:2 family=2 entries=7 op=nft_register_chain pid=1337
subj=system_u:system_r:iptables_t:s0 comm="nft-manager"

[...]

type=ANOM_PROMISCUOUS msg=audit(1700115655.202:694):
dev=wlan0 prom=256 old_prom=0
auid=901 uid=0 gid=0 ses=1AUID="persbrandt" UID="root" GID="root"
```

![bg right:30%](images/26-bird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
```
-D
-b 8192
-f 1
-a exit,always -F arch=b32 -S mount -S umount -k mount
-a exit,always -F arch=b64 -S mount -S umount2 -k mount
-w /bin/su -p x -k priv_esc
-w /usr/bin/sudo -p x -k priv_esc
-w /usr/sbin/stunnel -p x -k stunnel
-w /etc/cron.weekly/ -p wa -k cron
-w /etc/shadow -k etcpasswd
-a exit,always -F arch=b64 -F euid=0 -S execve -k rootexec
-a exit,always -F arch=b32 -F euid=0 -S execve -k rootexec
-w /etc/sudoers -p rw -k priv_esc
-e 2
```

![bg right:30%](images/26-bird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
[auditbeat](https://www.elastic.co/beats/auditbeat) and [osquery](https://www.osquery.io/)
are other audit framework consumers.

(We'll get back to auditbeat later!)

![bg right:30%](images/26-bird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## kprobes and eBPF
kprobes can be used to dynamically instrument
most kernel functions/routines.  

eBPF enables developers to create small programs
that can be executed in "kernel-space" when
hooked events occur and do anything\*!

Starting to replace audit framework, LSM and
similar features due to its flexibility.

![bg right:30%](images/26-bees.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## Notable users
- [Falco](https://falco.org/docs/)
- [Cilium](https://cilium.io/use-cases/protocol-visibility/)
- [eCapture](https://github.com/gojue/ecapture)
- [Sysmon for Linux](https://github.com/Sysinternals/SysmonForLinux)

![bg right:30%](images/26-bees.jpg)

<!--
https://sysdig.com/blog/getting-started-writing-falco-rules/
https://falcosecurity.github.io/rules/
https://cilium.io/
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
Many amazing, such wow!  

There are however some downsides,
as always...

![bg right:30%](images/26-outdoors_pcb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Ain't all chocolate and roses
Auditing all system activity requires
a bunch of CPU cycles and storage space.  

As with other inspection-based logging,
it ain't always easy to understand
why something is happening.

![bg right:30%](images/26-outdoors_pcb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jorge Franganillo (CC BY 2.0)" -->
## Wrapping up
We'll play with auditbeat
in the next lab.  

If you can't wait, I recommend
installing and configuring Falco
to detect if a Docker container
tries to spawn a shell/initiate
a network connection.

![bg right:30%](images/26-forest.jpg)
