---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Extending the Windows event log"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Overview of options for extending Windows event log in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Tofoli Douglas (CC0 1.0)" -->
## Extending Windows auditing
### Sysmon and PowerShell logging

![bg right:30%](images/18-windows_mountain.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tofoli Douglas (CC0 1.0)" -->
Windows provides many knobs for
adjusting logging besides the
"audit policy".  

Many third-party tools/products
exist to extend the capabilities
even further.  
  
We'll look at two examples -
Sysmon and PowerShell audit logging.

![bg right:30%](images/18-windows_mountain.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Edenpictures (CC BY 2.0)" -->
## Meet Sysmon
Released in 2014 as a part
of Microsoft "Sysinternals".  

Hooks into Windows kernel
to intercept activity, just like many
**E**nd-point **D**etection and **R**esponse tools do.

Gratis, but very capable!  

No official support provided by
Microsoft, sadly.

![bg right:30%](images/18-eagle.jpg)

---
![bg center:100%](images/18-win_ev_sm_process_1.png)

---
![bg center:100%](images/18-win_ev_sm_process_2.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
Most of Sysmon's super powers are
not enabled by default.  

Granular configuration options
resulting in complexity.  

Community resources like
["sysmon-modular"](https://github.com/olafhartong/sysmon-modular) are
here to help!

![bg right:30%](images/18-habitat_67.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
Still not all that convinced?  
  
Let's mock an investigation!

![bg right:30%](images/18-teufelsberg.jpg)

---
![bg center:100%](images/18-win_ev_defender_alert.png)

---
![bg center:100%](images/18-win_ev_sm_file_create.png)

---
![bg center:100%](images/18-win_ev_sm_dns_query.png)

---
![bg center:100%](images/18-win_ev_sm_net_connect.png)

---
![bg center:100%](images/18-win_ev_sm_msi_exec.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
But what was happening
inside PowerShell?!

![bg right:30%](images/18-otter.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
PowerShell is loved by
admins and hackers alike.  
  
Utilizes Windows APIs instead
of spawning processes that are
easily picked up by tools like Sysmon.  
  
Supports extensive audit logging,
but it needs to be enabled.

![bg right:30%](images/18-sculpture.jpg)

---
![bg center:100%](images/18-win_menu_gp.png)

---
![bg center:100%](images/18-win_gp_start.png)

---
![bg center:100%](images/18-win_gp_ps.png)

---
![bg center:100%](images/18-win_gp_ps_block.png)

---
![bg center:100%](images/18-win_gp_ps_module.png)

---
![bg center:100%](images/18-win_ev_ps_audit.png)

---
### Log queries from PowerShell
```powershell
> Get-WinEvent \
  -LogName "Microsoft-Windows-Sysmon/Operational" \
  | where {$_.Id -eq 22} | Select-Object -ExpandProperty Message

Dns query:
UtcTime: 2023-11-12 15:14:14.430
ProcessGuid: "{944e8c49-ebbf-6550-340b-000000000700}"
QueryName: windows.metasploit.com
QueryResults: type: 5 download2.rapid7.com.edgekey.net;
              type: 5 ::ffff:92.123.206.32;
Image: C:\Windows\System32\WindowsPowerShell\v1\powershell.exe
User: "LAB-LOG-WIN-1\Administrator"
[...]
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Stefan Brending (CC BY-SA 3.0 DE)" -->
**Yo dawg, I heard you like logs...**

![bg right:30%](images/18-xzibit.jpg)

---
![bg center:100%](images/18-win_ps_audit_log_log.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tofoli Douglas (CC0 1.0)" -->
## Closing thoughts
While many third-party tools exist to aid
threat detection and incident response on
MS Windows, we can get far for free with
official tools and a bit of configuration.

![bg right:30%](images/18-windows_mountain.jpg)
