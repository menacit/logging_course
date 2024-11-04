---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Enrichment"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Basics of automated enrichment in logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
# Enriching logs
### Aiding our data analysis

![bg right:30%](images/24-palais_des_congres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
"Enrichment" is the process of improving
the value of our logs.  

Often this means providing useful context
for analysts and machines alike.  

We've already played around with adding
GeoIP information.  
  
Let's look at some more examples and
how to implement them in OpenSearch.

![bg right:30%](images/24-palais_des_congres.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Enrique Jiménez (CC BY-SA 2.0)" -->
## What about that source/dest?
- IP reputation
- IP type (residential, cloud, proxy, etc.)
- Current host patch level
- Vulnerability scan and/or Shodan results
- All kinds of CMDB data!

![bg right:30%](images/24-silicon_wafer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Randy Adams (CC BY-SA 2.0)" -->
## Let's not forget humans!
- Role description
- Employment location / Timezone
- Occurrence in data leaks
- Contact information

![bg right:30%](images/24-abstract_person.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
Enrichment can be performed during
ingestion or at search-time.  

Like with field parsing, both have
their pros/cons.  

Current relevance VS Historic accuracy.  

![bg right:30%](images/24-brick_hole.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
## Useful filter plugins
- GeoIP and user agent
- DNS (forward/reverse lookups)
- Translate
- J**DB**C and Memcached
- HTTP client

...and as always, "ruby"!

![bg right:30%](images/24-polar_bear.jpg)

---
```
# Forward lookup
$ host suspicious.example.com

suspicious.example.com has address 93.184.215.14
suspiciousexample.com has IPv6 address
2606:2800:21f:cb07:6820:80da:af6b:8b2c

# Reverse lookup
$ host 93.184.215.14

14.215.184.93.in-addr.arpa domain name pointer
suspicious.example.com.
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mike Grauer Jr (CC BY 2.0)" -->
Erghh - less talk, more examples!

![bg right:30%](images/24-cubes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Theo Crazzolara (CC BY 2.0)" -->
### /var/ioc/evil\_ip.csv
```csv
157.245.96.121,Observed in logs during 2022 Xmplify incident
185.120.19.98,Associated with Explum spear phishing campaign
194.61.40.74,Have been trying to brutforce our VPN for years!
```

### Logstash filter pipeline
```ruby
[...]

if [source][ip] {
  translate {
    source => "[source][ip]"
    target => "ip_related_to_incident"
    dictionary_path => "/var/ioc/evil_ip.csv"
  }
}

[...]
```

![bg right:30%](images/24-strawberry_throne.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
```json
[...]

"must": [
  {
    "match_phrase": {
      "tags.keyword": "web_server_access"
    }
  },
  {
    "exists": {
      "field": "ip_related_to_incident"
    }
  }
]

[...]
```

![bg right:30%](images/24-rainy_street.jpg)

---
```json
[...]

"hits" : [
  {
    "_index" : "logs-web_servers-2023.11.20",
    "_id" : "6C0B74sB7PKVx7m-L2xx",
    "_score" : 1.0048822,
    "_source" : {
      "url" : "/internal/nuke_control.aspx",
      "ip_related_to_incident" : "Associated with Explum spear phishing campaign",
      "source" : {
        "ip" : "185.120.19.98",
      [...]
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bret Bernhoft (CC0 1.0)" -->
While OpenSearch relies heavily on
parsing/enrichment during ingestion,
there are some neat things we can do
at search-time.

![bg right:30%](images/24-cyberpunk_city.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lord Jaraxxus (CC BY-SA 4.0)" -->
```json
{
  "known_evil_ip_addresses": [
    "34.76.96.55",
    "198.235.24.39",
    "157.245.96.121",
    "143.198.117.36"
  ],
  "scripted_http_clients": [
    "curl",
    "Go-http-client",
    "Python Requests",
    "Nmap Network Scanner"
  ]
}
```

```
$ curl \
  "${BASE_URL}/mylookupdata/_doc/ioc" \
  --request PUT --data @ioc.json \
  --header 'Content-Type: application/json'
```

![bg right:30%](images/24-neon_sign.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
```json
{
  "query": {
    "bool": {
      "must": [
        {
          "match_phrase": {
            "tags.keyword": "web_server_access"
          }
        },
        {
          "terms": {
            "source.ip": {
              "index": "mylookupdata",
              "id": "ioc",
              "path": "known_evil_ip_addresses"
            }
          }
        }
      ],
      "must_not": [
        {
          "match": {
            "raw_user_agent": {
              "query": "CensysInspect"
            }
          }
        }
      ],
      "should": [
        {
          "terms": {
            "user_agent.name": {
              "index": "mylookupdata",
              "id": "ioc",
              "path": "scripted_http_clients"
            }
          }
        }
      ]
    }
  }
}
```

![bg right:30%](images/24-sculpture.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
```json
[...]

   "must": [
     {
       "match_phrase": {
         "tags.keyword": "web_server_access"
       }
     },
     {
       "terms": {
         "source.ip": {
           "index": "mylookupdata",
           "id": "ioc",
           "path": "known_evil_ip_addresses"
         }
       }
     }
   ],

[...]
```

![bg right:30%](images/24-sculpture.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
```json
[...]

  "must_not": [
    {
      "match": {
        "raw_user_agent": {
          "query": "CensysInspect"
        }
      }
    }
  ],

[...]
```

![bg right:30%](images/24-sculpture.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
```json
[...]

  "should": [
    {
      "terms": {
        "user_agent.name": {
          "index": "mylookupdata",
          "id": "ioc",
          "path": "scripted_http_clients"
        }
      }
    }
  ]

[...]
```

![bg right:30%](images/24-sculpture.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pedro Ribeiro Simões (CC BY 2.0)" -->
```json
[...]

  "hits" : {
    "total" : {
      "value" : 28,
      "relation" : "eq"
    },
    "max_score" : 2.0053382,
    "hits" : [
      {
        "_index" : "logs-web_servers-2023.11.20",
        "_id" : "53JE6osBQrucVyA5EqK1",
        "_score" : 2.0053382,
        "_source" : {
          "request_method": "GET"
          "request_path" : "/admin.php",
          "raw_user_agent" : "curl/8.1.2",
          "source" : {
            "ip" : "143.198.117.36",
            "geo" : {
              "country_iso_code" : "US",
              "continent_code" : "NA",
              "country_name" : "United States"
            }

[...]
```

![bg right:30%](images/24-sculpture.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
Search pipelines and Painless scripts
may be able to help, but a bit out
of scope for this course.

![bg right:30%](images/24-retro_computer.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wendelin Jacober (CC0 1.0)" -->
Elastic have since the fork added a feature
to the proprietary Elasticsearch called
"runtime" fields.  

Acts a bit like JOIN statements does in
traditional SQL databases.  
  
Very useful for enrichment and OpenSearch
is working on a similar solution.

![bg right:30%](images/24-crashed_bus.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wendelin Jacober (CC0 1.0)" -->
```json
{
  "query": {
    "match": {
      "ids_alert_title": {
        "query": "exploit attempt"
      }
    }
  },
  "runtime_mappings": {
    "cve_details": {
      "type": "lookup",
      "target_index": "myvulns",
      "input_field": "related_cve",
      "target_field": "id", 
      "fetch_fields": [
        "cvss_score",
        "description",
        "included_in_kev"
      ]
    } 
  }
}
```

![bg right:30%](images/24-crashed_bus.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC0 1.0)" -->
## The middle path
```ruby
input {
  opensearch {
    hosts => ["https://opensearch:9200"]
    user => "logger"
    password => "G0d="
    ssl => true
    ssl_certificate_verification => false

    schedule => "00 03 * * *"
    index => "logs-*"
    query => '{"query": {"match_all": {}}}'
  }
}

[...]
```

![bg right:30%](images/24-forest_road.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% OLCF at ORNL (CC BY 2.0)" -->
## Beware of the cost
Doing all that processing ain't free
and will add latency.  

Increased query and storage costs.  
  
Complexity in ingestion pipelines
increase the risk of disturbances.

![bg right:30%](images/24-data_center.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% M. Zamani, ESO (CC BY 2.0)" -->
## Conclusion
You've hopefully tasted the
sweet fruit of possibilities!  

Most organizations have tons
of potentially useful data
laying around - let's use it!
  
Computers are cheap,
humans are not.  

![bg right:30%](images/24-la_silla.jpg)
