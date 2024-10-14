---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Network traffic logging"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to network traffic logging"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
# Network traffic logging

![bg right:30%](images/06-antenna_sunrise.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Freed eXplorer (CC BY 2.0)" -->
Capturing/Sniffing of network traffic
allows us to implement
**inspection-based logging**.  

Freely available tools like
**tcpdump** and **WireShark/TShark** are
easy to use on your own computer/server.

![bg right:30%](images/06-wire_tunnel.jpg)

---
```
$ tcpdump -v -n -A -i "enp2s0" -- port 80              

tcpdump: listening on enp2s0,
link-type EN10MB (Ethernet),
snapshot length 262144 bytes          

[...]
11:16:57.522596 IP (tos 0x0, ttl 64, id 33090,
offset 0, flags [DF], proto TCP (6), length 127)
198.18.100.3.45924 > 93.184.216.34.80: Flags [P.],
[...]
  GET / HTTP/1.1
  Host: example.com
  User-Agent: curl/7.81.0 
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dave Herholz (CC BY-SA 2.0)" -->
Most enterprise-grade switches supports
configuration of a **"span/mirror/tap"** port.  

Just connect a computer and start sniffing.

![bg right:30%](images/06-switches.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jon Evans (CC BY 2.0)" -->
Public-cloud features like 
**Azure Virtual Network TAP** and
**AWS Traffic Mirroring**
provide similar capabilities.

![bg right:30%](images/06-jellyfish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Oklahoma National Guard (CC BY 2.0)" -->
Enables fairly **low-friction**
logging implementations!

![bg right:30%](images/06-rappeling_worker.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
Sounds good! What's the problem?

![bg right:30%](images/06-wallcrack.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
## Resource intensive
Require many CPU cycles and lots of storage I/O operations to handle gigabits of traffic.  

You'll also need quite a bit of disk space to store all that data.

![bg right:30%](images/06-machine_cables.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mario Hoppmann (CC BY 2.0)" -->
## Prevalence of encryption
These days, most interesting network traffic is encrypted.  

Interception boxes exist to decrypt, inspect and re-encrypt data streams.  

These interceptors require tricky and risky configuration changes on all networked systems.  

![bg right:30%](images/06-polar_bear.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
Full network capture and storage is limited to highly sensitive environments with limited traffic. 

![bg right:30%](images/06-punchtape.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
## NIDS
**N**etwork **I**ntrusion **D**etection **S**ystem.  

Look for suspicious network traffic using IoCs.  

Functionality typically provided by
enterprise-grade firewalls, dedicated appliances
and open-source software (Snort, Suricata,
Zeek/Bro IDS, etc.)

Doesn't require storage of traffic.

![bg right:30%](images/06-mesh_head.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## IPS
Often extended to act as an
**I**ntrusion **P**revention **S**ystem.  

Don't just detect attacks, block them.  

Sounds great, but introduces some
availability risks.

![bg right:30%](images/06-lion.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pumpkinmook (CC BY 2.0)" -->
## Shared problems
Requires lots of computing resources.  

Limited by wide-spread use of encryption.

![bg right:30%](images/06-censored_smoke.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
Mayhaps we don't need to store all traffic,
but only **metadata**?  

Let me introduce  
**Network flow logging**.

![bg right:30%](images/06-forest_dome.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## The basics
Limit collection and storage to information
about network communication and not its content.

Many solutions define a flow as the
**same peers, protocol and
(when applicable) port**.

![bg right:30%](images/06-tripple_exposure_road.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Helsinki Hacklab (CC BY 2.0)" -->
## Argus
Highly configurable open-source software.  

Only requires a span/mirror/tap port and
commodity hardware.

![bg right:30%](images/06-umbrellas.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% NASA/Bill Stafford (CC BY 2.0)" -->
## NetFlow
Proprietary protocol developed by Cisco
for traffic meta-data logging.  

Typically implemented in hardware,
resulting in low overhead.  

Routers logging traffic (called "exporters")
send flow information to a "collector"
over the network.

May optionally use sampling to minimize
transfer/processing/storage costs.

![bg right:30%](images/06-space_training.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% NASA (CC BY 2.0)" -->
## IPFIX
Formally/Openly standardized by IETF as  
  
**I**nternet
**P**rotocol
**F**low
**I**nformation
e**X**port.  

More or less the same as NetFlow.  
  
If you wanna play with it but don't have
an "enterprise-grade" switch, try [softflowd](https://github.com/irino/softflowd).

![bg right:30%](images/06-space_walk.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kristina Hoeppner (CC BY-SA 2.0)" -->
That's neat, but how is this useful?

![bg right:30%](images/06-sheep.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Hrdina (CC BY-SA 2.0)" -->
## Operational benefits
Understand how systems really
communicate with each other.

![bg right:30%](images/06-optics.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Hrdina (CC BY-SA 2.0)" -->
> Can we decommission this server or does anything still seem to be using it?

> Is traffic really reaching the web server or is it blocked somewhere during the path?

> Which database server was the application using during a performance incident?

![bg right:30%](images/06-optics.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
## Security benefits
Detect and investigate suspicious traffic patterns.

![bg right:30%](images/06-rusty_lock.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
> A laptop has been infected with malware, did it try to communicate with anything?

> Has any device performed port scanning in our network?

> Has any of our systems communicated with a known bad host?

![bg right:30%](images/06-rusty_lock.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wendelin Jacober (CC0 1.0)" -->
## Conclusions
Complements host-based logging.  

Makes more or less sense depending on your network architecture/security model.

![bg right:30%](images/06-cyberpunk.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bixentro (CC BY 2.0)" -->
Remember that you may need permission to capture/log network traffic.

![bg right:30%](images/06-suite_graffiti.jpg)
