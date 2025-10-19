---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Time and clocks"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to time and clock challenges in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Kenny Cole (CC BY 2.0)" -->
# Time and clocks
### A not so scary introduction

![bg right:30%](images/05-satellites.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kenny Cole (CC BY 2.0)" -->
IT systems rely on time and clocks
for a wide variety of important tasks.  

Authentication protocols, banking applications, industrial control systems...  

Allows us to **correlate** events/activity in different computers and the real world.

![bg right:30%](images/05-satellites.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
What kind of time?  

**Wall time** / **Real time**.

![bg right:30%](images/05-led_triangles.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## Keeping it simple
Most computers count number of seconds
elapsed since **the first of January 1970 (UTC)**.  

Commonly called "**UNIX time**"/"**Epoch**".  

Converted into local time/calendar date
by OS/applications.

(Await the horrors of 2038!)

![bg right:30%](images/05-pdp.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## What is a second anyway?
Something something the sun and moon.  
  
In the late 1800s, physicists tried
to properly define a second.  

**Atomic clocks** measure the resonant
frequency of atoms very precisely,
ain't [expensive\+\+ these days](https://github.com/Time-Appliances-Project/Time-Card).  

Since 1968, **BIPM** defines it as
\~9 billion frequency transitions of
Cesium 133 at -273 Celsius.

![bg right:30%](images/05-atomic_clock.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Eric Savage (CC BY-SA 2.0)" -->
Sounds quite straightforward, doesn't it?  

You're not getting away that easily.  
  
Let's talk about **time zones** and **dates**...

![bg right:30%](images/05-malachite.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
## Time zones
You wanna eat lunch around 12, right?  

Not straight lines, quite a lot of politics involved.  

Important to keep track of if we're operating internationally.

![bg right:30%](images/05-navigation_globe.jpg)

<!--
https://upload.wikimedia.org/wikipedia/commons/e/ec/World_Time_Zones_Map.svg
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Daylight savings
~~Everyone~~ Many of us love a bit of sun,
but hates being confused.  

Not everyone changes at the same time.  

Many plan to get rid of it, few have succeeded. 

...and some of those who've done it
did it in a very annoying way.

![bg right:30%](images/05-boat_sundown.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kenny Cole (CC BY 2.0)" -->
Let's make it more exciting!  

Some time zones differ by
**30 or 45 minutes**.

(Some places don't even want
24 hour days!)

![bg right:30%](images/05-penguins_and_bears.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
Why not throw in
**leap years** and **leap seconds**?

![bg right:30%](images/05-mural_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
These are not static things and can
change (_back and forth_) over time.  

Not just the Gregorian calendar.  
  
Must be remembered when performing time calculations.

![bg right:30%](images/05-the_scream.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% NASA (CC BY 2.0)" -->
Is all hope lost?  

Are we doomed to live in a confusing time warp?  

Could any somewhat sane person wrap their head around this?

![bg right:30%](images/05-earth.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Torres (CC BY 4.0)" -->
Let's meet
**Arthur David Olson** and **Paul Eggert**.

![bg right:30%](images/05-dragon_fighter.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## tz database
Dataset and reference code for working with international calendar time.  

Continuously updated for an ever-changing world.

Maintained by ICANN since 2011.

![bg right:30%](images/05-cloth_plot.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Joel Rangsmo (CC BY-SA 4.0)" -->
Challenges solved?

![bg right:30%](images/05-metal_kid_kicking_statue.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Time/Date representation
Many different formats exist for dates and timestamps.  
  
Which part is the year, month and day?
What time zone are we talking about?  

Some are more/less readable
by humans and machines alike,
like [RFC 3339](https://www.rfc-editor.org/rfc/rfc3339) and [ISO 8601](https://www.rfc-editor.org/rfc/rfc3339).

(please use one of these!)

![bg right:30%](images/05-number_pad.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
Okay okay -
Time is messy but important, we get it!

![bg right:30%](images/05-mauritius.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
## The two challenges
1. All clocks show the same time
2. All clocks show the right time

![bg right:30%](images/05-wrens.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Bommes (CC BY 2.0)" -->
In theory, if we solve the second
we should automatically solve the first.  
  
In practice, this is tricky - just trust me for now.  

Let's start with the first problem...

![bg right:30%](images/05-broken_floor.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
## NTP
**N**etwork **T**ime **P**rotocol.  

Standard for clock synchronization.
Actively developed since 1980s.
  
Replicates time over UDP port 123.
Uses _bag of tricks_ to calculate
and adjust for network delay.
  
Mitigates clock drift/skew.

![bg right:30%](images/05-lamps.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
## Example clients/servers
- ntpd
- NTPsec
- OpenNTPD
- chrony
- systemd-timesyncd

Some only implement **S**imple **NTP**.

![bg right:30%](images/05-cooling_system.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nikki Tysoe (CC BY 2.0)" -->
## Weaknesses
Plain-text protocol\* vulnerable
to **M**an-**I**n-**T**he-**M**iddle attacks.  

Precision typically limited
to milliseconds.

![bg right:30%](images/05-space_invader.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Christian Siedler (CC BY-SA 2.0)" -->
## NTS
**N**etwork **T**ime **S**ecurity.

Uses TLS and PKI to exchange key
for symmetric authenticated encryption.  
  
Extension to NTP, like HTTPS for HTTP.  

Limited software support and a bit more
resource intensive than plain NTP.

![bg right:30%](images/05-pad_locks.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Carl Davies (CSIRO) (CC BY 3.0)" -->
## PTP
**P**recision **T**ime **P**rotocol.  

Version 2 can synchronize clocks
with \~nanosecond precision.  

Enabled by special handling in
**N**etwork **I**nterface **C**ards
and **O**perating **S**ystems.

![bg right:30%](images/05-server_rack.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Andrew Hart (CC BY-SA 2.0)" -->
Our clocks are in sync!  

Let's focus on the second problem...

![bg right:30%](images/05-seals.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Warren LeMay (CC BY-SA 2.0)" -->
## What's the correct time?
In the basement of **BIPM**,
atomic clocks tick to define...

**U**niversal
**T**ime
**C**oordinated.

(not a time zone, but \~matches
GMT except no daylight savings)

![bg right:30%](images/05-vault_door.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Helsinki Hacklab (CC BY 2.0)" -->
How does my time server know
what the correct time is?  

Ask another one perhaps?

![bg right:30%](images/05-led_smile.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Freed eXplorer (CC BY 2.0)" -->
## Getting reference time
- Dedicated signaling cable
- Radio broadcast
- Satellite navigation system (GNSS, like GPS)
- Locally connected atomic clock

![bg right:30%](images/05-tunnel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
Clocks break, radio communication can be spoofed/jammed and NTP peers may lie.

What's the solution?

![bg right:30%](images/05-sphere.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Charles Hoisington, GSFC (CC BY 2.0)" -->
Use multiple sources and calculate an average!

![bg right:30%](images/05-satellite_dish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kuhnmi (CC BY 2.0)" -->
Kool - let's grab some time!

![bg right:30%](images/05-bird.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% John K. Thorne (CC0 1.0)" -->
## Using pool.ntp.org
Used as default by many operating systems
and IoT appliances.  

Run by volunteers, anyone\* can join and contribute!  

Region specific aliases, like "se.pool.ntp.org", can be used in attempts to find servers nearby.

![bg right:30%](images/05-dome_collage.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
**Cloudflare** and **NIST** provide
good alternatives/complements.

![bg right:30%](images/05-chip.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bengt Nyman (CC BY 2.0)" -->
## Using ntp.se
Also known as the
Swedish Distributed Time Service.

Funded by PTS and operated by Netnod.  

Provides highly accurate time via
Anycast from several redundant sites
spread over Sweden.  

Relies on an open-source FPGA-based
for NTP and NTS. Offers PTP.

![bg right:30%](images/05-cg_16.jpg)

<!--
https://www.netnod.se/sites/default/files/2022-06/NTS-FPGA-presentation-christer.pdf
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
Wanna geek out on time?  
  
Join the annual
**Netnod Tech Meeting**!

![bg right:30%](images/05-party.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wonderlane (CC BY 2.0)" -->
**Questions and/or thoughts?**

![bg right:30%](images/05-mechanical_sample_wall.jpg)
