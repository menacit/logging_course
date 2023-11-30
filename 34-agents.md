---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Agents"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to agents in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
# Logging agents
### Collecting and shipping data

![bg right:30%](images/34-tree_woman.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
Some applications/devices support
logging of standard protocols like
Syslog, GELF and plain HTTP.  

In many cases, we need to utilize
end-point software to collect and
ship the event data.  

These are called **logging agents**.

![bg right:30%](images/34-tree_woman.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% OLCF at ORNL (CC BY 2.0)" -->
## Choosing an agent
Input sources?  

Filtering/Manipulation capabilities?

Buffering support?

Network encryption/authentication?

Remote configuration management?

Platform/Operating system support?

![bg right:30%](images/34-server_macro.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mike Grauer Jr (CC BY 2.0)" -->
When using OpenSearch,
**Fluent Bit** and **Elastic Beats**
are the most common choices.

![bg right:30%](images/34-cubes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ludm (CC BY-SA 2.0)" -->
## Fluent Bit
Very light-weight open source logging agent.  

Supports several common data sources,
such as file, systemd's journal and
the Windows event log.

Supports wide-range of outputs, including
Logstash, Fluentd, Data Prepper and
directly writing to OpenSearch API.

![bg right:30%](images/34-bees.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jesse James (CC BY 2.0)" -->
## Elastic Beats
Family of "data shippers" developed by Elastic
and community members to replace Logstash
on end-points/log producers.  

Built using libbeat, sharing common features
and configuration file format.  
  
Available in proprietary and open-source versions.
Access to some features is restricted, like the
Auditbeat "system" module.

![bg right:30%](images/34-party.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Alan Shearman (CC BY 2.0)" -->
## Some neat features
- Fairly light-weight and portable
- Straight-forward to install and configure
- Providers several different "processors" for filtering/enrichment/anonymization
- Great control of buffering behavior and Kafka/Redis output support

![bg right:30%](images/34-fox.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## Let's have a look at...
- Filebeat
- Winlogbeat
- Packetbeat
- Auditbeat

![bg right:30%](images/34-minerals.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## Honorable mentions
- Serialbeat
- Nvidiagpubeat
- Openvpnbeat
- Browserbeat
- Discobeat

![bg right:30%](images/34-pcb_chip.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
## Filebeat
Originally designed to read logs and other data
from text files.  

Provides built-in parsers for common formats.  
  
Have integrated functionality from "journalbeat"
to read logs directly from systemd's journal.

Suffering from dissociative identity disorder,
supports reading logs from message queues,
Office365, NetFlow, TCP, etc.

![bg right:30%](images/34-logs_and_book.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
### /etc/filebeat/filebeat.yml
```yaml
---
filebeat.inputs:
  - type: "journald"
    enabled: true
    id: "everything"

filebeat.modules:
  - module: "nginx"
    error:
      enabled: true
      var.paths: ["/var/log/nginx/error.log"]
    access:
      enabled: true
      var.paths: ["/var/log/nginx/access.log"]
      input.processors:
        - replace.fields:
          - field: "message"
            pattern: "ss_nr=[0-9]+"
            replacement: "ss_nr=**********"

output.logstash:
  enabled: true
  ssl.enabled: false
  hosts:
    - "logs-a.example.com:5044"
    - "logs-b.example.com:5044"
```

![bg right:30%](images/34-logs_and_book.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
### /etc/filebeat/filebeat.yml
```yaml
---
filebeat.inputs:
  - type: "journald"
    enabled: true
    id: "everything"

[...]
```

![bg right:30%](images/34-logs_and_book.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
### /etc/filebeat/filebeat.yml
```yaml
[...]

filebeat.modules:
  - module: "nginx"
    error:
      enabled: true
      var.paths: ["/var/log/nginx/error.log"]
    access:
      enabled: true
      var.paths: ["/var/log/nginx/access.log"]
      input.processors:
        - replace.fields:
          - field: "message"
            pattern: "ss_nr=[0-9]+"
            replacement: "ss_nr=**********"

[...]
```

![bg right:30%](images/34-logs_and_book.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kylie Jaxxon (CC BY-SA 2.0)" -->
### /etc/filebeat/filebeat.yml
```yaml
[...]

output.logstash:
  enabled: true
  ssl.enabled: false
  hosts:
    - "logs-a.example.com:5044"
    - "logs-b.example.com:5044"
```

![bg right:30%](images/34-logs_and_book.jpg)

---
![bg center 75%](images/34-opensearch_filebeat_processed_field.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
## Winlogbeat
Collects data from the Windows event log.

Handles messy schema/field mapping.  
  
Commonly paired with Filebeat, as many
applications don't utilize the event log.

![bg right:30%](images/34-cd_collage.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
### C:\ProgramData\Elastic\Beats\winlogbeat\winlogbeat.yml
```yaml
---
winlogbeat.event_logs:
  - name: "Security"
  - name: "Microsoft-Windows-Sysmon/Operational"
  - name: "Microsoft-IIS-Logging/Logs"
  - name: "Windows PowerShell"
    event_id: 400, 403, 600, 800

  - name: "ForwardedEvents"
    tags: ["forwarded"]

output.logstash:
  enabled: true
  ssl.enabled: false
  hosts:
    - "logs-a.example.com:5044"
    - "logs-b.example.com:5044"
```

![bg right:30%](images/34-cd_collage.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Scott Schiller (CC BY 2.0)" -->
## Packetbeat
Agent providing inspection-based
network logging.  

Can record flow data and decode
a hand-full of common protocols
for payload monitoring.  
  
Commonly used as a bandage for
systems that have limited log
production capabilities.

Can monitor span/tap port.

![bg right:30%](images/34-payphone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Scott Schiller (CC BY 2.0)" -->
### /etc/packetbeat/packetbeat.yml
```yaml
---
packetbeat.interfaces:
  type: "af_packet"
  device: "ens3"

packetbeat.flows:
  timeout: "30s"
  period: "10s"

packetbeat.protocols:
  - type: "icmp"
    enabled: true

  - type: "dns"
    ports:
      - 53

output.logstash:
  enabled: true
  ssl.enabled: false
  hosts:
    - "logs-a.example.com:5044"
    - "logs-b.example.com:5044"
```

![bg right:30%](images/34-payphone.jpg)

---
![bg center 75%](images/34-opensearch_packetbeat_flow.png)

---
![bg center 75%](images/34-opensearch_packetbeat_icmp.png)

---
![bg center 75%](images/34-opensearch_packetbeat_dns.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Johan Neven (CC BY 2.0)" -->
## Auditbeat
Provides FIM functionality on
Linux, Windows and Mac OS.  

Consumer of audit framework on
Linux, compatible with auditd
rules configuration syntax.  
  
Closed-source version includes
"system" module, providing much
of the same functionality, but
also supports Windows/Mac OS
and with simpler configuration.

![bg right:30%](images/34-rusty_guard.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Just remember that...
There's overhead associated with processing,
especially audit events and network data.  

Neither Fluent Bit nor Elastic Beats comes with
built-in remote configuration management.

![bg right:30%](images/34-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Randy Adams (CC BY-SA 2.0)" -->
## 'Nuff talk, go ahead and try them!

![bg right:30%](images/34-mannequin.jpg)
