---
SPDX-FileCopyrightText: © 2026 Menacit AB <foss@menacit.se>
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
# Course recap
### Let's refresh our memory

![bg right:30%](images/13-abandoned_chimney.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Yellowcloud (CC BY 2.0)" -->
## Centralized logging requirements
- Ingestion amount (volume/EPS)
- Availability requirements
- Use-cases and intended end-users
- Hosting and sovereignty
- Support/Competence needs
- Security and access control

![bg right:30%](images/13-chip_closeup.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kuhnmi (CC BY 2.0)" -->
## Collection and parsing
Most solutions available utilize "push-based"
collection and centralized parsing.  

**Index-time parsing** helps query performance,
but increases onboarding and storage costs\*.  

**Search-time parsing** adds a per-query cost
but increases flexibility and
lowers storage costs.

![bg right:30%](images/13-hummingbird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## Retention and storage tiers
Storing log data using
**time-based, volume-based**
or **capacity-based** retention strategies.

Optimizing cost/performance using
**hot, warm, cold, frozen** storage tiers.

![bg right:30%](images/13-silo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
**Selective forwarding** or
**federated/cross-cluster querying**
enables us to analyze logs from
multiple independent solutions.

Helps us decentralize management,
scale better and embrace autonomy. 

(not without some issues/caveats!)

![bg right:30%](images/13-terrarium.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
Many laws and compliance frameworks require us to log and monitor sensitive activity.  

Some also prevents/restricts logging.

![bg right:30%](images/13-gnome.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## Protecting log data
Some example approaches are...

- **C**onfidentiality: Hardening, pseudonymization
- **I**ntegrity: Append-only storage (soft or hard)
- **A**vailability: Minimizing infrastructure dependencies, (offline) backups

Heavily dependent on properly
understanding log sources and event types. 

![bg right:30%](images/13-lock_pin.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Miske (CC BY-SA 2.0)" -->
## Regular expressions
Language for pattern matching and
data extraction.

Defacto standard for working with
unstructured log data.

Practice your skills using sites
like [RegexOne](https://www.regexone.com/)!

![bg right:30%](images/27-abandoned_silo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
**Let's continue, shall we?**

![bg right:30%](images/13-adis_bar.jpg)
