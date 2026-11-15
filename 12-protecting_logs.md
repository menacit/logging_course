---
SPDX-FileCopyrightText: © 2026 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Protecting logs"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to protection of sensitive log data"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Gobi (CC BY 2.0)" -->
# Protecting log data
### CIA and general privacy

![bg right:30%](images/12-cyborg.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Gobi (CC BY 2.0)" -->
## The basics
**C:** Your logs may contain juicy secrets
that is of interest to adversaries.  

**I**: Protection of their authenticity helps
you trust them and may be a legal requirement.

**A:** When your whole environment is pwned
or down, will you be able to investigate?

Besides regular system hardening,
what else can we do?

![bg right:30%](images/12-cyborg.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
## Data classification
Not all log events are created equal:
Debug traces _VS_ Audit trails.  

Proper tagging/classification of
ingested sources aids enforcement of...

- Access control
- Retention policies
- Backup inclusion

Preferably done in cooperation with
the producer/system owner -
make sure guidelines are available.

![bg right:30%](images/12-silos.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## Append-only / Write-once storage
Certain storage mediums, like tape,
optical disks and special-purpose HDDs can
prevent data manipulation after write.

"**W**rite **O**nce **R**ead **M**any".  

A resonable compromise could be to
utilize external object storage like
AWS S3 (with timed deletion policies)
or a hash-chain protected database
such as [immudb](https://immudb.io/).

![bg right:30%](images/12-minerals.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wendelin Jacober (CC0 1.0)" -->
## Anonymization / Pseudonymization
The best way to handle storage
of PII is to not.

Anonymization removes information that
could be tied to an individual/entity.

Pseudonymization replaces information
with a stable identifier (pseudonym).

```
user_id = hash(secret + email)
```

Preferably done by producer, if possible.

![bg right:30%](images/12-mirrors.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
## Data scrubbing
Logs may contain secrets like passwords,
API keys/tokens and credit card numbers,
especially from applications configured
in "debugging" mode.  

By configuring "search-and-replace"
rules for known patterns, this sensitive
information may be automatically removed.

As previously mentioned, preferably
performed by the log producer.

![bg right:30%](images/12-cleaning.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## Availability
Can you access your logs during an attack
or outage to investigate the incident?

What dependencies exist on networking
infrastructure, centralized storage,
authentication providers, etc?

May be a decent reason for outsourcing
hosting to a third-party.

![bg right:30%](images/12-pillars.jpg)

<!--
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 3.0)" -->
## Conclusions

![bg right:30%](images/12-airship.jpg)

<!--
-->
