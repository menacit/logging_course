---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Integrity monitoring"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to file and system integrity monitoring in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
# Integrity monitoring
### A somewhat gentle introduction

![bg right:30%](images/32-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
So you wanna protect the integrity of
your files and perhaps the whole system?  

Several options besides simple FIMs.  
  
Let's talk about some of them!

![bg right:30%](images/32-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kevin Dooley (CC BY 2.0)" -->
## General considerations
Storage or runtime detection/protection?  

Protection/Flexibility of configuration?  
  
Overlap with other software/security products?
  
Platform support?  
  
![bg right:30%](images/32-plants.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Adam Greig (CC BY-SA 2.0)" -->
## FOSS providing FIM
- Tripwire Open Source
- Samhain
- ~~OSSEC~~ Wazuh
- osquery
- auditd
- **Auditbeat**

![bg right:30%](images/32-outdoors_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
Knowing which files to include on the
FIM watch-list can be tricky.  

Disk/File system snapshots can be
useful alternative/complement.

![bg right:30%](images/32-man_statue.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
The state of systems change over time as
applications gets installed/updated and
administrators modify configuration.  

Properly managing a FIM database can be
very time-consuming, making investigation
and recovery after an incident challenging.

Usage of immutable systems, such as Docker
containers, can greatly reduce the burden
(especially when combined with a read-only
file system configuration).

![bg right:30%](images/32-snow_spheres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
How can we trust the FIM if the
system has been compromised?  

Let's talk a bit about boot and
runtime integrity protection.

![bg right:30%](images/32-broken_cpu.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jusotil 1943 (CC0 1.0)" -->
## What's "secure boot"?
Not just a thing to make neckbeards mad!  

Utilizes cryptographic signatures during
the computer's boot process to prevent
execution of untrusted firmware and
operating systems.  
  
Most systems ship with a trust store
managed by Microsoft, some support
configuration of custom keys/CAs.  

"Measured boot" is its upcoming sibling,
focusing on logging/hashing executed code. 

![bg right:30%](images/32-rusted_cards.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
## Linux's IMA
**I**ntegrity **M**easurement **A**rchitecture.  

Monitors execution of programs and performs
hashing of their content _("measurement")_
before execution.  

Can be used to verify runtime integrity and
notify administrators if unexpected
applications are run.

![bg right:30%](images/32-pcb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
**T**rusted **P**latform **M**odule.  
  
Common hardware chip (or CPU feature) capable
of storing secrets and performing basic
cryptographic operations.  

Hash-chaining is used to store measurements
in **P**latform **C**onfiguration **R**egister.  

The TPM can be configured to unlock a secret,
such as a disk encryption key, when a PCR
contains specific value/measurement,
as a boot/runtime integrity check.

Even better: produce an attestation report!

![bg right:30%](images/32-padlocks.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kuhnmi (CC BY 2.0)" -->
If you think this sounds cool/useful,
checkout [Keylime](https://keylime.dev/) and the
["System Transparency" project](https://www.system-transparency.org/).  

You can also check out Joel's talk
from SEC-T, which is [available on YouTube](https://youtu.be/vdj9Pr-6dq8).

![bg right:30%](images/32-kolibri.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
## Conclusions
Integrity protection ain't just
about basic FIMs.  
  
Usage of immutable systems
surely simplifies monitoring
of state changes.

TPM + Measured boot + IMA ~= <3  

![bg right:30%](images/32-cyborg_streetart.jpg)
