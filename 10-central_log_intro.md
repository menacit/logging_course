---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Centralized logging introduction"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to centralized collection and analysis of logs"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Austin Design (CC BY-SA 2.0)" -->
# Centralized logging
### A somewhat gentle introduction

![bg right:30%](images/10-abstract_tower.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Austin Design (CC BY-SA 2.0)" -->
What does it take to implement and operate
a centralized logging solution?  

Architectural choices and their pros/cons.  
  
We won't talk about specific
products/projects for now.

![bg right:30%](images/10-cave.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
**Let's begin with the soft stuff!**

![bg right:30%](images/10-party.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
## Ingestion
How many MB/GB/TB do we need
to process and store per day?
  
**E**vents **P**er **S**econd
is another very useful metric.  

May require quite a bit of
research and guesstimation.

Influences HW requirements and
cluster architecture.

![bg right:30%](images/10-arch.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
## Availability requirements
Must the system always be available for **ingestion** of logs or can we handle buffering?  
  
Are we required to **store** logs for a specific amount of time? Can we afford to lose some?  
  
Is it acceptable if **analysis/alerting** capabilities aren't always working?  
  
![bg right:30%](images/10-factory_fence.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Stacy B.H (CC BY 2.0" -->
## Who will use it?
Security analysts, operations personnel, developers, marketing, data scientists...  

May affect the need for capabilities like visualization, reporting and machine learning.

![bg right:30%](images/10-panda.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bret Bernhoft (CC0 1.0)" -->
## Managed VS Self-hosted
Should we operate the solution ourselves or rely on a managed service?  

Do we have the expertise, time and interest required?  

Are there any legal/contractual/policy considerations?
  
Is there a good fit available?

![bg right:30%](images/10-metal.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Shannon Kringen (CC BY 2.0)" -->
## Support needs
Do you have risk appetite to go through this alone?  

Potential to save quite a bit of money.  
  
Not just about the vendor - are consultants/experts available nearby?

![bg right:30%](images/10-turtles.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 4.0)" -->
## Access control
Should all logs be accessible to every analyst?  
  
Do we need to support multiple tenants?  
  
Take a second to meditate upon your needs for vertical and horizontal access control.

![bg right:30%](images/10-lighthouse.jpg)

<!--
Examples of vertical access control:
- Delete data (retention rules)
- Modify detection/scrubbing rules
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Andrew Hart (CC BY-SA 2.0)" -->
## Primary motivations
Remember to be honest with yourselves.  
Are you doing this just to tick a box?  
  
Influences performance and feature requirements.

![bg right:30%](images/10-broken_glass.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Freestocks.org (CC0 1.0)" -->
## Common fee/licensing schemes
- **None**: Do what you want, yay!
- **Volume**: Amount ingested and/or stored
- **Events**: Number of ingested events
- **Features**: Enable/Disable functionality
- **Per-seat**: Number of users/analysts

![bg right:30%](images/10-cow.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
Enough of this - let's have a look at
some of the technical considerations,
shall we? 

![bg right:30%](images/10-core_memory.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## Pull VS Push
Should our logging solution
reach out and collect logs?  
  
Majority of solutions require
log producers/intermediaries to 
send/deliver the data (push-based).  
  
Generally simpler to implement.  
  
(We'll get back to agents/protocols)

![bg right:30%](images/10-bees.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Where do we parse logs?
Should the producing systems massage logs
to extract relevant data and make them
machine-readable?  

Distributes the load and can save bandwidth.  

Introduces friction during implementation,
software/management requirements
and processing overhead.

![bg right:30%](images/10-abandoned_gaspipe.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sbmeaper1 (CC0 1.0)" -->
When do we parse logs?  

**Index-time** VS **Search-time**.

![bg right:30%](images/10-building_reflection.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
## Index-time parsing
Interesting data is parsed/extracted
before storage.  

The heavy-lifting is done once,
improves search performance/cost.  

Requires knowledge of log format
beforehand and a bit extra disk space.

![bg right:30%](images/10-cleaning_hdd.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Freed eXplorer (CC BY 2.0)" -->
## Search-time parsing
Interesting data is parsed/extracted
during each query.  

Enables low-friction ingestion and
less storage space.  

Increases query time/cost.

![bg right:30%](images/10-cave_explorer.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Johannes P1hde (CC BY 2.0)" -->
While logging solutions tend to focus on one of the approaches, many supports a hybrid solution.

![bg right:30%](images/10-analog_ccc.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Will Buckner (CC BY 2.0)" -->
## Retention / Rotation strategies

### Time-based
Keep logs around for _X_ amount of days.

### Volume-based
Store _X_ gigabytes of events and delete the oldest ones if that's not enough.

### Capacity-based
Cram as many events as we can fit into
_X_% of total disk space.

![bg right:30%](images/10-water_tower.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
In practice, we tend to combine these strategies.  

Store sensitive logs for at least two weeks,
but longer if possible.

Do we want a development system or DDoS attack to overwrite our authentication logs?

![bg right:30%](images/10-galley_carts.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## Storage tiers
Not all log events are equally interesting.  

We can utilize different storage tiers
to optimize cost and performance.  

Let's talk about
**hot, warm, cold and frozen storage**
in somewhat general terms.

![bg right:30%](images/10-hdd_macro.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## Hot and warm storage
Log data frequently accessed during
manual queries and automated analysis.  

Backed by a fast storage medium such as
SSDs in RAID configuration.  

Multiple replicas can also be used to
improve query performance.  
  
Typically capacity-based retention.

![bg right:30%](images/10-fire.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lydur Skulason (CC BY 2.0)" -->
## Cold and frozen storage
Log data that is rarely/never analyzed.  

Migration typically happens automatically.  

Backed by high-capacity storage mediums,
such as HDDs, cloud object stores and tape.  

Useful for compliance and incident response.

![bg right:30%](images/10-snow_dome.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% NASA/JPL-Caltech (CC BY 2.0)" -->
## Scaling beyond a cluster
Find it hard to cram all events and
users into one log system?  

Consider using multiple independent
servers/clusters.

Not just for performance reasons -
aids autonomy/decentralization and
simplifies access control.  

Let's look at some solutions!

![bg right:30%](images/10-retro_space.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Freed eXplorer (CC BY 2.0)" -->
## Selective forwarding
Specific event types and/or sources
are replicated to other log system.  

Enables usage of different logging
applications based on needs/budget.  

Can help with optimization of
retention and bandwidth usage.

![bg right:30%](images/10-rusty_factory.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
## The downsides
Hard to determine what might be of
interest before shit hits the fan.

Should forwarded events also be
kept around locally?  

Can require quite a bit of coordination.

![bg right:30%](images/10-reflective_lake.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% A. Gerst, ESA (CC BY-SA 2.0)" -->
## Federated searching
Some logging solutions support
"cross-cluster"/"federated" queries.  

Enables us to decentralize
collection/retention/access control,
while allowing centralized alerting
and analysis.  
  
Distributes query load and eliminates
need of unnecessary data duplication.

![bg right:30%](images/10-space_face.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ron Cogswell (CC BY 2.0)" -->
## Ain't perfect either
Analysis is gonna be painful if data
ain't normalized.  

No cross-solution standard/protocol,
often requires versions to be in sync.

![bg right:30%](images/10-contrails.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rob Hurson (CC BY-SA 2.0)" -->
## Let's summarize
There are many different paths to
choose from - make sure to known
your needs and wants.  
  
Learning how to architect/operate
(and not merely use) logging solutions
can be a great career move.

![bg right:30%](images/10-bunker_tower.jpg)

<!--
-->
