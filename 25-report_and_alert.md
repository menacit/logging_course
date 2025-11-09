---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
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

What are some relevant considerations?

![bg right:30%](images/25-owl.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
Alerts are typically triggered by
scheduled searches, which are called
"monitors" in OpenSearch.

Triggered if search returns results
or if result is above/below threshold.

"Alert me if a log contains evil IPs"
_VS_
"Alert me if the number of failed logins
for a user are >5 during 10 minutes".

Sliding time-span rather than "real-time",
required for aggregations.

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

Just ask [Target](https://en.wikipedia.org/wiki/Target_Corporation).

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
  
Can it wait? Can / Must I do something now?  
Some [predictive extrapolation](https://builtin.com/sites/www.builtin.com/files/styles/ckeditor_optimize/public/inline-images/3_extrapolation.png) may help.
  
Think about alert priorities, target groups,
alert methods and scheduling.  

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

Even better: consider some
automated remediation.

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
<!-- _footer: "%ATTRIBUTION_PREFIX% Nirvana Studios (CC BY 4.0)" -->
Let's look at some example alerts
and meditate upon them!

![bg right:30%](images/25-scrapy_diver.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bruno Sanchez-Andrade Nuño (CC BY 2.0)" -->
**Time:** Sunday 02:42
**Recipient:** IT department
**Notification method:** Email
**Count last 7 days:** 1337
**Message content:**

Storage utilization on host "sat-06" is 84%.

![bg right:30%](images/25-iridium_satellite_phone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bruno Sanchez-Andrade Nuño (CC BY 2.0)" -->
**Time:** Sunday 02:42
**Recipient:** Satellite operations
**Notification method:** Ticket
**Count last 7 days:** 1
**Message content:**

Storage utilization on host "sat-06" is 84%.

![bg right:30%](images/25-iridium_satellite_phone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bruno Sanchez-Andrade Nuño (CC BY 2.0)" -->
Severity: Warning!

Storage utilization on host "sat-06" is 84%.

If max capacity is reached, the system may
become unstable and unable to operate. 

Automated remediation was not able to
reclaim sufficient disk space.

Based on predictive extrapolation, the max
capacity will be reached on Tuesday 12:12
at the current rate.

For more information about this alert and
troubleshooting guidance, see https://....

![bg right:30%](images/25-iridium_satellite_phone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bruno Sanchez-Andrade Nuño (CC BY 2.0)" -->
Any other suggestions?

![bg right:30%](images/25-iridium_satellite_phone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kuhnmi (CC BY 2.0)" -->
Let's have a look at how alerts
and reporting can be configured
in OpenSearch Dashboards!

![bg right:30%](images/25-penguins.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Adam Lusch (CC BY-SA 2.0)" -->
## Wrapping up
Taming alerts and notifications
is a continuously ongoing battle,
not a one-off effort.

Just giving it some thought
will take you quite far!

If you have multiple tools producing
alerts, have a look at tools like
[PagerDuty](https://comparecamp.com/media/uploads/2019/02/PagerDuty-dashboard.png) and [Grafana OnCall](https://grafana.com/oss/oncall/).

![bg right:30%](images/25-lake_street_bridge.jpg)
