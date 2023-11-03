---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Analysis with Coreutils"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Introduction to log analysis with Coreutils"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
# Log analysis with Coreutils

![bg right:30%](images/07-abstract_stairs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Asparukh Akanayev (CC BY 2.0)" -->
UNIX-like systems have historically produces tons of text files containing log events.  

Take a peak in "**/var/log**".  
  
Many different tools exist to tame them.

![bg right:30%](images/07-abstract_stairs.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
## Meet GNU Coreutils
> The GNU Core Utilities are the basic file,
> shell and text manipulation utilities of
> the GNU operating system.
>
> These are the core utilities which are
> expected to exist on every operating system. 

![bg right:30%](images/07-tapes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
|                 |         |       |
|-----------------|---------|-------|
| basename        | fold    | split |
| cat             | head    | tail  |
| comm            | join    | tac   |
| cut             | md5sum  | tee   |
| date            | []/test | tr    |
| dirname         | paste   | touch |
| echo            | pr      | true  |
| expand/unexpand | seq     | uniq  |
| false           | sleep   | wc    |
| fmt             | sort    | ...   |

![bg right:30%](images/07-tapes.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Halfrain (CC BY-SA 2.0)" -->
Let's play around with some of them!

![bg right:30%](images/07-tivoli.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
### cat
```
$ cat fruits.txt

apple
banana
```

### tac
```
$ tac fruits.txt

banana
apple
```

![bg right:30%](images/07-tigers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
## Introducing grep
Almost part of Coreutils - I'm cheating a bit.  

Only output lines matching pattern:

```
$ cat favourite_countries.txt

1. Iceland
2. Kazakhstan
3. Greece
4. Turkmenistan

$ cat favourite_countries.txt | grep stan

2. Kazakhstan
4. Turkmenistan 
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
### Case-insensitive
```
$ cat logins.log | grep -i admin

18:49 - User "Administrator" logged in
```

### Multiple patterns
```
$ cat logins.log | grep -e Admin -e root

08:22 - Failed login for user "root"
18:49 - User "Administrator" logged in
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
### Inverted/Excluding match
```
$ cat berries.txt

Raspberry
Tomato
Cloudberry

$ cat berries.txt | grep -v Tomato

Raspberry
Cloudberry
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
### Including and excluding patterns
```
$ cat berries.txt

Raspberry
Tomato
Cloudberry

$ cat berries.txt | grep berry | grep -v Ras

Cloudberry
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
### Matching files
```
$ grep -l password /etc/my_app/*.conf

/etc/my_app/cache.xml
/etc/my_app/db.conf
```

### Files without matches
```
$ grep -L "Completed" /var/backup/*.log

/var/backup/mail-5_20230904.log
/var/backup/mail-5_20230905.log
/var/backup/www-2_20230904.log
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Fredrik Rubensson (CC BY-SA 2.0)" -->
### Include line before match
```
$ cat auth.log | grep -B 1 root

08:11 Successful login for:
root@127.0.0.1
```

### Include line after match
```
$ cat auth.log | grep -A 1 "login for"

08:11 Successful login for:
root@127.0.0.1
08:12 Failed login for:
backup@66.96.149.32
```

![bg right:30%](images/07-skyscraper_construction.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Takomabibelot (CC BY 2.0)" -->
Wanna know how many matches you got?  

**wc** got you covered!

```
$ cat logins.log | grep "Error" | wc -l

9001
```

![bg right:30%](images/07-number_three.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
Perhaps you're only interested in parts of the matching lines?

![bg right:30%](images/07-monkey.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
## Meet cut
Split lines for every occurrence of delimiter character into fields.

![bg right:30%](images/07-fly_on_knife.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
### Extract second space-delimited field
```
$ cat friends.txt

Eddard "Ned" Stark
Jon "Bastard" Snow

$ cat friends.txt | cut -d " " -f 2

"Ned"
"Bastard"
```

![bg right:30%](images/07-fly_on_knife.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
### Extract third comma-separated field
```
$ cat taxi_rides.log

Date,From,Destination,Cost
0930,Cityterminalen,Granö,1959
1005,Sickla,Liljeholmen,201

$ cat taxi_rides.log | cut -d "," -f 3

Destination
Granö
Liljeholmen
```

![bg right:30%](images/07-fly_on_knife.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
### Extract field three and all before
```
$ cat taxi_rides.log | cut -d "," -f -3

Date,From,Destination
0930,Cityterminalen,Granö
1005,Sickla,Liljeholmen
```

### Extract field three and all after
```
$ cat taxi_rides.log | cut -d "," -f 3-

Destination,Cost
Granö,1959
Liljeholmen,201
```

![bg right:30%](images/07-fly_on_knife.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Sergei F (CC BY 2.0)" -->
### Advanced field selection
```
$ cat numbers.txt

one two three four five six seven eight nine ten

$ cat numbers.txt | cut -d " " -f 1,3-5,8-

one three four five eight nine ten
```

![bg right:30%](images/07-fly_on_knife.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
Need to clean up your output?

**tr** may be able to help!

![bg right:30%](images/07-pcb_cleaning.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
### Replace occurrences of character
```
$ cat names.txt

Jöel
Jönas

$ cat names.txt | tr ö o

Joel
Jonas
```

![bg right:30%](images/07-pcb_cleaning.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
### Change casing of letters
```
$ cat methods.txt

get
post

$ cat methods.txt | tr "[[:lower:]]" "[[:upper:]]"

GET
POST
```

![bg right:30%](images/07-pcb_cleaning.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% The Preiser Project (CC BY 2.0)" -->
### Delete specified characters
```
$ cat username.txt

__--bogdan--__

$ cat username.txt | tr -d "_-"

bogdan
```

### Remove repeating character
```
$ cat friends.txt

Eddard  "Ned"      Stark
Jon     "Bastard"  Snow

$ cat friends.txt | tr -s " "

Eddard "Ned" Stark
Jon "Bastard" Snow
```

![bg right:30%](images/07-pcb_cleaning.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mike Grauer Jr (CC BY 2.0)" -->
Let's make things a bit more interesting by performing basic aggregation.  
  
**sort** and **uniq** are common couple for the task!

![bg right:30%](images/07-square_wave.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Mike Grauer Jr (CC BY 2.0)" -->
### Counting unique occurrences
```
$ cat logins.txt

root
root
bob
root
backup
backup
backup
root
bob

$ cat logins.txt | sort | uniq -c | sort

2 bob
3 backup
4 root
```

![bg right:30%](images/07-square_wave.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
## Let's combine them!
```
$ cat auth.log

Invalid password for user >Foobar< from 10.1.1.3:4121
Untrusted key for user >Admin< from 10.1.1.3:5124
Invalid password for user >Foobar< from 127.0.0.1:3155

$ cat auth.log \
  | grep -i -e "Invalid password" -e "Untrusted key" \
  | cut -d " " -f 5 \
  | tr -d "><" \
  | sort | uniq -c | sort

1 Admin
2 Foobar
```

![bg right:30%](images/07-abandoned_factory.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Marcin Wichary (CC BY 2.0)" -->
Many other great tools exist for
working with text filtering.  

**awk** is amazing, but uses its own custom programming language.  

**sed** is another, but heavily relies on
**regular expressions** which we'll cover later in the course!

![bg right:30%](images/07-toolbox.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
As previously mentioned, out-of-sync clocks are a common problem.  
  
Let's see how we can modify and correct timestamps in logs.

![bg right:30%](images/07-usb_leds.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
## What is date?
Command-line tool for working with calendar time.  

Uses the tz database under the hood.

![bg right:30%](images/07-pyramid.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
### Convert to different TZ
```
$ date -u --date "18:47 CET"

Wed Nov  1 05:47:00 PM UTC 2023
```

![bg right:30%](images/07-pyramid.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
### Manually correct time skew
```
$ date --date "09:50 UTC - 1 hour - 5 minutes"

Wed Nov  1 08:45:00 AM UTC 2023
```

![bg right:30%](images/07-pyramid.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Steve Jurvetson (CC BY 2.0)" -->
### Output custom time format
```
$ date --date "09:50:41 UTC" "+%H_%M (==%s)"

09_50 (==1699005041)
```

![bg right:30%](images/07-pyramid.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Murphy (CC BY-SA 2.0)" -->
Great, but how do we fix a log file?

Let's combine for-loops, cut and date!

![bg right:30%](images/07-welding_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Quinn Dombrowski (CC BY-SA 2.0)" -->
## Looping in bash
```
IFS=$'\n'

for LINE in $(cat fruits); do
  echo "It's an ${LINE}"
done

It's an apple
It's an banana
```

![bg right:30%](images/07-pandas.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
### Putting it all together
```
$ cat clock_skewed_log.txt

08:14=User "root" logged in
08:15=User "anna" logged out

IFS=$'\n'

for LINE in $(cat clock_skewed_log.txt); do
  TIMESTAMP="$(echo "${LINE}" | cut -d = -f 1)"
  MESSAGE="$(echo "${LINE}" | cut -d = -f 2-)"
  FIXED_TIMESTAMP="$(date --date "${TIMESTAMP} UTC + 45 minutes" "+%H:%m")"
  echo "${FIXED_TIMESTAMP}=${MESSAGE}"
done

08:59=User "root" logged in
09:00=User "anna" logged out
```

![bg right:30%](images/07-lego.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
Wanna store the output to a file?  

Just use basic redirection:
```
```

![bg right:30%](images/07-lego.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kristina Hoeppner (CC BY-SA 2.0)" -->
## Wrapping it up
Learning the ins and outs of Coreutils are a worth-while investment.  

When in doubt,
use the **man** and **info** commands.

With time, you'll grow your own toolbox for efficiently working with data filtering and analysis.

![bg right:30%](images/07-llama.jpg)
