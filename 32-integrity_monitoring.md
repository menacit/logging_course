---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
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
Continuous or scheduled detection?  

CRUD or just C~~R~~UD?
  
Platform support?    
  
Overlap with other security software?
  
![bg right:30%](images/32-plants.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Adam Greig (CC BY-SA 2.0)" -->
## FOSS providing FIM
- Tripwire Open Source
- Samhain
- OSSEC / Wazuh agent
- osquery
- auditd
- **Auditbeat**

![bg right:30%](images/32-outdoors_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Adam Lusch (CC BY-SA 2.0)" -->
Regardless which solution we choose,
there are some shared challenges...

![bg right:30%](images/32-rusty_x_chain.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
The state of systems change over time as
applications gets installed/updated and
administrators modify configuration.  

FIM tells us that a file has changed,
but not necessarily its contents
before and after.

(Usage of immutable systems, such as Docker
containers, can greatly reduce the burden -
especially when combined with a read-only
file system configuration).

![bg right:30%](images/32-snow_spheres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
Knowing which files to include on
the FIM watch-list can be tricky -
especially with confidence when if
performing incident recovery.

Some sensitive files, like databases,
are modified continuously during
normal usage of the system.

During forensic analysis, it may be
interesting to inspect changes in
files that aren't critical to system
integrity, like web browser history.

![bg right:30%](images/32-man_statue.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brocken Inaglory (CC BY-SA 3.0)" -->
Disk/File system snapshots can
be a useful complement...

![bg right:30%](images/32-yellowstone_canyon.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Cory Doctorow (CC BY-SA 2.0)" -->
## Disk snapshots
Copy storage medium bit-by-bit
to create a clone/replica.
  
Provides something pristine we can
analyze without fear of changes.

Hardware-based solutions exist
that have been certified to not
affect the original medium.
  
Preferable for forensic use-cases,
but requires lots of storage space.

![bg right:30%](images/32-tape_library.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Joel Rangsmo (CC BY-SA 4.0)" -->
## File system snapshots
Copy allocated parts of file system,
enables incremental backups limited
to files that have been changed.

May be performed continuously.

Windows' **V**olume **S**hadow **C**opy and
file systems using **C**opy-**o**-**W**rite,
such as APFS, BTRFS and ZFS, make
the process quite efficient!

![bg right:30%](images/32-rusty_shopping_basket_and_bike.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nirvana Studios (CC BY 4.0)" -->
Once we have two snapshots that we
wanna compare, tools like [diffoscope](https://diffoscope.org/),
["The Sleuth Kit"](https://www.sleuthkit.org/) and commercial
offerings such as [OpenText Forensic](https://www.opentext.com/products/forensic)
can help us make sense of it.

(Advanced forensic analysis is an
interesting topic, but out-of-scope
for this course, I'm afraid!)

![bg right:30%](images/32-installation_the_singularity.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
How can we trust the FIM or
any other logs if the system
has been compromised?  
  
I've told you that you shouldn't,
but that ain't always very practical. 
  
Let's talk a bit about boot and
runtime integrity protection...

![bg right:30%](images/32-broken_cpu.jpg)

---
![bg center 90%](diagrams/32-basic_boot.svg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jusotil 1943 (CC0 1.0)" -->
## What's "secure boot"?
Not just a thing to make neckbeards mad!  
  
Utilizes cryptographic signatures during
the computer's boot process to prevent
execution of untrusted firmware,
loaders and operating systems.  
  
Each component in the boot chain is
responsible for verifying the next.
  
Most systems ship with a trust store
managed by Microsoft, some support
configuration of custom keys/CAs.  

![bg right:30%](images/32-rusted_cards.jpg)

---
![bg center 90%](diagrams/32-secure_boot.svg)

---
![bg center 90%](diagrams/32-uki_boot.svg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Adam Lusch (CC BY-SA 2.0)" -->
"Measure boot" takes it a further!
  
Each component in the boot chain is
responsible for verifying the next
and storing its hash digest in a
hash chain, typically provided
by a TPM or similar HSM.

Enables us to know what software
was booted, not just that it was
cryptographically signed.

Sometimes used in combination with
"TPM attestation" to verify system state
before providing access to secrets.

![bg right:30%](images/32-surveying_equipment.jpg)

---
![bg center 90%](diagrams/32-measured_boot.svg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
What about integrity monitoring
and protection post-boot?

![bg right:30%](images/32-padlocks.jpg)

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

May also be used to block execution of
modified/untrusted programs, but comes
with many gotchas and complexity.

![bg right:30%](images/32-pcb.jpg)

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

TPM \+ Measured boot \+ IMA \~= \<3  

While improving trust in the
system, there may still be
vulnerabilities affecting
its trustworthiness.

![bg right:30%](images/32-cyborg_streetart.jpg)
