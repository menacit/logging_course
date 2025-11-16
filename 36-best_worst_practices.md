---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Best and worst practices"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Description of some best and worst logging practices"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Greg Lloy (CC BY 2.0)" -->
# Best (and worst) practices
### More or less painful lessons

![bg right:30%](images/36-old_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Greg Lloy (CC BY 2.0)" -->
There's lots more to learn about successfully
implementing logging solutions.  

The following _(opinionated)_ slides cover some
of the lessons I've _(painfully)_ learned.

![bg right:30%](images/36-old_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Setup retention/rotation
No one _(but the NSA)_ can afford
to store logs forever.  

**Before** ingesting a new log source,
make sure to check and communicate
retention requirements/policy.  

Backup log data whenever required,
but be aware of the cost.

![bg right:30%](images/36-abandoned_car.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Retention in OpenSearch
Backups are provided by the
"Scheduled snapshots" feature.

While possible to delete specific
documents _(log events)_ in OpenSearch,
the most straight forward way is to
rotate _(delete_) whole indicies.  

Don't store log events with different
retention requirements in the same index.

Retention/Rotation/Storage tier migration
is handled by "State management policies".

![bg right:30%](images/36-abandoned_car.jpg)

---
![bg center 100%](images/36-opensearch_menu_index_management.png)

---
![bg center 100%](images/36-opensearch_index_management_create.png)

---
![bg center 100%](images/36-opensearch_index_management_create_visual.png)

---
![bg center 100%](images/36-opensearch_index_policy_description.png)

---
![bg center 100%](images/36-opensearch_index_policy_template.png)

---
![bg center 100%](images/36-opensearch_index_policy_add_states.png)

---
![bg center 100%](images/36-opensearch_index_policy_add_states_initial.png)

---
![bg center 100%](images/36-opensearch_index_policy_add_states_long.png)

---
![bg center 100%](images/36-opensearch_index_policy_add_states_clean.png)

---
![bg center 100%](images/36-opensearch_index_policy_states_overview_before.png)

---
![bg center 100%](images/36-opensearch_index_policy_state_add_trans.png)

---
![bg center 100%](images/36-opensearch_index_policy_trans_dest.png)

---
![bg center 100%](images/36-opensearch_index_policy_trans_condition_types.png)

---
![bg center 100%](images/36-opensearch_index_policy_trans_condition_age.png)

---
![bg center 100%](images/36-opensearch_index_policy_initial_state_overview.png)

---
![bg center 100%](images/36-opensearch_index_policy_state_add_action.png)

---
![bg center 100%](images/36-opensearch_index_policy_action_types.png)

---
![bg center 100%](images/36-opensearch_index_policy_trans_overview.png)

---
![bg center 100%](images/36-opensearch_index_policy_cleanup_action.png)

---
![bg center 100%](images/36-opensearch_policy_managed_empty.png)

---
![bg center 100%](images/36-opensearch_indices_apply_policy.png)

---
![bg center 100%](images/36-opensearch_indices_select_policy.png)

---
![bg center 100%](images/36-opensearch_policy_managed_populated.png)

---
![bg center 100%](images/36-opensearch_index_policy_warm_storage.png)

---
![bg center 100%](images/36-opensearch_index_policy_cold_storage.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
## Tagging log types
Grouping log sources commonly
searched together.  
  
Spend the time before everything
is burning during an incident.  
  
In OpenSearch, we can utilize
"index patterns" _(sometimes)_
or "index aliases".

![bg right:30%](images/36-rusty_hut.jpg)

---
![bg center 100%](images/36-opensearch_index_management_create_alias.png)

---
![bg center 100%](images/36-opensearch_index_management_create_alias_dialog.png)

---
![bg center 100%](images/36-opensearch_use_alias.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## Monitoring ingestion

![bg right:30%](images/36-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
## Documenting known unknowns

![bg right:30%](images/36-drones_face.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy  (CC BY 4.0)" -->
## Working with Sigma

![bg right:30%](images/36-mechanic.jpg)

<!--
https://sigmahq.io/
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
## Schedule alert-review

![bg right:30%](images/36-vr_woman.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Source/Query cost analysis

![bg right:30%](images/36-valve.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
### Make it a procurement requirement

![bg right:30%](images/36-abandoned_apartment.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Including logging in SDLC

![bg right:30%](images/36-rock_wall.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Chris Gunn, NASA (CC BY 2.0)" -->
## Sell it as BI!

![bg right:30%](images/36-james_webb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## UTC is your friend

![bg right:30%](images/36-albatross.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Stéphane Gallay (CC BY 2.0)" -->
While just scratching the surface,
I hope these lessons gave you
some useful insights!

![bg right:30%](images/36-dice.jpg)
