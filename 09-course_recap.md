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
<!-- _footer: "%ATTRIBUTION_PREFIX% Helsinki Hacklab (CC BY 2.0)" -->
# Course recap
### Let's refresh our memory

![bg right:30%](images/09-beer_tap.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bruno Cordioli (CC BY 2.0)" -->
## Time and clocks
Very messy, but important - especially for enabling log correlation!  

Whenever possible, normalize time zone configuration (preferably UTC).  

**NTP** helps us keep our clocks in sync.  
  
**NTS** prevents MITM attacks and
**PTP** improves precision.

![bg right:30%](images/09-capsule_house.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
## Network traffic logging
Capture all traffic flowing across the network
using tap/mirror/span functionality in switches.
  
Easy to implement **inspection-based** logging.  

Requires lots computing resources and storage,
encrypted traffic is a challenge.  

**NIDS** are a middle-ground that just looks for
suspicious traffic using IoCs/rulesets.  

![bg right:30%](images/09-wire_pole.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## Flow logging
Only log and store traffic metadata.  
  
**Network flow \~=
same peers, protocol and
(when applicable) port.**  

Routers and networking gear provides
HW-based support for **NetFlow/IPFIX**.  

(In many cases extremely) useful for
both **NOC** and **SOC**.

![bg right:30%](images/09-spheres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% ETC Project (CC0 1.0)" -->
UNIX-like systems have historically populated
**/var/log** with a bunch of text files.  

GNU Coreutils provides several useful tools 
for text data filtration/extraction.  

- **cut**: Split/filter lines into distinct fields
- **wc**: Count lines/bytes of input data
- **uniq**: Basic data aggregation
- **tr**: Various clean-up tasks
- **date**: Voodoo-magic with date time

And let's not forget GNU grep!
_("sed" is not a part of Coreutils)_

![bg right:30%](images/09-computer_man.jpg)

<!--
https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kristoffer Trolle (CC BY 2.0)" -->
**Choo choo - let's move on!**

![bg right:30%](images/09-monorail.jpg)
