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
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC0 1.0)" -->
# Course recap
### Let's refresh our memory

![bg right:30%](images/33-fall_train_tracks.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lars Juhl Jensen (CC BY 2.0)" -->
## Linux auditing
Applications on Linux commonly log
security related events to syslog.
  
FIM software can be combined with
"inotify" feature for efficiency
and ability to detect reads.  

The Linux audit framework enables
logging syscalls of interest.

Features like "eBPF" are beginning to
replace current audit functionality,
mainly due to its flexibility.
 
![bg right:30%](images/33-panda.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei Gussev (CC BY 2.0)" -->
OpenSearch provides support for queries
using LQL, DQL, PPL and SQL.  

DQL aims to be easy to use for filtering,
but lack advanced aggregation features.  
  
PPL is designed to ease on-boarding of
shell lovers and users used to other
SIEMs like Splunk.  

SQL provides a query language known by
many developers and data scientists.

DQL, PPL and SQL gets translated to LQL,
with varying degrees of success and
quality of error messages.
 
![bg right:30%](images/33-singapore_gardens.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Yellowcloud (CC BY 2.0)" -->
## AI/ML for log analysis
While a centralized log solution can
act as a data source for AI/ML, it
may also improve the search and
analysis experience.  

OpenSearch provides several pre-trained
freely available for usage.  
  
The RCF algorithm is commonly used
for anomaly detection.  

NLP and AI/ML can be used to provide
semantic and conversational queries.
 
![bg right:30%](images/33-stones_moss.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rob Hurson (CC BY-SA 2.0)" -->
## Instrumenting applications
Usage of templating/data binding to reduce
repetition and ease instrumentation process.  

Usage of libraries capable of producing
structured logs using JSON or similar
well-supported format.  

Using domain-specific knowledge to implement
detection of malicious/suspicious behavior. 
 
![bg right:30%](images/33-radio_outpost.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
## Integrity monitoring
**TBD**
 
![bg right:30%](images/33-monkey.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
All caught up?  
Let's move on!
 
![bg right:30%](images/33-oops_key.jpg)
