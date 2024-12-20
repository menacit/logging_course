---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Vocabulary and basics"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Vocabulary and basics in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% James Johnstone (CC BY 2.0)" -->
# Vocabulary and basics

![bg right:30%](images/01-ship_wreck.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% James Johnstone (CC BY 2.0)" -->
Ship captains have kept logbooks
for hundreds of years.

![bg right:30%](images/01-ship_wreck.jpg)

<!--
The term "log book" is old. Use as anectode:

https://upload.wikimedia.org/wikipedia/commons/a/a8/Speyer_Handlog.jpg
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Forsaken Fotos (CC BY 2.0)" -->
The airplane "black box" is another good example.

![bg right:30%](images/01-airplane_wreck.jpg)

<!--
- Confusing name, far from black!
- Semi-automated system used to record what happened in/to the airplane.
- Help us understand accidents and prevent future ones.

Segue: We also use logging in computer systems...
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Why do we log?
- Detection of malicious activity
- Deterrence of bad behavior
- Review and optimization
- Legal/Compliance requirements

![bg right:30%](images/01-birch_forest.jpg)

<!--
- Review logs for IoCs and undesired activity.
- Just the knowledge of that activity is monitored may deter undesired activity.
- Help us understand how things actually work, why they don't and where to improve
- Behavior of users/customers in our services
- GDPR/PCI DSS requires logging of access to PII/credit card information
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
**What makes a good log entry/event?**

![bg right:30%](images/01-birch_forest.jpg)

<!--
- Depends on what type of log we are talking about.

Segue: Two broad categories...
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Operational logs
Enables us to understand what is
happening in a system.

![bg right:30%](images/01-abandoned_factory.jpg)

<!--
- Why is the system inaccessible?
- What is causing request latency?
- Typically helps developers, system administrators and business analysists
- A good operational log helps these people do their jobs
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% A Loves DC (CC BY 2.0)" -->
## Audit logs
Enables us to "reenact" events of interest.

![bg right:30%](images/01-steel_w.jpg)

<!--
- Primarily interesting for security related roles.
- Play detective with red strings and a "crazy wall"

Segue: So what makes a good audit log entry?
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% A Loves DC (CC BY 2.0)" -->
**W**hen,  
**W**ho,  
**W**hat, 
**W**here and possibly  
**W**hy?

![bg right:30%](images/01-steel_w.jpg)

<!--
- The 5 W:s of audit logging
- Each log entry should ideally answer these questions.
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Yellowcloud (CC BY 2.0)" -->
## When?
Time and date when something occurred.  

Can be used to create an event timeline across different applications and systems.  
  
Finely tuned/synchronized clocks are vital,
solutions like the **N**etwork **T**ime **P**rotocol help.

![bg right:30%](images/01-nixie_tube.jpg)

<!--
- Essential for putting events in cronological order
- In distributed systems, accurate time is crucial for correlation of events
- More about time/clocks later!
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
## Who?
Which human/computer/application caused the event?

Preferably backed by strong authentication.

![bg right:30%](images/01-lemur.jpg)

<!--
- Useful context for events
- Which user/system administrator could I ask/question about the happening
- Is it resonable that a guy in sales is trying to access IT management systems?
- How about a recently fired (disgruntled) employee who are trying to download all shared files?
- Goes without saying, but the better the authentication the more we can trust this
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## What?
Explaining what activity caused the log entry to be created.  

May communicate why the log event might be of interest.

![bg right:30%](images/01-bismuth.jpg)

<!--
- "Failed to authenticate against database due to wrong password"
- "Could not delete file due to insufficient privileges"
- "Safe-door unlocked"
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
## (from) Where?
Information related to the location of the event causer.  

Name of room/building, GPS coordinates,
phone number, IP address, device identifier...

![bg right:30%](images/01-arial_photo.jpg)

<!--
- Event causer == human/computer
- Help us put to make sense of the event
- Is it resonable that Janne is trying to access their email from Murmansk?
- Was the action performed from an IP address or computer controlled by the organization?
- Can't always trust this information

Segue: And lastly... why?
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Mendes (CC BY-SA 2.0)" -->
## Why?
What was the reason that caused the actor to perform an action that generated the log event?  

Provided by the event causer and/or sources helping reviewers to put the log entry in a context.  

Many systems, such as electronic health journals, require this to minimize/detect misuse.

![bg right:30%](images/01-raccoon.jpg)

<!--
- Searches in the police data registry
- Ticket ID/Documentation for why a firewall exception was added
- May not be provided by a human, but rather another system to make sense of events
- "This database entry was deleted due to user X performing action Y in system Z"

Segue: Now that we know what should be in the audit log entry, how do we present the info?
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Torres (CC BY 4.0)" -->
Preferably readable by man and machine alike!

![bg right:30%](images/01-cyborg.jpg)

<!--
- These logs will most likely be monitored by computers and analyzed by humans
- Clear separation of individual events
- Clear separation of the 5 W:s, should be easy to differentiate betwen when, what...
- More about different log formats and their pros/cons late
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
In practice, both may contain events of interest for security analysts.  

Many systems don't differentiate between them.

![bg right:30%](images/01-window_cleaners.jpg)

<!--
- Some type of events are hard to categorize.
- An application's permission failure to access a database may be of interest of both ops and sec
- Often all logs are written to the same file/database table
- A large part of the job in a SOC is filtering logs for relevant events
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
**How do we implement logging?**

![bg right:30%](images/01-goggles_streetart.jpg)

<!--
We know what we want, how do we actually get ahold of these logs?
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Johannes P1hde (CC BY 2.0)" -->
## Inspection-based 
Behavior of non-cooperating applications/systems are observed by an external application.  

Network traffic sniffing, raw database queries,
syscall interception, resource consumption...  
  
Doesn't require (costly) changes to applications/systems.

![bg right:30%](images/01-camera_shutter.jpg)

<!--
- Sometimes known as "black box observability" (not to be confused with airplanes)
- Useful for legacy systems who haven't been designed to produce desired logs

Segue: Quite low-level, may be hard to answer W:s except when and where....
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Instrumented
Applications are responsible for producing log events when activity of interest occurs.  
  
Less guesswork and more details/context compared to inspection-based logging.  

Requires that the application provides trustworthy information.

![bg right:30%](images/01-factory.jpg)

<!--
- The application
- Prefered, but may be costly/very hard to implement
- Requires cooperation from software/system developer
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Randy Adams (CC BY-SA 2.0)" -->
**Who is looking at the logs?**

![bg right:30%](images/01-abstract_pattern.jpg)

<!--
- As we've talked about audit logging, security personnel are a given consumer

Segue: But there are also others who are interested...
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Todd Van Hoosear (CC BY-SA 2.0)" -->
## Development and operations
Software developers commonly used debug logging to verify expected behavior and identify bugs.  

Quality assurance teams use logs to identify performance regressions.  

System administrators use logs to understand behavior of systems and implement optimizations.

![bg right:30%](images/01-engine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
## Security personnel
Analysts and threat hunters in
**S**ecurity **O**peration **C**enters
monitor logs to detect malicious activity.  

**I**ncident **R**esponders dig through historical logs to build timelines of threat actor actions.

![bg right:30%](images/01-barbwire.jpg)

<!--
- Let's be a bit more specific
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% IAEA (CC BY 2.0)" -->
## Data analysts and scientists
Modern IT environments produce a lot of log data.  

Companies employ specialists to find useful insights from logs.  

Helps with A/B testing and understanding of user behavior.  

Improve operations or sell to third-parties.

![bg right:30%](images/01-fusion_equipment.jpg)

<!--
- A/B testing == What effect did change X have on metrix Y?
- Some businesses make their living on selling user behavior data to others
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
**How do we analyze the logs?**

![bg right:30%](images/01-chemical_plant.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## Pattern-based
Search for occurrence of strings/patterns that are of interest.  

May be things like known error codes or
**I**ndicators **o**f **C**ompromise.

![bg right:30%](images/01-cd_macro.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Aggregation and correlation
Not all insights can be gained by simply looking for pattern in logs.  

Some require counting patterns/field values and correlation between different logs/systems.

May be things like...
- Common web server paths causing errors 
- Number of failed logins per username/source IP address
- Approximated physical location of app users

![bg right:30%](images/01-difference_engine.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
## Enrichment
Automation may be used to extend log events with information that may aid in analysis.  

Employee position/role, geographic IP lookups, domain occurrence in IoC lists...

![bg right:30%](images/01-wireframe_head.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% ESA (CC BY-SA 3.0 IGO)" -->
## Visualization
Sometimes a picture says more than
a thousand words.  

Usage of visual tools graphs, charts and maps can help humans identify interesting events/patterns. 

![bg right:30%](images/01-abstract_forest.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
**Where do we analyze logs?**

![bg right:30%](images/01-wheel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Randy Adams (CC BY-SA 2.0)" -->
## Local analysis
Most applications store logs in a database or simple text files.  

Shell utilities and simple scripts can be used to gain important insights. 

![bg right:30%](images/01-abandoned_car.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sbmeaper1 (CC0 1.0)" -->
## Centralized analysis
Instead of storing/analyzing logs on the producing systems, do it centrally.  

Standardized protocols and software agents can be used to collect/transfer logs over the network.  
  
What are the benefits?

![bg right:30%](images/01-pines.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## Ease correlation
Almost every network connected device can produce logs.

Manually checking everything is
time-consuming (see "expensive").  

Some insights require a wider-perspective than individual systems.

![bg right:30%](images/01-switches.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Yellowcloud (CC BY 2.0)" -->
## Minimizes risk of tampering
Log data can be manipulated to hide malicious activity or implicate individuals.  

Once hacked/modified, system logs can no longer be trusted.  

Centralized logging enables us to preserve the information.

![bg right:30%](images/01-chip_closeup.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kevin Dooley (CC BY 2.0)" -->
## Optimize performance and cost
Not all computers are optimized for log storage/analysis.  

Logs can be stored on different storage mediums depending on needs.  

Retention policies can be managed in one place.

![bg right:30%](images/01-cemetery.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Meddygarnet (CC BY 2.0)" -->
Didn't you mention 
machines looking at logs?

![bg right:30%](images/01-soldering_robot.jpg)

<!--
- Why is it so neat to have computers monitor the logs for us?
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Torkild Retvedt (CC BY-SA 2.0)" -->
## Alerting
Scheduled searches can continuously look for known bad patterns in log events.  

Once identified, automated actions can be taken or humans notified for manual analysis.

![bg right:30%](images/01-cameleon.jpg)

<!--
Example: Fail2Ban, automated order of disks based on total utilization
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mauricio Snap (CC BY 2.0)" -->
## Anomaly detection
Humans are quite good at identifying things out of the ordinary.  
  
They have neither the time nor attention span to analyze the logs from modern IT environments.  
  
Algorithms and **M**achine **L**earning can help us, especially with centralized logging.

![bg right:30%](images/01-eye.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
Centralized logging services often serve as the basis for a...  

**S**ecurity
**I**nformation and
**E**vent
**M**anagement system.

![bg right:30%](images/01-nyala.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC0 1.0)" -->
SIEMs commonly serve as a source for...  

**S**ecurity
**O**rchestration,
**A**utomation and
**R**esponse systems.

![bg right:30%](images/01-groundhog.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Chris Dlugosz (CC BY 2.0)" -->
Observability is not just logging.  

Metrics are other examples.

Typically not used for security purposes.

![bg right:30%](images/01-abstract_laser.jpg)

---
```
$ curl http://server.example.com:9100/metrics | grep "errs_total"

# HELP node_network_receive_errs_total Network device statistic receive_errs.
# TYPE node_network_receive_errs_total counter
node_network_receive_errs_total{device="enp2s0"} 10185

# HELP node_network_transmit_errs_total Network device statistic transmit_errs.
# TYPE node_network_transmit_errs_total counter
node_network_transmit_errs_total{device="enp2s0"} 1249
```

<!--
- Usually simple counters or gauges
- Scraped and stored in a time-series database
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Thierry Ehrmann (CC BY 2.0)" -->
**Sounds great - what's the catch?**

![bg right:30%](images/01-thinking_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Logging overhead
Producing/storing/transferring log events requires CPU cycles, I/O operations, bandwidth, etc.  

May require more expensive hardware and impact user experience/performance.

![bg right:30%](images/01-resistors.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Scott Merrill (CC BY-SA 2.0)" -->
## Storage and processing costs
We're tempted to log everything - it may contain useful information.  

Storing and processing these ain't free.  

Many logging systems use volume-based licensing.

![bg right:30%](images/01-pipes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Collection of sensitive data
Logs may contain
**P**ersonally **I**dentifiable **I**nformation,
credentials and other sensitive information.  

That may be of interest to malicious actors.  

**Anonymization/Pseduonymization**
may help, but are not a penicillina.

![bg right:30%](images/01-boarded_windows.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
## Legal/Compliance challenges
While some laws/compliance frameworks require us to log activity, others prevent it.  

Some examples are...
- Banking/Attorney privacy protection
- EU employee monitoring laws
- Storage of credit card numbers under PCI DSS

![bg right:30%](images/01-padlocks.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jeena Paradies (CC BY 2.0)" -->
## Cost of analysis
Someone needs to analyze/act on the collected data/alerts.

Expensive and hard to recruit, especially for 24/7 operations.  
  
Even when using managed cloud services,
some analysis is likely required due to the
**shared responsibility model**.

![bg right:30%](images/01-lion_statue.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
We'll dig more into these topics during the course.  

Our primary focus will be security related logging.

![bg right:30%](images/01-robot_streetart.jpg)
