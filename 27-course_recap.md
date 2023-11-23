---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Bixentro (CC BY 2.0)" -->
# Course recap
### Let's refresh our memory

![bg right:30%](images/27-pcb_baby_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Miske (CC BY-SA 2.0)" -->
## Regular expressions
Language for pattern matching and
data extraction.

Defacto standard for massaging
unstructured log data.

Usable in OpenSearch through
scripted queries and Grok filters
in Logstash.

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

Each log entry must specify an event ID
that describes the type of activity/error
causing the event to be logged.

Log data is structured and stored on
disk in a custom binary XML format.  
  
**W**indows **E**vent **F**orwarding uses
HTTP or HTTPS for transferring events to
a **W**indows **E**vent **C**ollector.

![bg right:30%](images/27-abstract_building.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## OpenSearch logging stack
Open-source fork of the Elastic/"ELK" stack.  

The course lab environment consists of:
- **Beats** for collecting and transferring log data from server/producers
- **Logstash** for parsing, filtering, normalization and enrichment
- **OpenSearch** for log storage and analysis
- **OpenSearch Dashboards** for GUI and visualization capabilities

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
Log events are stored as "documents".

These are tied to an "index", which can be used to group similar documents.  

An index consists of one or more "shards" that are used to actually store the data on disk.  

Shards can be spread over multiple nodes to improve resiliency and search performance.

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% O. Hainaut, ESO (CC BY 2.0)" -->
## Enrichment
Aims to provide useful context for
log analysis and alerting.  
  
Log events can be enriched at
ingestion-time, search-time
or on a scheduled basis.  

Each approach has its own
pros/cons.

![bg right:30%](images/27-comet.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Graham Drew (CC BY 2.0)" -->
## Alerting and reporting
The Zen of alerting involves
careful use of notifications,
verbose problem descriptions
and significant efforts to
minimize false-positives. 

Scheduled reports can be used to
minimize "interrupt-driven" work,
improve planning/prognostication
and integrate with other systems
using standardized formats.

Scheduled searches used for alerts
are called "monitors" in OpenSearch.

![bg right:30%](images/27-sinking_boat.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sbmeaper1 (CC0 1.0)" -->
## Advanced Linux auditing
TBD!

![bg right:30%](images/27-tree_island.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
We got lots of things to cover -
let's move on!

![bg right:30%](images/27-missile_computer.jpg)
