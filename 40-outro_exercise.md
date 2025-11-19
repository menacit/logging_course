---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Group exercise"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Group exercise in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Loco Steve (CC BY-SA 2.0)" -->
# Group exercise
### Putting knowledge to use

![bg right:30%](images/40-big_ben.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Loco Steve (CC BY-SA 2.0)" -->
## Exercise: Logless bank
Participants are split into one or more groups.  
  
Each group is tasked with presenting a logging
implementation plan for a technically skilled
CISO at high-security organization.
  
Focus on security related aspects and try
to provide concrete examples of solutions.
  
After presentation, send slides to
**[courses+log_014001@%EMAIL_DOMAIN%](mailto:courses+log_014001@%EMAIL_DOMAIN%)**

![bg right:30%](images/40-big_ben.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Indrora (CC BY 2.0)" -->
You're **\<INSERT NAME HERE\>**, a consulting
company that helps clients improve their
security by implementing logging solutions.
  
Customers appreciate that you're able to
offer everything from developer guidance
about "audit log design" to legal advice
regarding storage of sensitive information.
  
Occasionally, you also need to soothe budget
concerns by highlighting logging's "value add".

In just a few minutes, you're going to try
convincing your biggest client yet...

![bg right:30%](images/40-defcon_room.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Cory Doctorow (CC BY-SA 2.0)" -->
**Xample Bank & Finance** is a retail bank
that provides lending and payment services
to customers in the Nordics and Baltic states.
  
Headquarters in Sweden with customer support
staff in Spanish call-centers and IT department
outsourced to India. 1336 workers in total.
  
While they claim to have "customer's privacy
and security" as their highest priority,
the previous CISO didn't think logging
was important - hence, none exist!
  
He has been brutally fired and replaced.

![bg right:30%](images/40-one_world_trade.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Cory Doctorow (CC BY-SA 2.0)" -->
Their IT environment consists of an on-prem
data center in the HQ basement for the core
banking software and credit card handling,
IaaS provided by AWS for the web/mobile
apps that customers use, and SaaS for
communication/collaboration (Office 365).
  
Their servers mainly run Linux, but there
are some Windows systems for user management
and supporting services (Active Directory).

They have several offices (with equipment
like printers) and remote workers that are
connected to an internal network using VPNs.

The client devices run Windows or macOS.

![bg right:30%](images/40-one_world_trade.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
You've been asked to provide a somewhat
detailed implementation plan as a
presentation to help them monitor
their complex IT environment.

Suggestions of software/products,
instrumented logging in bank apps,
legal/compliance advice, tweaks of
system configuration and everything
in between is highly appreciated.

The presentation should contain a
prioritized list of recommended efforts.

Keep it technical, but feel free to provide
scary examples to help seal the deal.

![bg right:30%](images/40-cyber.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Stig Nygaard (CC BY 2.0)" -->
**Any questions?**

![bg right:30%](images/40-glowing_fish.jpg)
