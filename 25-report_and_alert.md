---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Reporting and alerting"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to automated reporting and alerting in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
# Reporting and alerting
### Automating the boring stuff

![bg right:30%](images/25-owl.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
You ain't got time nor interest
enough to stare at those logs
all day long.  

Alerting and scheduled reporting
are two common methods that make
computers do the heavy lifting.

![bg right:30%](images/25-owl.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
Alerts are typically triggered by
scheduled searches, which are called
"monitors" in OpenSearch.

Triggered if search returns results
or if result is above/below threshold.

Sliding time-span rather than "real-time".

![bg right:30%](images/25-rock.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy  (CC BY 3.0)" -->
Let's talk about
the Zen of alerting.

![bg right:30%](images/25-astronaut.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## Alert fatigue
It's a serious problem.  

Sucks the fun out of life and
may result in real problems
being ignored/missed.  

Significant time
should be dedicated to
tweaking thresholds and
minimizing false-positives.

![bg right:30%](images/25-abandoned_office.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bret Bernhoft (CC0 1.0)" -->
Is this a good time to go
off-topic and talk a bit about
true/false-positives/negatives?  

Probably not but let's do it anyway.

![bg right:30%](images/25-abstract_party.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
## Taming notifications
Minimize interruptions and
context-switching.  
  
Can it wait?
Can I do something it now?  
  
Think about alert priorities,
target groups, alert methods
and scheduling.  

Focus on end-to-end tests and
high-signal alerts to minimize
risk of false-positives.

![bg right:30%](images/25-phone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Eric Kilby (CC BY-SA 2.0)" -->
## Actionable information
What is the recipient expected
to do with the information?  
  
Explain why the alert was
triggered and what it could mean.  

Link to documentation, run-book
and other relevant guidance.

![bg right:30%](images/25-sloth.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
Interrupt-driven work should be
avoided whenever possible.  

Scheduled reports may be a
good alternative.  

Aid recurring tasks such as
capacity planning and
threat hunting.  

Export relevant information
to external systems.  

Show that we are actually doing
things without noisy alerts.

![bg right:30%](images/25-abandoned_wall.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kuhnmi (CC BY 2.0)" -->
Let's have a look at how alerts
and reporting can be configured
in OpenSearch Dashboards!

![bg right:30%](images/25-penguins.jpg)
