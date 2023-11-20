---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: OpenSearch usage basics"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Basic usage of OpenSearch for log analysis"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Steven Kay (CC BY-SA 2.0)" -->
# OpenSearch basics
### Let's search that data!

![bg right:30%](images/22-pixel_map.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steven Kay (CC BY-SA 2.0)" -->
If you have an OpenSearch instance running,
chances are that you wanna make some searches.  

We'll look at some common use-cases and how
its searching super-powers can help us. 

![bg right:30%](images/22-pixel_map.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
```json
{
  "cve_identifier": "CVE-2023-20273",
  "description": "Management interface code injection",
  "cvss_score": 7.2,
  "included_in_kev": true,
  "category": "Remote code execution",
  "date_published": "2023-10-25",
  "date_updated": "2023-11-15",
  "affected_software": [
    "Cisco IOS",
    "Cisco IOS XE"
  ]
}
```

```
$ for CVE_FILE in CVE-*; do
  curl "${BASE_URL}/myvulns/_doc/${CVE_FILE}?pretty" \
  --request PUT \
  --header "Content-Type: application/json" \
  --data @${CVE_FILE}
done
```

![bg right:30%](images/22-building_reflection.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mathias Appel (CC0 1.0)" -->
```
$ curl "${BASE_URL}/myvulns/_search?pretty" --request GET
```

```json
{
  "took" : 1,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 8,
      "relation" : "eq"
    },
    "max_score" : 1.0,
    
[...]
```

![bg right:30%](images/22-red_panda.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mathias Appel (CC0 1.0)" -->
```json
    
[...]

    "hits" : [
      {
        "_index" : "myvulns",
        "_id" : "CVE-2021-1675",
        "_score" : 1.0,
        "_source" : {
          "cve_identifier" : "CVE-2021-1675",
          "description" : "Code injection in print spooler",
          "cvss_score" : 9.3,
          "included_in_kev" : true,
          "category" : "Remote code execution",
          "date_published" : "2021-06-08",
          "date_updated" : "2022-08-01",
          "affected_software" : [
            "Microsoft Windows"
          ]
        }
[...]
```

![bg right:30%](images/22-red_panda.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Hall (CC BY 2.0)" -->
```
$ curl \
  "${BASE_URL}/myvulns/_doc/CVE-2023-36036?pretty" --request GET
```

```json
{
  "_index" : "myvulns",
  "_id" : "CVE-2023-36036",
  "_version" : 1,
  "_seq_no" : 4,
  "_primary_term" : 1,
  "found" : true,
  "_source" : {
    "cve_identifier" : "CVE-2023-36036",
    "description" : "Flaw in Windows Cloud files driver",
    "cvss_score" : 7.8,
    "included_in_kev" : true,
    "category" : "Privilege escalation",
    "date_published" : "2023-11-14",
    "date_updated" : "2023-11-14",
    "affected_software" : [
      "Microsoft Windows"
    ]
  }
}
```

![bg right:30%](images/22-arecibo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Randy Adams (CC BY-SA 2.0)" -->
```
$ curl \
  "${BASE_URL}/my_index/_doc?pretty" \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{"doc": {"cvss_score": 7.5}}'
```

```json
{
  "_index" : "my_index",
  "_id" : "OHNm64sBQrucVyA5JRdK",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 2,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 2,
  "_primary_term" : 1
}
```

![bg right:30%](images/22-abstract_pattern.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jeena Paradies (CC BY 2.0)" -->
**Let's get searching!**

![bg right:30%](images/22-stones.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
```json
{
  "query": {
    "range": {
      "date_updated": {
        "gte": "2023-11-01"
      }
    }
  }
}
```

```
$ curl \
  "${BASE_URL}/myvulns/_search?pretty" \
  --request GET \
  --header "Content-Type: application/json" \
  --data @query.json
```

![bg right:30%](images/22-negative.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fritzchens Fritz (CC0 1.0)" -->
```json
[...]

"hits" : {
  "total" : {
    "value" : 3,
    "relation" : "eq"
  },
  "max_score" : 1.0,
  "hits" : [
    {
      "_index" : "myvulns",
      "_id" : "CVE-2023-20273",
      "_score" : 1.0,
      "_source" : {
        "cve_identifier" : "CVE-2023-20273",
        "description" : "Management interface code injection",
        "cvss_score" : 7.2,
        "included_in_kev" : true,
        "category" : "Remote code execution",
        "date_published" : "2023-10-25",
        "date_updated" : "2023-11-15",
        "affected_software" : [
          "Cisco IOS",
          "Cisco IOS XE"
        ]
      }
    },

[...]
```

![bg right:30%](images/22-negative.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jack Lawrence (CC BY 2.0)" -->
```json
{
  "query": {
    "match": {
      "affected_software": {
        "query": "windows"
      }
    }
  }
}
```

![bg right:30%](images/22-plastic_duck.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jack Lawrence (CC BY 2.0)" -->
```json
[...]

"hits" : {
  "total" : {
    "value" : 2,
    "relation" : "eq"
  },
  "max_score" : 1.5532583,
  "hits" : [
    {
      "_index" : "myvulns",
      "_id" : "CVE-2021-1675",
      "_score" : 1.5532583,
      "_source" : {
        [...]
        "affected_software" : [
          "Microsoft Windows"
        ]
      }
    },
      
[...]
```

![bg right:30%](images/22-plastic_duck.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
```json
{
  "query": {
    "bool": {
      "must": [
        {
          "range": {
            "date_published": {
              "gte": "2018",
              "lte": "2022"
            }
          }
        }
      ],
      "should": [
        {
          "term": {
            "included_in_kev": {
              "value": true
            }
          }
        },
        {
          "range": {
            "cvss_score": {
              "gte": 5.5
            }
          }
        }
      ]
    }
  }
}
```

![bg right:30%](images/22-full_moon.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
```json
{
  "took" : 2,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 2,
      "relation" : "eq"
    },
    "max_score" : 2.3254223,

[...]
```

![bg right:30%](images/22-full_moon.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
```json
[...]

"hits" : [
  {
    "_index" : "myvulns",
    "_id" : "CVE-2021-1675",
    "_score" : 2.3254223,
    "_source" : {
      "cve_identifier" : "CVE-2021-1675",
      "description" : "Code injection in print spooler",
      "cvss_score" : 9.3,
      "included_in_kev" : true,
      "category" : "Remote code execution",
      "date_published" : "2021-06-08",
      "date_updated" : "2022-08-01",
      "affected_software" : [
        "Microsoft Windows"
      ]
    }
  },

[...]
```

![bg right:30%](images/22-full_moon.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
```json
[...]

  {
    "_index" : "myvulns",
    "_id" : "CVE-2019-0233",
    "_score" : 1.0,
    "_source" : {
      "cve_identifier" : "CVE-2019-0233",
      "description" : "Faulty validation in file upload",
      "cvss_score" : 5.0,
      "included_in_kev" : false,
      "category" : "Denial of service",
      "date_published" : "2020-09-14",
      "date_updated" : "2022-04-18",
      "affected_software" : [
        "Apache Struts",
        "Oracle MySQL Enterprise Monitor",
        "Oracle Financial Services Data Hub"
      ]
    }
  }

[...]
```

![bg right:30%](images/22-full_moon.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Simon Claessen (CC BY-SA 2.0)" -->
Searches in OpenSearch are
"**queries**", "**aggregations**"
or a combination of both.  

Queries return matching documents.  

Aggregations returns statistics
about document fields.  

They can be combined to filter
data for statistical analysis.

![bg right:30%](images/22-chip_macro.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lisa Brewster (CC BY-SA 2.0)" -->
```json
{
  "aggs": {
    "vulnerability_categories": {
      "terms": {
        "field": "category"
      }
    }
  }
}
```

![bg right:30%](images/22-cabling.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lisa Brewster (CC BY-SA 2.0)" -->
```
{
  "error" : {
    "root_cause" : [
      {
        "type" : "illegal_argument_exception",
        "reason" : "Text fields are not optimised for operations
                    that require per-document field data like
                    aggregations and sorting, so these operations
                    are disabled by default. Please use a
                    keyword field instead. [...]

```

![bg right:30%](images/22-cabling.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lisa Brewster (CC BY-SA 2.0)" -->
```
$ curl "${BASE_URL}/myvulns/_mapping?pretty" --request GET
```

```json
{
  "myvulns" : {
    "mappings" : {
      "properties" : {
        [...]
      
        "cvss_score" : {
           "type" : "float"
        },
        "date_published" : {
          "type" : "date"
        },
        "date_updated" : {
          "type" : "date"
        },
        "category" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
        }
[...]
```

![bg right:30%](images/22-cabling.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lisa Brewster (CC BY-SA 2.0)" -->
```json
{
  "aggs": {
    "vulnerability_categories": {
      "terms": {
        "field": "category.keyword"
      }
    }
  }
}
```

![bg right:30%](images/22-cabling.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Lisa Brewster (CC BY-SA 2.0)" -->
```json
[...]

"aggregations" : {
   "vulnerability_categories" : {
     "doc_count_error_upper_bound" : 0,
     "sum_other_doc_count" : 0,
     "buckets" : [
       {
         "key" : "Remote code execution",
         "doc_count" : 3
       },
       {
         "key" : "Privilege escalation",
         "doc_count" : 2
       },
       {
         "key" : "Authentication bypass",
         "doc_count" : 1
       },
       {
         "key" : "Cross-site scripting",
         "doc_count" : 1
       },
       {
         "key" : "Denial of service",
         "doc_count" : 1
       }
     ]

[...]
```

![bg right:30%](images/22-cabling.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bret Bernhoft (CC0 1.0)" -->
```json
{
  "query": {
    "match": {
      "affected_software": {
        "query": "Juniper Junos"
      }
    }
  },
  "aggs": {
    "vulnerability_categories": {
      "terms": {
        "field": "category.keyword"
      }
    }
  }
}
```

![bg right:30%](images/22-cyberpunk_towers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bret Bernhoft (CC0 1.0)" -->
```json
[...]

"aggregations" : {
  "vulnerability_categories" : {
    "doc_count_error_upper_bound" : 0,
    "sum_other_doc_count" : 0,
    "buckets" : [
      {
        "key" : "Authentication bypass",
        "doc_count" : 1
      },
      {
        "key" : "Remote code execution",
        "doc_count" : 1
      }
    ]
    
[...]
```

![bg right:30%](images/22-cyberpunk_towers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wendelin Jacober (CC0 1.0)" -->
OpenSearch supports ways to express queries.  

Depending on your preferences, you can utilize
**Lucene Query Language**, **DQL**, **PPL** or **SQL**.

![bg right:30%](images/22-phone_booth.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
Are you missing some of that eye candy?  

Let's do some searches and visualizations
in OpenStack Dashboards!

![bg right:30%](images/22-hole_in_wall.jpg)
