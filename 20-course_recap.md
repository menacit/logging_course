---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Course recap"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Recap of material covered in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Brandt (CC0 1.0)" -->
# Course recap
### Let's refresh our memory

![bg right:30%](images/20-tree_glitch.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Miske (CC BY-SA 2.0)" -->
## Regular expressions
Language for pattern matching and
data extraction.

Defacto standard for massaging
unstructured log data.

Practice your skills using sites
like [RegexOne](https://www.regexone.com/)!

![bg right:30%](images/27-abandoned_silo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ninara (CC BY 2.0)" -->
## Common formats
We want structured data to enable
better querying/filtering.  

Key-values, CSV, JSON and XML
are commonly used formats.  

Usage of binary storage/transfer of
logs decrease overhead/cost.

The **C**ommon **E**vent **F**ormat
and **E**lastic **C**ommon **S**chema
exist to provide standardized naming
and data types for fields in logs.

![bg right:30%](images/27-ahmedabad.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Bocek (CC BY 2.0)" -->
## Transfer methods and protocols
Syslog is a common, but flawed, protocol
for sending log events over a network.  

**G**raylog **E**xtended **L**og **F**ormat
aims replace syslog and supports several
different transfer mechanisms,
such as UDP and TCP + TLS.  

HTTP(S) is a popular option due to its
wide support, but introduces overhead.  

![bg right:30%](images/27-telephone_pole.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Edenpictures (CC BY 2.0)" -->
## Logging on Windows
The kernel, system services and
most applications rely on the
Windows event log subsystem.  

Log data is structured and stored on
disk in a custom binary XML format.  
  
**W**indows **E**vent **F**orwarding uses
HTTP or HTTPS for transferring events to
a **W**indows **E**vent **C**ollector.

Tweaked through audit policies and
can be extended using tools like Sysmon.

![bg right:30%](images/27-abstract_building.jpg)
