---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
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
Our centralized logging solution can act as
a data source for machine learning.
  
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
  
We can do the same for computers.  

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

![bg right:30%](images/30-radar.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## And as usual...
Computationally expensive and
quite opaque process.

Shit in, shit out.  

Use as guidance for development
of static detection.

![bg right:30%](images/30-radar.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Pyntofmyld (CC BY 2.0)" -->
## Semantic queries
Traditionally, we've relied on
lexical/keyword-based searching.  

**N**atural **L**anguage **P**rocessing
helps us fetch more relevant results.  

Requires better understanding of the
data we've stored/indexed.

![bg right:30%](images/30-pdp_11.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kojach (CC BY 2.0)" -->
## Conversational searching
Takes NLP one stage further by performing
the same process for search results.  

Made popular by
**L**arge **L**anguage **M**odels
like ChatGPT.  
  
Context/previous dialog should be
considered to improve experience.

![bg right:30%](images/30-punchcard.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% John Regan (CC BY 2.0)" -->
With the terms defined,
let's look at how OpenSearch can help!

![bg right:30%](images/30-turtle.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
## Managing machine learning
Most functionality provided by the
"ML Commons" plugin.  

Ability to run (pre-trained) models
on searches and indexed documents.  

Provides plumbing for using
remote models/providers.
  
Supports node tagging to optimize
things like I/O performance
and GPU access.

![bg right:30%](images/30-refinery.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Anomaly detection
Provided as a high-level feature accessible
through OpenSearch Dashboards.  

Relies on the unsupervised
**R**andom **C**ut **F**orest algorithm
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
the built-in anomaly detection won't help you.  

Still needs quite a bit of guidance, in many cases
that effort could be better spent on statically
configured thresholds/outliers.  

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

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Conversational searching
Currently provided as experimental feature.  

Integrates with OpenAI and Amazon Bedrock APIs.  
  
Would be neat to see support for self-hostable
LLMs like [LLama 2](https://ai.meta.com/llama/) to aid querying of private data.

![bg right:30%](images/30-retro_monitor.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
Just an appetizer,
I'm far from an expert!  

The features are right there, 
especially anomaly detection -
take them for a spin if you're interested.

![bg right:30%](images/30-arrow_keys.jpg)
