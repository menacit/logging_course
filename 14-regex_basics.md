---
SPDX-FileCopyrightText: © 2025 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Regular expressions"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Basics of regular expressions for logging course"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
# Regular expressions
### Data filtering and extraction

![bg right:30%](images/14-crash_dummy.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% William Warby (CC BY 2.0)" -->
As humans with a bit of technical know-how,
mentally parsing this event is easy:

```
13:36 - "Johan" logged in from 192.0.121.195
13:38 - "Sanna" logged in from 192.0.121.203
```

Mayhaps you wanna extract fields,
normalize log formats or filter events?

How can we make computers do the same
without lots of sh, grep, cut and tr?

![bg right:30%](images/14-crash_dummy.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% C. Watts (CC BY 2.0)" -->
## Introducing regular expression
Language for matching/extracting
patterns in text/data.  

Also known as **re, regex and regexp**.

Exists in several different flavors,
we'll shall focus on the widely used
**E**xtended **R**egular **E**xpressions and
**P**erl **C**ompatible **R**egular **E**xpressions.

Used by almost all logging software
for advanced field extraction/validation.

![bg right:30%](images/14-old_computers.jpg)

<!--
- Origins in 50s, use heavily in computers since late 60s
-->

---
<!-- _footer: "%ATTRIBUTION_PREFIX% C. Watts (CC BY 2.0)" -->
**Let's take it for a spin!**

![bg right:30%](images/14-old_computers.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
## Simple string matching
```
$ cat auth.log | pcregrep 'login failed'

13:49 - Admin login failed using password
13:49 - Katey login failed using password
13:51 - Admin login failed using key
13:53 - Admin login failed using TOTP
```

![bg right:30%](images/14-eye_streetart.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
## Specifying variations
```
$ cat auth.log | pcregrep \
  'login failed using (password|TOTP)'

13:49 - Admin login failed using password
13:49 - Katey login failed using password
13:53 - Admin login failed using TOTP
```

![bg right:30%](images/14-eye_streetart.jpg)

---
```
$ cat auth.log | pcregrep \
  '^\d\d:\d\d - [A-Z][a-z]+ login .+ using (TOTP|key)$'

13:51 - Admin login failed using key
13:53 - Admin login failed using TOTP
13:53 - Admin login succeeded using TOTP
```

```
^\d\d:\d\d →
Line begins with two digits, a comma and two more digits.

[A-Z][a-z]+ →
Word begins with a uppercase letter, followed by one or
more lowercase letters.

.+ →
Match one or more of any character.

(TOTP|key)$ →
Line ending with "TOTP" or "key".
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Ted Eytan (CC BY-SA 2.0)" -->
## A note about wildcards
```
. →
Matches one character of any kind.

.* →
Matches any character zero or more times.

.+ →
Matches any character one or more times.
```

![bg right:30%](images/14-teardown.jpg)

---
## Named capture groups
```
$ cat auth.log | pcregrep --only-matching=2 \
  '(?<time>.+) - (?<user>.+) login (?<result>.+) using (?<method>.+)'

Admin
Katey
Admin
Admin
Admin
```

(Typically turned into log field names, like "time" and "method")

---
## Repetition ranges and negation
```
$ cat auth.log

23:51 backup logged in
9:52 janne logged in
11:52 monitor logged in

$ cat auth.log | pcregrep --only-matching=2 \
  '^(?<time>\d{1,2}:\d{1,2}) (?<user>(?!backup|monitor).+) logged in$'

janne
```
---
<!-- _footer: "%ATTRIBUTION_PREFIX% Wolfgang Stief (CC0 1.0)" -->
## Advanced features
- Multi-line matches
- "Lookahead" / "Lookbehind"
- UTF-8 character ranges
...

Support/Implementations differ between
flavors of regular expression.

![bg right:30%](images/14-chips_pcb.jpg)

---
## Any alternatives?
Nothing that has taken off, but the
[**S**imple **R**egex **L**anguage](https://github.com/SimpleRegex) is a kool attempt:

```
/^(?:[0-9]|[a-z]|[\._%\+-])+(?:@)(?:[0-9]|[a-z]|[\.-])+(?:\.)[a-z]{2,}$/i
```

```
begin with any of (digit, letter, one of "._%+-") once or more,
literally "@",
any of (digit, letter, one of ".-") once or more,
literally ".",
letter at least 2 times,
must end, case insensitive
```

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Amy Nelson (CC BY 3.0)" -->
Regardless of its imperfections,
mastering regex is a very
worthwhile investment.
  
Scary at first, but a fundamental
skill for developers and
log/data analysts.
  
A good resource is [Deeecode's
"Simplified Regular Expressions" course](https://simpleregex.dev/)
  
Just remember to also include
negative test cases.

![bg right:30%](images/14-lizard.jpg)
