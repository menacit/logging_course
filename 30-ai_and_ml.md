---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: AI/ML"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to AI/MLs role in log analysis"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Eric Chan (CC BY 2.0)" -->
# AI and ML
### Can it help us analyze logs?

![bg right:30%](images/30-jellyfish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Eric Chan (CC BY 2.0)" -->
Our centralized logging solution can act
as a data source for machine learning
and other types of AI.
  
But can it help us improve searching
and analysis?  

Let's look at common use-cases and
how they're implemented in OpenSearch!

![bg right:30%](images/30-jellyfish.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Nicholas A. Tonelli (CC BY 2.0)" -->
## Example use-cases
- Anomaly detection
- Semantic queries
- Conversational searching

![bg right:30%](images/30-abandoned_fireplace.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Anomaly detection
Human brains are trained to identify
things out of the ordinary.  
  
With a bit of work, we can make
computers do the same thing.  

Enables us to sift through enormous
amounts of logs and act before a
nuance becomes a catastrophe.

![bg right:30%](images/30-radar.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Help us identify things like...
- Unusually high API latency
- Web server spawning shell process
- User from finance department logging in to database in the middle of the night

...and things we didn't know could be
interesting - that's the whole point!

![bg right:30%](images/30-radar.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## And as usual...
Computationally expensive
and quite opaque process.

Shit in, shit out -
we need a good "baseline".

Perhaps best as guidance for
development of static detection.

![bg right:30%](images/30-radar.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Guilhem Vellut (CC BY 2.0)" -->
We'll soon look at how anomaly
detection can be implemented
using OpenSearch.

Let's talk a bit about improving
searching and analysis first!

![bg right:30%](images/30-mouxy_abandoned_house.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## Semantic queries
Traditionally, we've relied on
lexical/"keyword"-based searching.  

> Give me all logs containing the
> string "authentication".

**N**atural **L**anguage **P**rocessing
helps us fetch more relevant results.  

A good model understands the connection
between words like "authentication" and
"login"/"logout". It can also guess what
is "preambling" in our queries.

![bg right:30%](images/30-pdp_11.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kojach (CC BY 2.0)" -->
## Conversational searching
Takes NLP one stage further by performing
a similar process for search results.

Often involves usage of a
**L**arge **L**anguage **M**odels, like ChatGPT.  

Uses search results to provide answers,
not just pre-trained model data. 
  
Context/previous dialogs should be
considered to improve experience.

![bg right:30%](images/30-punchcard.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% John Regan (CC BY 2.0)" -->
With that background covered,
let's look at how OpenSearch can help!

![bg right:30%](images/30-turtle.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Managing machine learning
Most functionality is provided
by the included "ML Commons" plugin.  

Ability to run (pre-trained) models
on searches and indexed documents.  

May use "local" or "remote" models.
  
Supports "node tagging" to optimize
things like I/O performance
and GPU/accelerator access.
  
Primarily accessible using the API.

![bg right:30%](images/30-refinery.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Anomaly detection
Provided as a high-level feature accessible
through OpenSearch Dashboards.  

The easiest one to use relies on the
unsupervised **R**andom **C**ut **F**orest algorithm
to compute anomaly grades/confidence scores.  
  
Let's take it for a spin!

![bg right:30%](images/30-random_numbers.jpg)

---
![bg center 72%](images/30-anom_menu_select.png)

---
![bg center 72%](images/30-anom_select_detector_create.png)

---
![bg center 72%](images/30-anom_detector_create_name.png)

---
![bg center 72%](images/30-anom_detector_create_source.png)

---
![bg center 72%](images/30-anom_detector_create_feature.png)

---
![bg center 72%](images/30-anom_detector_create_categorical.png)

---
![bg center 72%](images/30-anom_select_detector_finish.png)

---
![bg center 72%](images/30-anom_detected.png)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Things to consider
If you can't represent it as number or aggregation,
the easy-to-use anomaly detection won't help.  

Still needs quite a bit of guidance, in many cases
that effort could be better spent on statically
configured thresholds/outliers.  

But it's kinda kool?

Curious to learn more? Have a look at the
["supported algorithms" documentation](https://docs.opensearch.org/latest/ml-commons-plugin/algorithms/).

![bg right:30%](images/30-random_numbers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Eric Nielsen (CC BY 2.0)" -->
## Semantic queries
Provides pre-trained
sentence transformation models. 

Processing implemented through
OpenSearch ingest and search pipelines
(not to be confused with Logstash pipelines).

Can be combined with traditional
keyword-based approaches to
create "hybrid queries".  
  
If you wanna play around, check out the
[semantic search tutorial](https://opensearch.org/docs/latest/ml-commons-plugin/semantic-search/).

![bg right:30%](images/30-abandoned_house.jpg)

<!--
https://opensearch.org/blog/semantic-search-solutions/
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Conversational searching
Utilize a third-party provider like
ChatGPT, Amazon Bedrock and DeepSeek.

Option to use self-hostable solution
like Cohere (\$\$\$).  

"Experimental support" for "open models"
that may be self-hosted.  

No nice "ChatGPT"-like UI provided
out-of-the-box, mainly APIs.

![bg right:30%](images/30-retro_monitor.jpg)

<!--
https://opensearch.org/docs/latest/search-plugins/conversational-search/
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
Just an appetizer, I'm far from
an expert in this area!  

The features are right there, 
especially anomaly detection -
take them for a spin if you're interested.

![bg right:30%](images/30-arrow_keys.jpg)
