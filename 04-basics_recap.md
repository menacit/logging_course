---
SPDX-FileCopyrightText: © 2026 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Basics recap"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Basics recap in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergio Delgado (CC BY 2.0)" -->
# Basics recap
### Let's refresh our memory

![bg right:30%](images/04-sloth.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Raphaël Vinot (CC BY 2.0)" -->
## Logging helps us...
- Debug and optimize systems
- Understand user behavior and adapt UX
- Find another venue for revenue
- **Detect/Investigate malicious activity**
- Comply with rules and regulation

![bg right:30%](images/04-observatory_instruments.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
### Operational logs
Enables us to understand why a
system is behaving a certain way.

### Audit logs
Helps to build a timeline of activity.

**W**hen, **w**ho, **w**hat, **w**here
and (possibly) **w**hy?

![bg right:30%](images/04-cave_stairs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
**Both may contain security-related events!**

![bg right:30%](images/04-cave_stairs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
Centralized logging services often serve as the basis for a...  

**S**ecurity
**I**nformation and
**E**vent
**M**anagement system.

![bg right:30%](images/04-seal.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
If you take a SIEM and add a bit of
(semi-)automated handling, you got a...

**S**ecurity
**O**rchestration,
**A**utomation and
**R**esponse system.

![bg right:30%](images/04-seal.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Hrdina (CC BY-SA 2.0)" -->
## Benefits of centralized logging
- Ease correlation
- Minimizes risk of tampering
- Optimize performance and cost

![bg right:30%](images/04-containers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rick Harris (CC BY-SA 2.0)" -->
## Beware of...
- Performance overhead
- Cost of processing, storage and analysis
- Logging of sensitive information
- Legal/Compliance challenges

![bg right:30%](images/04-plant_car.jpg)

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
<!-- _footer: "%ATTRIBUTION_PREFIX% Yves Sorge (CC BY-SA 2.0)" -->
**Let's move on,
we got a lot to cover!**

![bg right:30%](images/04-neon_forest.jpg)
