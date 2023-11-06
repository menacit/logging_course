---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Laws and standards"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to relevant laws and standards for logging"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
# Laws and standards
### Staying compliant with logging

![bg right:30%](images/11-biosphere.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
As previously mentioned,
much regulation requires us
to log security/privacy related
activity, either directly or indirectly.

We'll limit our scope to
IT related laws/standards.

![bg right:30%](images/11-cyberpunk_wall.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## GDPR
**G**eneral **D**ata **P**rotection **R**egulation.  
  
Restricts how PII and be stored/processed.  
  
Requires logging when PII is accessed by employees/third-parties.  

Especially tricky/costly considering the wide definition of personal data.  

(Who watches the watchers?)

![bg right:30%](images/11-retro_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
## NIS(2)
Directive on security of
**N**etwork and **I**nformation **S**ystems.  

Puts security-related requirements on
operators of critical infrastructure/services.  
  
Following the baseline and reporting requirements
without logging is near impossible.  

![bg right:30%](images/11-power_line.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bill Badzo (CC BY-SA 2.0)" -->
## DORA
**D**igital **O**perational **R**esilience **A**ct.  

Attempt to harmonize IT security regulation for
financial-sector companies within the EU.  

Puts requirements on monitoring, logging and incident reporting.  

Similar rules exist in most finance/banking regulation.

![bg right:30%](images/11-keenan_building.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## LEK and Data Retention Directive
**L**agen om **E**lektronisk **K**ommunikation.  

Swedish regulation declaring metadata logging
requirements for Internet/telephony providers,
among other things.  

The Data Retention Directive tried to unify
similar regulation within the EU, but was
declared unlawful by the Court of Justice.  

Logs must be stored for
**two, six or ten months** depending on content.
Longer retention may be illegal.

![bg right:30%](images/11-log_book.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Alan Levine (CC0 1.0)" -->
## PCI DSS
**P**ayment **C**ard **I**ndustry
**D**ata **S**ecurity **S**tandard.  

Requirement #10:
> Track and monitor all access to
> network resources and cardholder data

Scope managed by using an isolated
**C**ard **D**ata **E**nvironment.

![bg right:30%](images/11-payphone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## ISO 27001
Requires regular review of
security-related events from
_sensitive_ systems.

NTP or equivalent solution is
mandatory.

For details, check out
A.12.4: "_Logging and monitoring_".

![bg right:30%](images/11-skeleton.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pumpkinmook (CC BY 2.0)" -->
## When not to log
Privacy laws and labor unions protects
certain employee activity on corporate
IT systems, regardless of ownership.

Be especially considerate of
legitimate interest when working
with logs from sources like **EDR**
tools, mail servers and SSL interceptors.

Ensure that signed and understood
usage polices are in place to CYA.

![bg right:30%](images/11-glitch_face.jpg)
