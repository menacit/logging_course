---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Alternative query languages"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to different query/filtering languages in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 3.0)" -->
# Query languages
### Alternatives for data exploration

![bg right:30%](images/28-airship.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 3.0)" -->
Through plugins, OpenSearch provides
several different query languages
besides Lucene for querying and
aggregating documents.  

Let's have a look at these!

![bg right:30%](images/28-airship.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
## DQL
**D**ashboard **Q**uery **L**anguage.  

Default option in OpenSearch Dashboards.  

Aims to simplify common use-cases
for data filtering.

![bg right:30%](images/28-server_rack.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
```
# Search for documents containing
# specified string in username field
user:mallory

# Combine multiple search terms using
# conditional statments and make use
# of wildcards and nummeric filters
hostname:db-*.int.example.org \
and (log_level >= 5 or type:exception)
```

![bg right:30%](images/28-server_rack.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## PPL
**P**iped **P**rocessing **L**anguage.
  
Comfortable for UNIX power-users
and veterans of Splunk/Logpoint.  

Supports easy runtime field creation.

![bg right:30%](images/28-rusty_silos.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jennifer Morrow (CC BY 2.0)" -->
## SQL
**S**tructured **Q**uery **L**anguage.  

Many developers and sysadmins are
already proficient in SQL,
making it a great option.

![bg right:30%](images/28-mirror_spheres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
If you wanna learn more, checkout the
OpenSearch documentation for
[DQL](https://opensearch.org/docs/latest/dashboards/dql/) and
[SQL/PPL](https://opensearch.org/docs/latest/search-plugins/sql/index/)

![bg right:30%](images/28-red_moon.jpg)
