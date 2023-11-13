---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Windows logging"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Basics of logging in Microsoft Windows"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Daniel Oliva Barbero (CC BY 2.0)" -->
# Windows logging

![bg right:30%](images/17-vapor_windows.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Daniel Oliva Barbero (CC BY 2.0)" -->
Like any other platform worth its name,
Microsoft Windows produces logs.  

The way it does this is however slightly different.

![bg right:30%](images/17-vapor_windows.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ted Eytan (CC BY-SA 2.0)" -->
## Event logging subsystem
Provides APIs for structured OS and application logging.  

Handles event retention/rotation.

Stores logs on disk in a custom binary format, exposed to consumers as XML.  
  
Supports log forwarding.  
  
Tries to solve many of the same problems as syslog.

![bg right:30%](images/17-teardown.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ted Eytan (CC BY-SA 2.0)" -->
**Let's have a look, shall we?**

![bg right:30%](images/17-teardown.jpg)

---
![bg center:100%](images/17-win_menu_ev.png)

---
![bg center:100%](images/17-win_ev_start.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Roy Luck (CC BY 2.0)" -->
## Let's generate an event
```
> eventcreate.exe \
  /L APPLICATION /SO MyMockApp \
  /ID 123 /T WARNING \
  /D "Look at me ma - I'm logging!"
```

![bg right:30%](images/17-oil_refinery.jpg)

---
![bg center:100%](images/17-win_ev_custom_event.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## What does the OS log?
Primarily configured using the "audit policy".  

Most capabilities are turned off by default, enabling them all makes system unusable.  

Requires customization depending on
your use-case.  

Have a good look at
[Microsoft's "Audit Policy Recommendations"](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/security-best-practices/audit-policy-recommendations)
and [CIS's Windows benchmark](https://www.cisecurity.org/cis-benchmarks)
for guidance/inspiration.

![bg right:30%](images/17-buttons.jpg)

---
![bg center:100%](images/17-win_menu_sec_pol.png)

---
![bg center:100%](images/17-win_sec_pol_start.png)

---
![bg center:100%](images/17-win_sec_pol_audit_start.png)

---
![bg center:100%](images/17-win_sec_pol_audit_opts.png)

---
![bg center:100%](images/17-win_sec_pol_audit_info.png)

---
![bg center:100%](images/17-win_ev_auth_fail_1.png)

---
![bg center:100%](images/17-win_ev_auth_fail_2.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
That's neat, but not too exciting.  

Let's have a look at the
**F**ile **I**ntegrity **M**onitoring
capabilities provided by "Object auditing".

![bg right:30%](images/17-wallcrack_blue.jpg)

---
![bg center:100%](images/17-win_sec_pol_object_start.png)

---
![bg center:100%](images/17-win_sec_pol_object_info.png)

---
![bg center:100%](images/17-win_ex_sec_opts_tab.png)

---
![bg center:100%](images/17-win_ex_audit.png)

---
![bg center:100%](images/17-win_ex_audit_policy.png)

---
![bg center:100%](images/17-win_ev_file_write_1.png)

---
![bg center:100%](images/17-win_ev_file_write_2.png)

---
![bg center:100%](images/17-win_ev_file_delete.png)

---
![bg center:100%](images/17-win_ev_file_read.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Brandt (CC0 1.0)" -->
## Log forwarding/collection
**W**indows **E**vent **F**orwarding and  
**W**indows **E**vent **C**ollector.  

Built-in capability, slightly
tricky to configure.  

Supports "source initiated" (push)
and "collector initiated" (pull).  

Events are transferred using
authenticated/encrypted HTTP(S).  

Often used in combination with
a third-party logging agent.

![bg right:30%](images/17-neon_voxel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## Conclusions
Capable, but quite different.  

Structured logging, but often
requiring a schema/lookup table.  

Highly configurable, for better
and/or worse.  

For configuration guidance,
check out [CIS benchmark](https://www.cisecurity.org/cis-benchmarks).

![bg right:30%](images/17-negative_photo.jpg)
