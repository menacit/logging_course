---
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: OpenSearch introduction"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to OpenSearch for logging storage and analysis"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 3.0)" -->
# OpenSearch introduction

![bg right:30%](images/21-cyberpunk.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% David Revoy (CC BY 3.0)" -->
The OpenSearch project aims to
provide an open-source software suite for
data processing, analysis and visualization.  
  
Popular choice for centralized logging.  

Platform used in coming labs and presentations.

![bg right:30%](images/21-cyberpunk.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## History / Background
In the beginning, there was
**E**lasticsearch, **K**ibana and **L**ogstash,
which formed the open-source "**ELK stack**".  

Loved by devops teams, security analysts
and data scientists alike.  

The company leading development, **Elastic**,
made money by selling proprietary plugins
(called "X-Pack") and support/services.

![bg right:30%](images/21-skyscrapers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
The community developed freely available
plugins that matched many of Elastic's
proprietary features.  

The "**Open Distro**" project packaged
these together with the open-source
ELK-components to provide a fully
usable out-of-the-box experience. 

Elastic didn't like this and were mad
at the big cloud providers for selling
"ELK as a Service" without willingly
"giving them their fair share".

![bg right:30%](images/21-skyscrapers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Price Capsule (CC BY-SA 2.0)" -->
In 2021, Elastic closed-sourced
Elasticsearch and Kibana.

This made the community and
companies basing their services
on the ELK stack a bit grumpy.  

The OpenSearch project was formed
to provide an open-source fork.  

Developed by the community, supported
by the [OpenSearch Software Foundation](https://foundation.opensearch.org/).

![bg right:30%](images/21-desert_hut.jpg)

---
![bg center:100%](images/21-stack_overview.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
## OpenSearch
Fork of Elastic's "**Elasticsearch**".  
  
It's a search engine, powered by
**Apache Lucene**, but you can
think of it as a database.  
  
Users can submit **arbitrary JSON objects**
to an **index**. Once stored, they are
called "**documents**" and become
available for queries/analysis.

![bg right:30%](images/21-chip.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
**Ehmm, perhaps a demonstration
might be reasonable?**

![bg right:30%](images/21-chip.jpg)

---
```
$ curl \
  "https://teacher:hunter_2@search-engine.logs.labs.teaching.sh/" \
  --request GET
```

```json
{
  "name" : "893e26a2db10",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "dVw9XlAYQk2laTvVSv7LpA",
  "version" : {
    [...]
    "minimum_wire_compatibility_version" : "7.10.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "The OpenSearch Project: https://opensearch.org/"
}
```

---
```
$ BASE_URL="https://teacher:hunter_2@search-engine.logs.labs.teaching.sh"
$ curl "${BASE_URL}/" --request GET

```

```json
{
  "name" : "893e26a2db10",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "dVw9XlAYQk2laTvVSv7LpA",
  "version" : {
    [...]
    "minimum_wire_compatibility_version" : "7.10.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "The OpenSearch Project: https://opensearch.org/"
}
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fandrey (CC BY 2.0)" -->
```json
{
  "name": "Test Examplesson",
  "kool": false,
  "age": 42
}
```

```
$ curl "${BASE_URL}/myindex/_doc?pretty" \
  --request POST \
  --header "Content-Type: application/json" \
  --data @example-document.json
```

```json
{
  "_index" : "myindex",
  "_id" : "RXE06IsBQrucVyA52bmU",
  "_version" : 1,
  "result" : "created",
  [...]
}
```

![bg right:30%](images/21-console_beastie.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fandrey (CC BY 2.0)" -->
```
$ curl \
  "${BASE_URL}/myindex/_search?pretty" \
  --request GET
```

```json
{
  [...]
  "hits" : {
    "max_score" : 1.0,
    "hits" : [
      {
        "_index" : "myindex",
        "_id" : "h3Ey6IsBQrucVyA5xLjN",
        "_score" : 1.0,
        "_source" : {
          "name" : "Test Examplesson",
          "kool" : false,
          "age" : 42
        }
        [...]
```

![bg right:30%](images/21-console_beastie.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fibreman (CC0 1.0)" -->
Why is it kool?  
  
Amazing analytics capabilities
and quite easy to scale!

![bg right:30%](images/21-laser.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
## Data storage
**Documents** are grouped in **indices**.

**Documents** in an **index** are
stored in one or more **shards**.  

**Shards** are spread over
one or more **nodes**.

![bg right:30%](images/21-ayeaye.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% ORNL (CC BY 2.0)" -->
## Node clustering
OpenSearch is "cluster-first".  
  
Adding more nodes and shards can improve
capacity, performance and availability.  
  
Can be scaled down to save
money/electricity.  

Node types can be mixed and matched to
implement storage/processing tiers.

![bg right:30%](images/21-server_rack.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
## Searching capabilities
Swiss army knife of data analysis.  

Full-text queries and advanced aggregation.  

Includes plugins out-of-the-box for
machine learning, correlation, etc.

![bg right:30%](images/21-bees.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
## Detailed field mapping
Besides the JSON data types, such as strings,
integers and arrays, several others are supported
to aid the search engine find relevant results.

```json
{
  "mappings": {
    "properties": {
      "source.ip": {
        "type": "ip"
      },
      "source.geo.location": {
        "type": "geo_point"
      }
    }
  }
}
```

![bg right:30%](images/21-greek_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jan Helebrant (CC0 1.0)" -->
OpenSearch is a complex beast.  
  
Takes quite a bit of expertise
to manage and use.  
  
Don't feel bad if you're
getting confused.  
  
We'll focus the use-case of
centralized logging.  

![bg right:30%](images/21-ancient_stairs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
Let's move on, shall we?
  
Next up is data ingestion! 

![bg right:30%](images/21-singapore_street.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kevin Dooley (CC BY 2.0)" -->
## Logstash
Helps us to build log processing pipelines!

Supports wide range of "inputs", "filters"
and "outputs" to enable centralized logging
in heterogeneous IT environments.

Development led by Elastic,
available under an open-source license.

![bg right:30%](images/21-pipes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## What is a pipeline?
Pipelines consist of three stages:
1. **Input**: Specify how to receive/collect events
2. **Filter**: Manipulate, enrich and drop events
3. **Output**: Do something with processed events
  
The filter stage effectively acts as a
script being executed for each log event.

A Logstash instance can run one or more
processing pipelines simultaneously.  

![bg right:30%](images/21-forest_log.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Gytis B (CC BY-SA 2.0)" -->
## Input stage
A single pipeline can have one or more
inputs configured, such as:
- HTTP(S)
- Syslog
- Netflow / IPFIX
- S3 object storage
- Redis / Kafka
- Scheduled command execution
- ~~Twitter~~ X feed

![bg right:30%](images/21-vechicle_graveyard.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Julie Cotinaud (CC BY-SA 2.0)" -->
## Filter stage
Conditionally execute zero or more
filter plugins depending on event
content or external factors.  
  
Can look a lot like a script with
if-else conditions and "function calls"
to plugins for manipulating/enriching
log events.

![bg right:30%](images/21-dice.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Julie Cotinaud (CC BY-SA 2.0)" -->
| Name        | Use-cases                                             |
|-------------|-------------------------------------------------------|
| mutate      | Rename/Normalize fields, change casing, remove fields |
| drop        | Stop processing/forwarding of event                   |
| grok        | Use regex to match events and extract field data      |
| cipher      | Pseudonomization of PII/credentials, data decoding    |
| ruby        | Whatever you can think of!                            |

![bg right:30%](images/21-dice.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
## Output stage
A single pipeline can have one or more
outputs configured, such as:

- File
- Syslog
- Elasticsearch / OpenSearch
- Logstash
- IRC

Conditional statements can be used to
control which output is used based on
event content.

![bg right:30%](images/21-cherry_trees.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Peter Black (CC BY-SA 2.0)" -->
Still a bit confused?  

Let's peak at a real example
from the lab environment!

![bg right:30%](images/21-satellite_dish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Raphaël Vinot (CC BY 2.0)" -->
```ruby
input {
  # JSON objects POSTed via HTTP
  http {
    type => "json_events"
    port => 8080
    codec => json
  }

  # Events from logging agents
  beats {
    type => "local_events"
    port => 5044
  }
  
[...]
```

![bg right:30%](images/21-arecibo_dish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
```ruby
filter {

  # Parse NGINX web server logs
  if [event][dataset] == "nginx.access" {
    # Tag added to all web server access logs,
    # regardless of server software used
    mutate {
      add_tag => [
        "web_server_access"
      ]
    }

    # Use Grok (regular expressions on steroids)
    # to extract fields from event.
    grok {
      match => {
        "message" => "%{IPORHOST:[source][ip]} - \
        %{DATA:user} \[%{HTTPDATE:time}\] [...]"

[...]
```

![bg right:30%](images/21-yemen_mountains.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
```ruby
[...]

  # Parse time from request and replace existing
  # timestamp, as the former is based on when
  # the log event was picked up by the shipping
  # agent and not when the request actually
  # happened
  date {
    match => ["time", "dd/MMM/YYYY:HH:mm:ss Z"]
    target => "@timestamp"
    remove_field => "time"
  }

[...]
```

![bg right:30%](images/21-yemen_mountains.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
```ruby
[...]

  # Tag and normalize pre-structured IIS web server logs
  if [event][provider] == "Microsoft-Windows-IIS-Logging" {
    # Normalize field names by creating copies and tag as
    # web server log
    mutate {
      add_tag => [
        "web_server_access"
      ]
  
      # We're making a copy of the fields instead of changing
      # their names, as some already existing queries may
      # rely upon them
      copy => {
        "[winlog][event_data][c-ip]" => "[source][ip]"
        "[winlog][event_data][csUser-Agent]" => "raw_user_agent"
        "[winlog][event_data][sc-status]" => "response_code"
      }
  
[...]
```

![bg right:30%](images/21-yemen_mountains.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
```ruby
[...]

  # If event is a web server access log, parse
  # user agent string and extract information,
  # such as browser and operating system version
  if ("web_server_access" in [tags]) {
    useragent {
      source => "raw_user_agent"
      target => "user_agent"
    }
  }
  
  # If event contains a field called "source.ip,
  # lookup  IP address in GeoIP database to find
  # information about its approximate location
  if [source][ip] {
    geoip {
      source => "[source][ip]"
    }
  }

[...]
```

![bg right:30%](images/21-yemen_mountains.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rod Waddington (CC BY-SA 2.0)" -->
```ruby
[...]

  # The remaing parts of the filter section
  # are just used to control in which index
  # the event will be stored in
  if ("web_server_access" in [tags]) {
    mutate {
      add_field => {
        "index_suffix" => "web_servers"
      }
    }
    	
  } else if [type] == "json_events" {
    mutate {
      add_field => {
        "index_suffix" => "json" 
      }
    }

[...]
```

![bg right:30%](images/21-yemen_mountains.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nacho Jorganes (CC BY-SA 2.0)" -->
```ruby
output {
  opensearch {
    hosts => ["https://opensearch:9200"]

    # Use variable specified during event
    # filtering and date expression to
    # control which index is used for data
    # storage. The date expression will
    # result in new indexes being created
    # each day, making rotation/retention
    # easier to control
    index => "logs-%{index_suffix}-%{+YYYY.MM.dd}"

    user => "logger"
    password => "G0d="
    ssl => true
    ssl_certificate_verification => false
  }
}
```

![bg right:30%](images/21-cow.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jorge Franganillo (CC BY 2.0)" -->
While extremely flexible, Logstash is
quite complex and resource hungry.  

Alternatives exist, such as
[OpenSearch Data Prepper](https://opensearch.org/docs/latest/data-prepper/index/)
and [Fluentd](https://www.fluentd.org/).

![bg right:30%](images/21-bumper_cars.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sbmeaper1 (CC0 1.0)" -->
How do we get our logs to Logstash?  

Drop em' Beats!

![bg right:30%](images/21-stairs_balloons.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Beats
Family of light-weight log agents.

Filebeat, Winlogbeat, Auditbeat,
Metricbeat, Packetbeat, Heartbeat...

Development led by Elastic,
available under an open-source license.
  
We'll talk more about these later!

![bg right:30%](images/21-abandoned_bus.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
I'm tired of staring at text
in the terminal!  

Let's have a look at
OpenSearch Dashboards.

![bg right:30%](images/21-akihabara.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% NASA/Chris Gunn (CC BY 2.0)" -->
## OpenSearch Dashboards
Fork of Elastic's "**Kibana**".  

Web application that exposes analytics
capabilities and provides several data
visualization features.  

The main interface humans use for
interaction with OpenSearch.

![bg right:30%](images/21-james_webb.jpg)

---
![bg center 75%](images/21-dashboard_home.png)

---
![bg center 75%](images/21-dashboard_menu_discover.png)

---
![bg center 75%](images/21-dashboard_create_index_pattern_start.png)

---
![bg center 75%](images/21-dashboard_create_index_pattern_myindex.png)

---
![bg center 75%](images/21-dashboard_create_index_pattern_field_types.png)

---
![bg center 75%](images/21-dashboard_discover_myindex.png)

---
![bg center 75%](images/21-dashboard_visualizations.png)

---
![bg center 75%](images/21-dashboard_menu_dashboard_management.png)

---
![bg center 75%](images/21-dashboard_create_index_pattern_logs.png)

---
![bg center 75%](images/21-dashboard_create_index_pattern_time_field.png)

---
![bg center 75%](images/21-dashboard_discover_logs.png)

---
![bg center 75%](images/21-dashboard_menu_dev_tools.png)

---
![bg center 75%](images/21-dashboard_console.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
We've just dipped our toes so far.  

During the rest of the course we'll
continue exploring!

![bg right:30%](images/21-mountains.jpg)
