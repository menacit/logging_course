---
SPDX-FileCopyrightText: © 2023 Menacit AB <foss@menacit.se>
SPDX-License-Identifier: CC-BY-SA-4.0

title: "Logging course: Instrumenting application"
author: "Joel Rangsmo <joel@menacit.se>"
footer: "© Course authors (CC BY-SA 4.0)"
description: "Considerations when instrumenting applications to produce logs"
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
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
# Instrumenting applications
### Considerations for implementation

![bg right:30%](images/31-welding.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Dennis van Zuijlekom (CC BY-SA 2.0)" -->
We've talked about the pros/cons of
**inspection-based** and
**instrumented** logging.  
  
Let's try to put our knowledge
to good use!

![bg right:30%](images/31-welding.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
## Introducing the example app
Small HTTP API to support
gift procurement during Christmas.  

Kids can add an item
to their **wish list**.  

Elves can review wish list
and add items to **gift list**.  

Santa Claus is root and can
do whatever he pleases! 

![bg right:30%](images/31-snow_station.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
### Available end-points
```python
@app.route('/api/wishes')
def handle_wishes():
  user, privileges = authenticate(request)

[...]

@app.route('/api/gifts')
def handle_gifts():
  user, privileges = authenticate(request)

[...]
```

![bg right:30%](images/31-snow_station.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
### User/Privilege configuration
```python
users = {
  '7b58a15b': 'santa',
  '5e07deaf': 'elfie',
  'e2c853dc': 'sindy',
  '85181af2': 'greta'
}

privileges = {
  'santa': ['admin'],
  'elfie': ['review_wishes', 'add_gift'],
  'sindy': ['make_wish'],
  'greta': []
}
```

![bg right:30%](images/31-snow_station.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
### Authentication mechanism
```python
def authenticate(request):
  if not 'X-Key' in request.headers:
    abort(401)

  api_key = request.headers['X-Key']

  if not api_key in users.keys():
    abort(403)

  user = users[api_key]
  return user, privileges[user]
```

![bg right:30%](images/31-snow_station.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Tobin (CC BY-SA 2.0)" -->
### Authorization control
```python
def handle_wishes():
  user, privileges = authenticate(request)

  if request.method == 'POST':
    if 'admin' in privileges:
      pass
  
    elif not 'make_wish' in privileges:
      abort(403)

    description = request.get_json()
    set_wish(user, description)

    return Response(status=204)

[...]
```

![bg right:30%](images/31-snow_station.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Theo Crazzolara (CC BY 2.0)" -->
## Let's implement some logging!

![bg right:30%](images/31-lightbulb.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bill Smith (CC BY 2.0)" -->
### Authentication failure logging
```python
def authenticate(request):
  client_ip = request.remote_addr

  if not 'X-Key' in request.headers:
    print(
      f'Request without key from {client_ip}',
      file=sys.stderr)
      
    abort(401)
    
  api_key = request.headers['X-Key']
  if not api_key in users.keys():
    print(
      f'Request with invalid key from {client_ip}',
      file=sys.stderr)
     
    abort(403)

  return users[api_key], privileges[users[api_key]]
```

![bg right:30%](images/31-sphere.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bill Smith (CC BY 2.0)" -->
### Request without key
```
$ curl --request GET "${BASE_URL}/api/gifts"
```

```
Request without key from 87.242.66.56
```

![bg right:30%](images/31-sphere.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Bill Smith (CC BY 2.0)" -->
### Request with invalid key
```
$ curl \
  --request GET "${BASE_URL}/api/gifts" \
  --header 'X-Key: hunter_2'
```

```
Request with invalid key from 23.61.227.126
```

![bg right:30%](images/31-sphere.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Solarbotics (CC BY 2.0)" -->
### Logging successful authentication
```python
[...]

user = users[api_key]
print(
  f'Authenticated request from {client_ip} as {user}',
  file=sys.stderr)

return user, privileges[user]

[...]
```

```
Authenticated request from 104.26.0.74 as sindy
```

![bg right:30%](images/31-dome_robot.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Solarbotics (CC BY 2.0)" -->
## "logging" module
Utilities to aid with log creation,
filtering and rotation.  

Can log to file, syslog, HTTP, etc.

Included in Python standard library.

![bg right:30%](images/31-reservoir_model.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Solarbotics (CC BY 2.0)" -->
### Configuring basic logger
```python
[...]

import logging as log

log.basicConfig(
  format='%(levelname)s: %(message)s',
  level=log.DEBUG)

[...]
```

![bg right:30%](images/31-reservoir_model.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Solarbotics (CC BY 2.0)" -->
### Updating logging statements
```python
[...]

if not api_key in users.keys():
  log.warn(f'Request with invalid key from {client_ip}')  
  abort(403)
  
user = users[api_key]
log.info(f'Authenticated request from {client_ip} as {user}')
return user, privileges[user]

[...]
```

![bg right:30%](images/31-reservoir_model.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Solarbotics (CC BY 2.0)" -->
### Enjoying log levels
```
INFO: Authenticated request from 172.25.0.3 as elfie
```

```
WARNING: Request without key from 65.9.55.4
```

```
WARNING: Request with invalid key from 194.18.169.38
```

![bg right:30%](images/31-reservoir_model.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
## Logging application activity
While authentication attempts are
important to log, so are the user activities.  
  
Can help us operate the service
and detect abuse.

![bg right:30%](images/31-gas_mask.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
### Adding write logging
```python
[...]

if request.method == 'POST':
  if 'admin' in privileges:
    pass

  elif not 'make_wish' in privileges:
    log.warn((
      f'User {user} from {client_ip}'
      ' tried to add a wish to their wish list'
      ' but did not have sufficient privileges'))
    
    abort(403)
    
  description = request.get_json()
  set_wish(user, description)
  log.info((
    f'User {user} from {client_ip} added '
    f'{description} to their wish list'))
    
  return Response(status=204)

[...]
```

![bg right:30%](images/31-gas_mask.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
### Adding read logging
```python
[...]

elif request.method == 'GET':
  if 'admin' in privileges:
    pass

  elif not 'review_wishes' in privileges:
    log.warn((
      f'User {user} from {client_ip}'
      ' tried to get/review the wish list'
      ' but did not have sufficient privileges'))
      
    abort(403)
    
  log.info((
    f'User {user} from {client_ip}'
    ' got/reviewed wish list'))

  return wishes

[...]
```

![bg right:30%](images/31-gas_mask.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Miguel Discart (CC BY-SA 2.0)" -->
### Inspecting the result
```
INFO: User sindy from 104.26.1.74 added
      Wine to their wish list
```

```
WARNING: User greta from 145.235.0.55 tried
         to add a wish to their wish list
         but did not have sufficient
         privileges
```

```
WARNING: User sindy from 104.26.0.74 tried to
         get/review the wish list but did not
         have sufficient privileges
```

![bg right:30%](images/31-gas_mask.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% USGS EROS (CC BY 2.0)" -->
## Templating log messages
All these format strings are getting quite repetitive.  

If we want to include information such as the requesting user agent, all lines must be modified.  

Let's try to solve it in a better way!

![bg right:30%](images/31-satellite_photo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% USGS EROS (CC BY 2.0)" -->
### Building prefix string
```python
def handle_wishes():
  user, privileges = authenticate(request)
  log_prefix = (
    f'{request.remote_addr} - {user} - '
    f'{request.method} - {request.path}: ')

[...]
```

![bg right:30%](images/31-satellite_photo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% USGS EROS (CC BY 2.0)" -->
### Updating log statements
```python
[...]

elif not 'review_wishes' in privileges:
  log.warn(
    log_prefix +
    'Tried to get/review the wish list '
    'but did not have sufficient privileges')

  abort(403)
  
log.info(log_prefix + 'Got/reviewed wish list')
return wishes

[...]
```

![bg right:30%](images/31-satellite_photo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% USGS EROS (CC BY 2.0)" -->
### Look at those entries!
```
INFO: 104.26.0.74 - sindy - POST - /api/wishes:  
      Added Wine to their wish list
```

```
INFO: 172.25.0.3 - elfie - GET - /api/wishes:   
      Got/reviewed wish list
```

```
WARNING: 145.235.0.55 - greta - POST - /api/wishes:
         Tried to add a wish to their wish list
         but did not have sufficient privileges
```

![bg right:30%](images/31-satellite_photo.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
## Structured logging
We've spent lots of time talking
about its many benefits.  

For Python, the freely available
["structlog" library](https://www.structlog.org/) can be used.

![bg right:30%](images/31-orca.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
### Importing/Configuring library
```python
import structlog

structlog.configure(
  processors=[
    structlog.processors.add_log_level,
    structlog.processors.TimeStamper(fmt='iso'),
    structlog.processors.JSONRenderer(indent=2)])

log = structlog.get_logger() 

[...]
```

![bg right:30%](images/31-orca.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
### Binding shared data
```python
def handle_wishes():
  user, privileges = authenticate(request)
  rlog = log.bind(
    source={
      'ip': request.remote_addr},
    user=user,
    privileges=privileges,
    method=request.method,
    path=request.path,
    has_required_privilege=False,
    user_agent=request.headers.get(
      'User-Agent', 'unknown'))

[...]
```

![bg right:30%](images/31-orca.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
### Producing structured logs
```python
[...]

elif not 'make_wish' in privileges:
  rlog.warn(
    'Tried to add a wish to their wish list'
    'but did not have sufficient privileges',
    required_privilege='make_wish')
  
  abort(403)

description = request.get_json()
set_wish(user, description)

rlog.info(
  f'Added {description} to their wish list',
  has_required_privilege=True,
  wish_list_item=description)
 
return Response(status=204)

[...]
```

![bg right:30%](images/31-orca.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Reid Campbell (CC0 1.0)" -->
### Such structure, many wow!
```json
{
  "source": {
    "ip": "104.26.0.74"
  },
  "user": "sindy",
  "privileges": [
    "make_wish"
  ],
  "method": "POST",
  "path": "/api/wishes",
  "has_required_privilege": true,
  "user_agent": "Firefox (Mac OS/x86_64)",
  "wish_list_item": "Wine",
  "event": "Added Wine to their wish list",
  "level": "info",
  "timestamp": "2023-11-25T14:28:42.907819Z"
}
```

![bg right:30%](images/31-orca.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Rolf Dietrich Brecher (CC BY 2.0)" -->
Things are starting to look quite nice!  

I did however notice some things
while peeking at the logs...

![bg right:30%](images/31-insect.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
```json
{
  "source": {
    "ip": "172.25.0.99"
  },
  "user": "santa",
  "privileges": [
    "admin"
  ],
  "method": "POST",
  "path": "/api/gifts",
  "has_required_privilege": true,
  "user_agent": "curl/8.4.0",
  "gift_item": "Gold chain",
  "gift_recipient": "santa",
  "event": "Granting gift to santa",
  "level": "info",
  "timestamp": "2023-11-25T14:58:12.807811Z"
}
```

![bg right:30%](images/31-red_tunnel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Kurayba (CC BY-SA 2.0)" -->
### Adding abuse detection
```python
[...]

if recipient == user:
  rlog = rlog.bind(is_suspicious=True)

[...]
```

![bg right:30%](images/31-red_tunnel.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
```json
{
  "source": {
    "ip": "172.25.0.99"
  },
  "user": "santa",
  "privileges": [
    "admin"
  ],
  "method": "DELETE",
  "path": "/api/gifts",
  "has_required_privilege": true,
  "user_agent": "curl/8.4.0",
  "recipient": "sindy",
  "event": "Deleting gift grant for sindy",
  "level": "info",
  "timestamp": "2023-11-25T14:59:42.807811Z"
}
```

![bg right:30%](images/31-red_plants.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Brendan J (CC BY 2.0)" -->
### Improving accountability
```python
[...]

elif request.method == 'DELETE':
  data = request.get_json()

  if not data['reason']:
    rlog.warn(
      'User did not specify reason'
      'for deleting gift grant')

    abort(403)
  
  rlog.info(
    'Deleting gift grant for '
    + data['recipient'],
    has_required_privilege=True,
    recipient=data['recipient'],
    reason=data['reason'])

[...]
```

![bg right:30%](images/31-red_plants.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
```json
{
  "source": {
    "ip": "172.25.0.3"
  },
  "user": "elfie",
  "privileges": [
    "review_wishes",
    "add_gift"
  ],
  "method": "POST",
  "path": "/api/gifts",
  "has_required_privilege": true,
  "user_agent": "NetScape Explorer 0.3",
  "gift_recipient": "sindy",
  "gift_item": "Winegums",
  "event": "Granting gift to sindy",
  "level": "info",
  "timestamp": "2023-11-25T15:13:02.807811Z"
}
```

![bg right:30%](images/31-red_payphone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
```json
{
  "source": {
    "ip": "172.25.0.3"
  },
  "user": "elfie",
  "privileges": [
    "review_wishes",
    "add_gift"
  ],
  "method": "POST",
  "path": "/api/gifts",
  "has_required_privilege": true,
  "user_agent": "NetScape Explorer 0.3",
  "gift_recipient": "soc_analyst",
  "gift_item": "Huge raise",
  "event": "Granting gift to soc_analyst",
  "level": "info",
  "timestamp": "2023-11-25T17:58:12.102311Z"
}
```

![bg right:30%](images/31-red_payphone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jason Thibault (CC BY 2.0)" -->
### Masking sensitive data
```python
[...]

if recipient == 'soc_analyst':
  description = '*******'

[...]
```

![bg right:30%](images/31-red_payphone.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
Besides audit information,
let's take the opportunity to
implement operational metrics!

![bg right:30%](images/31-squirell.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
### Measuring performance
```python
[...]

start_time = time.time()
set_gift(recipient, description)
end_time = time.time()
seconds_elapsed = end_time - start_time

rlog.info(
  f'Granting gift to {recipient}',
  processing_time=seconds_elapsed,
  has_required_privilege=True,
  gift_recipient=recipient,
  gift_item=description)

[...]
```

![bg right:30%](images/31-squirell.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Martin Fisch (CC BY 2.0)" -->
```json
{
  "source": {
    "ip": "172.25.0.3"
  },
  "user": "elfie",
  "privileges": [
    "review_wishes",
    "add_gift"
  ],
  "method": "POST",
  "path": "/api/gifts",
  "has_required_privilege": true,
  "user_agent": "NetScape Explorer 0.3",
  "is_suspicious": true,
  "processing_time": 0.4201374053955078,
  "gift_recipient": "elfie",
  "gift_item": "Respect",
  "event": "Granting gift to elfie",
  "level": "info",
  "timestamp": "2023-11-25T18:01:32.102311Z"
}
```

![bg right:30%](images/31-squirell.jpg)

---
<!-- _footer: "%ATTRIBUTION_PREFIX% Jonathan Brandt (CC0 1.0)" -->
## Let's wrap this up, shall we?

![bg right:30%](images/31-tumbler.jpg)
