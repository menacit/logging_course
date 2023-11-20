<!--
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0
X-Context: Logging course - OpenSearch query and visualization lab
-->

# Logging course - OpenSearch query and visualization lab

## Scenario description
Whose crazy idea was it to pivot the business from lumberjacking to threat intelligence gathering?!
Nevertheless, it has been decided and we better collect some for our customers. Your ex-colleague
setup some honeypot servers and added logging agents to monitor intrusion/hacking attempts, but he
mysteriously disappeared into the woods before implementing the required analysis in your SIEM
tool to actually provide value.  
  
The bossman is furious and customers are left in the dark. Let's buckle up and analyze some intel!


## Learning objectives
Practical knowledge of querying and visualizing log data using OpenSearch.


## Lab overview
The lab environment consist of a pre-configured server running OpenSearch, OpenSearch Dashboards
and Logstash using Docker Compose. The Logstash instance is fed logs from a Linux and Windows
server exposed towards the Internet.  

In order to complete the lab, the student should create a dashboard providing insights into
scanning and intrusion attempts against the Internet-exposed servers. This entails query creation,
data aggregation, usage of visualization features and modification of log parsing.  
  
A web browser and SSH client are prerequisites for lab participation.  
  
OpenSearch Dashboards can be accessed at "https://dashboard.%LAB_DOMAIN%".
In order to modify Logstash pipeline configuration, establish a SSH connection to
"shell.%LAB_DOMAIN%" and enter the "/opt/lab_env" directory. Credentials to both services should
be provided by the course teacher.


## Tasks

### Mandatory ("G")
- Develop a query to identify failed remote Linux login attempts (SSH)
- Develop a query to identify failed remote Windows login attempts
- Create a dashboard with a geographical map widget
- Modify the widget to mark locations associated with source IP addresses of failed login attempts 


### Meritorious ("VG")
- Modify the Logstash pipeline configuration to extract usernames for SSH login attempts
- Create a dashboard widget containing the five most common usernames in failed login attempts


## Lab report/documentation
Each student should submit a lab report containing **at least** the following information ("G"):
- Search queries used in the lab and the motivation behind them
- Link to the OpenSearch dashboard containing the data visualizations
  
Optionally, it should describe changes made to the log parsing for SSH user extraction ("VG").  
  
The lab report should be provided as a plain text file (".txt"), Markdown document or PDF file.
Upload the lab report and any related files, such as modified Logstash pipeline configuration,
to %REPORT_TARGET%.


## Guidance and resources

### Triggering events of interest
In order to aid testing of search queries, events such as failed logins can be triggered by the
student by attempting to remotely access "linux.%LAB_DOMAIN%" and "windows.%LAB_DOMAIN%".

### Testing Grok patterns
When developing Grok patterns for data matching and/or extraction, testing them against samples
of data may be useful. The web based ["Grok Debugger"](https://grokdebugger.com/) can be used to
greatly aid the development processes, as it doesn't require feeding/restarting Logstash.

### Modifying Logstash configuration
The Logstash pipeline configuration is located in "/opt/lab_env/logstash.conf" on the lab server
and volume mounted into the Logstash Docker container. In order to modify the pipeline, open a SSH
connection to "shell.%LAB_DOMAIN%", enter the directory "/opt/lab_env", edit the configuration file
and issue the following command to restart Logstash:

```
$ docker compose restart logstash 
```

### Debugging OpenSearch components
In order to monitor the runtime status of OpenSearch, OpenSearch Dashboards and Logstash, open a
SSH connection to "shell.%LAB_DOMAIN%", enter the directory "/opt/lab_env" and execute the
following command:

```
$ docker compose logs
```

It may be useful to only display logs from one of these services. This can be accomplished by
appending the service/container name:

```
$ docker compose logs logstash
```

### Resetting lab environment
If the student for whatever reason desires to restore the lab environment to its initial state,
open a SSH connection to "shell.%LAB_DOMAIN%", enter the directory "/opt/lab_env" and execute the
following commands:

```
$ docker compose rm --stop --volumes
$ docker volume rm lab_env_opensearch-data
$ cp .logstash.conf.original logstash.conf
$ cp .index_template.json.original .index_template.json
$ docker compose up --detach
```

### Finding more documentation/examples
As mentioned during the lectures, OpenSearch is a fork of Elasticsearch/Kibana. While the projects
have started to diverge, most tutorials and documentation describing how to solve problems in
Elasticsearch also applies to OpenSearch.

### Links
- [Query DSL: "Match" query](https://opensearch.org/docs/latest/query-dsl/full-text/match/)
- [Introduction to OpenSearch DQL](https://opensearch.org/docs/latest/dashboards/dql/)
- [Filter plugin: Grok](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html)
- ["Grok Debugger" utility](https://grokdebugger.com/)
- [OpenSearch "Terms" aggregation](https://opensearch.org/docs/latest/aggregations/bucket/terms/)
- [Reference manual for Docker Compose](https://docs.docker.com/compose/reference/)
