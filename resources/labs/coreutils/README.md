<!--
SPDX-FileCopyrightText: © 2024 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0
X-Context: Logging course - Coreutils analysis lab
-->

# Logging course - Coreutils analysis lab

## Scenario description
You're awakened from your slumber by an angry ringtone - that ringtone specially configured and
dedicated to your lovely boss. Between countless swearwords and lots of mumbling, you manage to
gather that yet another user account seems to have been hacked. To make things worse, the attacker
might have been able to access the highly sensitive customer support application. Perhaps they'll
listen to your advice about implementing MFA this time?  
  
Brew a cup and open that terminal - it's time to find out what really happened last night.


## Learning objectives
Practical knowledge of shell utilities for text filtering and extraction.


## Lab overview
The lab consist of three log files from a load-balanced web server pool in various states of
disarray:
- **"www-1.log"**: Timestamps are in UTC and the clock is correct
- **"www-2.log"**: Timestamps are in UTC and the clock is 3 minutes and 8 seconds behind
- **"www-3.log"**: Timestamps are in CEST and the clock is correct
  
In order to complete the lab, the student should adjust/synchronize timestamps, merge/sort the log 
files and produce a timeline output file for a **specified user** matching the following format:
> $DATE $TIME $IP_ADDRESS $HTTP_METHOD $PATH $STATUS_CODE

To further clarify, the output below contains an example of this format:
```
09/16 12:04:39 192.0.2.85 GET /adm/my_profile.php 200
09/16 12:04:41 127.0.0.22 POST /backup.php?s=now 500
09/16 13:05:56 192.0.2.85 POST /logout.php 200
```

All tools required to complete the assignment should be available on most Linux-based systems.
If not, install the software packages for GNU Coreutils and GNU grep (commonly called "coreutils"
and "grep").


## Tasks

### Mandatory ("G")
- Adjust timestamps in "www-2.log" to account for clock skew 
- Adjust timestamps in "www-3.log" to account time zone difference
- Merge and sort web server log files into one file
- Generate a timeline output file for the user "kim" ("r\_user" field in logs)


### Meritorious ("VG")
- Write a shell script to fully automate the mandatory tasks


### Bonus (just for fun!)
- Write an automate shell script that performs the same process for all users in the log files


## Lab report/documentation
Each student should submit a lab report containing **at least** the following information:
- Commands used to extract/filter/modify logs and produce timeline output file
- Description of the purpose for each executed command in plain English

If the extraction process has been implemented in an automated script, in-line comments may be used
to describe executed commands. Optionally, speculate what happened during the incident and what the
hacker's motivation might have been (bonus, just for fun, not graded).  
  
The lab report should be provided as a plain text file (".txt"), Markdown document or PDF file.
Upload the lab report and related files, such as the timeline result file(s) and parsing script,
to %REPORT_TARGET%.


## Guidance and resources

### Relevant utilities 
Besides "grep", the list below contains tools from Coreutils that may be useful for the lab:
- cat
- cp
- cut
- date
- echo
- grep
- nl
- printf
- rm
- sort
- tee
- tr
- uniq
- wc

### Links
- [List of Coreutils commands](https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands)
- [GNU Coreutils website](https://www.gnu.org/software/coreutils/)
- [GNU grep website](https://www.gnu.org/software/grep/)
- [Cheat sheet: date](https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/)
