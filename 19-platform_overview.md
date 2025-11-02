---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Platform overview"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Overview of available logging solutions/platforms"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Counselman Collection (CC BY-SA 2.0)" -->
# Logging platform overview
### Comparison of common log solutions

![bg right:30%](images/19-log_truck.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Counselman Collection (CC BY-SA 2.0)" -->
Many products and services are available
for centralized logging.  
  
Let's take a look at some of them
and their pros/cons/trivia.

![bg right:30%](images/19-log_truck.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## ArcSight
Released by Micro Focus in
early 2000s.  

Defined the SIEM product category.  

Artifacts such as the
**C**ommon **E**vent **F**ormat
still lives on.

![bg right:30%](images/19-90s_tv.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marco Verch (CC BY 2.0)" -->
## Splunk
SIEM and data analytics platform.

Provides search-time parsing and
agent configuration management.  
  
Relatively easy to scale.  

Used to be the king, but was
also priced accordingly.  

Provided as on-prem or SaaS.  
  
Acquired by Cisco in 2023.

![bg right:30%](images/19-pcb_macro.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tim Green (CC BY 2.0)" -->
## Elastic / "ELK" stack
**E**lasticsearch, **L**ogstash, **K**ibana
\+ Beats (logging agents).  

Index-time parsing backed by
very capable search engine.

Resource hungry, but quite easy to scale.  

Support and plugins for "enterprise"
features (like auth and TLS) available
from Elastic.  

Closed-sourced in 2021, resulting in
"OpenSearch" fork. Became open again in 2024.

![bg right:30%](images/19-moss_face.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Graylog
Logging solutions with
batteries included.

Uses ~~Elasticsearch~~ OpenSearch
under the hood.  

Less capable than the Elastic stack,
but easier to setup/manage.  

Closed-sourced in 2021.

![bg right:30%](images/19-red_eft.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Joel Rangsmo (CC BY-SA 4.0)" -->
## Wazuh
Builds upon ~~the ELK stack~~ OpenSearch and
a fork of the HIDS "OSSEC" to provide
an open source solution for...

\*drum roll\*

e**X**tended **D**etection and **R**esponse.

Freely available, but developed
by a company that sells SaaS,
consulting and support.

![bg right:30%](images/19-painted_brick_wall_with_chimney.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Maja Dumat (CC BY 2.0)" -->
## Loki
FOSS logging solution built
by Grafana Labs.  

Trying to take a fresh approach
and learn from previous mistake.  

Easier and cheaper to operate.  

Less flexible, but good enough
for most operational logging
use-cases. A SIEM? Not yet.

Also available as SaaS.

![bg right:30%](images/19-tunnel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
## Microsoft Sentinel
Security-focused solution for
centralized logging.  

Provides lots of features OoB,
things usually in the realm
of SOC operators/analysts.

Only provided as cloud service.

![bg right:30%](images/19-conti_tower.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Maja Dumat (CC BY 2.0)" -->
Many options exist with
pros and cons.  

Our focus moving forward
will be **OpenSearch**.

![bg right:30%](images/19-bunker.jpg)
