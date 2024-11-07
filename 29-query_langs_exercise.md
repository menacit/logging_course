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
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## Exercise: Playing with SQL/PPL

![bg right:30%](images/29-chip_closeup.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
Open ["Query Workbench"](https://opensearch.org/docs/latest/dashboards/query-workbench/) page in
your instance of OpenSearch Dashboards.  

Develop queries using **both** SQL and PPL
to find/filter information about:
- Web server requests from Chrome web browsers
- Country and IP address for each failed Windows attempt login
- Top 10 usernames observed during failed Windows login attempts

Send SQL and PPL query strings to
**[courses+log\_012901@%EMAIL_DOMAIN%](mailto:courses+log_012901@%EMAIL_DOMAIN%)**

![bg right:30%](images/29-chip_closeup.jpg)
