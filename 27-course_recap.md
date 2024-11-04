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
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Our logging stack
Open-source fork of the Elastic/"ELK" stack.  

The course lab environment consists of:
- **Beats** for collecting and transferring log data from server/producers
- **Logstash** for parsing, filtering, normalization and enrichment
- **OpenSearch** for log storage and analysis
- **OpenSearch Dashboards** for GUI and visualization capabilities

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
## Elastic Beats
Family of "logging agents" built on
the "libbeat" code library.  

Each has a specific task -
read logs from text files (_filebeat_),
read logs from Event Log (_winlogbeat_),
record network traffic (_packetbeat_)...

Responsible for shipping logs
from our servers.

![bg right:30%](images/27-party.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
## Logstash
Recieves logs from Beats, Syslog, HTTP...  

Filter, parse/extract, normalize and
enrich log events.  

Logs pass through scriptable "pipelines",
which consist of three stages:
"input", "filter" and "output".  

Plugins (_"functions"_) are provided to
ingest, manipulate and store data.

Writes log events to one or more
OpenSearch indices.

![bg right:30%](images/27-book_and_logs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## OpenSearch
Search engine/"document database"
based on Apache Lucene.  

Fork of Elastic's Elasticsearch -
much of the documentation/tutorials
are still usable.  

Used to persistently store and
analyze/monitor log events.

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
Log events are stored as "documents".

These are tied to an "index", which can be used to group similar documents.  

An index consists of one or more "shards" that are used to actually store the data on disk.  

Shards can be spread over multiple nodes to improve resiliency and search performance.

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Query languages
Besides **L**ucene **Q**uery **L**anguage,
OpenSearch provides plugins for other ways
to express your searches/aggregations.  

Depending on your preferences, you can use
**D**ashboard **Q**uery **L**anguage,
**P**ipe **P**rocessing **L**anguage or
**S**tructured **Q**uery **L**anguage.  

LQL and DQL are the most commonly used.

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Search types
Searches in OpenSearch are
"**queries**", "**aggregations**"
or a combination of both.  

Queries return matching documents.  

Aggregations returns statistics
about document fields.  

They can be combined to filter
data for statistical analysis.

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Scored results
Query results (_"hits"_) can be scored
to help us find the most relevant
matches first.  

Methods like "bool" queries can be
utilized to affect the score
(_"must", "must_not", "should"_).

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
Aggregations provide statistical insights
into our documents/log events.  

Most basic is to count number
of documents matching a filter.  

"avg" can be used to calculate the
average value of a specific field
(_metric aggregation example_).  

"terms" works a bit like `uniq -c`:
counts the occurences of unique
field values in documents
(_bucket aggregation example_)

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
Due to the way OpenSearch stores
"free text" fields, we can't
aggregate on their value.  

Luckily, a field of the type
"keyword" is automatically created
for all text fields shorter with
a value shorter than 256 characters.  

To aggregate on text field "login\_method",
utilize the field "login\_method.keyword".

![bg right:30%](images/27-vintage_machine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steven Kay (CC BY-SA 2.0)" -->
## OpenSearch Dashboards
Web-based GUI for OpenSearch.  

Query and visualize data stored data.  

Administration and configuration tasks.

![bg right:30%](images/27-pixel_map.jpg)

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
