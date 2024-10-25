---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Formats and protocols"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to common log formats and protocol"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
# Log formats and protocols
### Pros/Cons of common approaches

![bg right:30%](images/16-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pelle Sten (CC BY 2.0)" -->
Enable analysis by humans and machines alike.  
  
Collect logs for centralized analysis/storage.  
  
How do we achieve this?

![bg right:30%](images/16-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas Day (CC BY 2.0)" -->
## Keeping it simple
Log events delimited by new line:

```
13:36 - "Johan" logged in from 192.0.121.195
13:38 - "Sanna" logged in from 192.0.121.203
16:20 - Invalid key from 127.0.0.1 for "Bob"
```

![bg right:30%](images/16-color_glitch.jpg)

---
We can try to parse it using some regular expressions:

```
^(?<time>\d\d:\d\d) - "(?<user>.+)" logged in from (?<ip>\d+\.\d+\.\d+\.\d+)$
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas Day (CC BY 2.0)" -->
## Ain't all that trivial
Most log files contain multiple
different event types.  

We're assuming that the format
is stable/won't change.

![bg right:30%](images/16-color_glitch.jpg)

---
## Simple key-values (KV)
```
time=13:36 type=login user=Johan ip=192.0.121.195 success=yes
time=13:38 type=login user=Sanna ip=192.0.121.203 success=yes
time=16:20 type=login user=Bob ip=127.0.0.1 success=no
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Aka Tman (CC BY 2.0)" -->
Clear and easily parsable fields.  

Requires many bytes just to describe
the log structure (wasteful).

Need to handle escaping/quoting of
special characters like spaces.  

![bg right:30%](images/16-mosaic.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## CSV
**C**omma **S**eparated **V**alues.  

```
LoginTime,User,DurationSeconds,Commands
09:42,Joe,139,apk-update apk-upgrade ps
12:52,Tim,300,dmesg top kill top reboot
22:19,Adam,36,top dmesg
```

![bg right:30%](images/16-pillars.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
~~Requires many bytes just to describe
the log structure (wasteful).~~

Need to keep the header around
and handle escaping/quoting of
delimiter character.  
  
(Confusingly, commas aren't always
used as field delimiter)

Does this field contain a
string, number or list?

![bg right:30%](images/16-pillars.jpg)

---
## JSON
**J**ava**S**cript **O**bject **N**otation.

```json
[
  {
    "LoginTime": "09:42",
    "User": "Joe",
    "DurationSeconds": 139,
    "Commands": ["apk-update", "apk-upgrade", "ps"]
  },
  {
    "LoginTime": "12:52",
    "User": "Tim",
    "DurationSeconds": 300,
    "Commands": ["dmesg", "top", "kill", "top", "reboot"]
  },
  [...]
]
```

---
## NDJSON
**N**ewline **D**elimited
**J**ava**S**cript **O**bject **N**otation.

```json
{"LoginTime": "09:42", "User": "Joe", "DurationSeconds": 139, [...]}
{"LoginTime": "12:52", "User": "Tim", "DurationSeconds": 300, [...]}
{"LoginTime": "22:19", "User": "Adam", "DurationSeconds": 36, [...]}
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Scott McCallum (CC BY-SA 2.0)" -->
## Filtering (ND)JSON with jq
```
$ cat logins_log.ndjson | jq -r '.
  | select( 
    .User != "monitor"
    and .DurationSeconds > 60
    and (.Commands | index("dmesg"))
  ) | .User'
  
Tim
```

![bg right:30%](images/16-turtle.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Scott McCallum (CC BY-SA 2.0)" -->
## Swapping problems
~~Does this field contain a
string, number or list?~~  
  
Requires many bytes just to describe
the log structure (wasteful).  

Besides data type, JSON doesn't
tell us what the field contains.  

![bg right:30%](images/16-turtle.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% ESA (CC BY 3.0 IGO)" -->  
The **G**raylog **E**xtended **L**og **F**ormat
and **E**lastic **C**ommon **S**chema try to
solve the latter problem for JSON.  

Many network/security products supports
the **C**ommon **E**vent **F**ormat,
which relies on an odd mix of
CSV and key-values.

![bg right:30%](images/16-satellite_photo.jpg)

<!--
https://www.elastic.co/docs/current/en/integrations/cef
https://www.microfocus.com/documentation/arcsight/arcsight-smartconnectors-8.3/cef-implementation-standard/Content/CEF/Chapter%201%20What%20is%20CEF.htm
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Edenpictures (CC BY 2.0)" -->
## XML
e**X**tensible **M**arkup **L**anguage.  
  
Requires an ~~honorable~~ mention.  

Similar to JSON, but with more
complexity/bells and whistles.  

Used for log storage by Windows
and other _enterprise software_.

![bg right:30%](images/16-staircase.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Milan Bhatt (CC BY-SA 2.0)" -->
Hold on a second, we still haven't solved the
"byte wasting problem"!  

Let's talk about **binary logging formats**.


![bg right:30%](images/16-whale.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
Store and/or transfer ~~key~~-values.  

Requires external schema/lookup table
to (de)serialize/parse data.

Fabricated/Mock example:
- **Byte 1 to 7**: UNIX timestamp
- **Byte 8**: Event type (Firewall reject)
- **Byte 9 to 12**: Source IP address
- **Byte 13 to 14**: Destination port
- **Byte 15 to 18**: Destination IP address
- **Byte 19 to 20**: FW rule identifier

![bg right:30%](images/16-computer_lady.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
## The pros
```
$ echo "\
2023-11-07T10:53:16+00:00 \
FW_BLOCK 10.13.37.142 3389 \
192.168.119.231 #146" \
| wc --bytes

74
```

Can save you a lot of storage/bandwidth
and many CPU cycles. Greta is happy!  

![bg right:30%](images/16-computer_lady.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
## The cons
Very unreadable for humans without a
schema and translation layer.  

Limited support in off-the-shelf
centralized logging solutions.

![bg right:30%](images/16-computer_lady.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
If you wanna learn more, check out the
[**"Protocol Buffers Documentation" website**](https://protobuf.dev/).

![bg right:30%](images/16-computer_lady.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
Alright, we've chosen a log format.  

How do we get these events to the
centralized logging server?

![bg right:30%](images/16-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## syslog
In the beginning (since 80s),
there was syslog.  

Local service and network protocol
for log collection/transfer.  

Port 514/UDP (and TCP, sometimes).  

Still dominant method for sending
logs from network equipment and
embedded appliances.

![bg right:30%](images/16-bubbles.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## Message content
- Timestamp
- Hostname/IP address
- Facility: 0-23 (11 == FTP daemon)
- Severity: 0-7 (0 == emergency)
- Process ID
- Message

\+ perhaps more, depending on which
flavor/standard is followed...

![bg right:30%](images/16-bubbles.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## What's the problem?
Loosely defined protocol.  

In practice, this result in:
- Bad support for traffic encryption
- Insufficient authentication capabilities
- Tight message size restrictions
- Limited signaling capabilities

Furthermore, it doesn't really specify
how the message part is formatted.

![bg right:30%](images/16-bubbles.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Logging over HTTPS
Well understood/supported protocol.  
  
Supports authentication, encryption,
compression and large messages.  

Quite a bit of overhead/bloat for
the logging use-case.  

Doesn't define a message format.

![bg right:30%](images/16-pyramids.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mike Grauer Jr (CC BY 2.0)" -->
## GELF
The **G**raylog **E**xtended **L**og **F**ormat
doesn't just define a message structure.  

Supports transfer via...
- UDP
- TCP
- TCP + TLS
- HTTP
- HTTPS

Hasn't yet taken over as a
syslog replacement.

![bg right:30%](images/16-qubes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% RoboticSpider (CC BY 4.0)" -->
For better or worse, most logging solutions
use their own custom agents/protocols.  

More about those later.

![bg right:30%](images/16-robot.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rising Damp (CC BY 2.0)" -->
## Wrapping it up
Log events should have a
clearly defined structure.  

Each format has its own
benefits and trade-offs.  

Insufficient standardization and
a wide range of user requirements
results in custom agents/protocols
for log transmission over networks.

![bg right:30%](images/16-phone_pole.jpg)
