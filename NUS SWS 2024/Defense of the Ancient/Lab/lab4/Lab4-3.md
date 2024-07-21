# DOTA Lab 4 Part 3

## DoS Attack

Perform a DoS attack on lab machines will cost it unable to response to the normal requests.

Attack it using

```
./slowlowris.pl -dns localhost
```

The attack is conducted by sending a huge number of normal requests to trigger a congestion of processing requests in victim server.

## Questions

#### What was the web server you attacked. Was it a recent version of the web server? What are the market shares of the top 3 web servers in the world?

The web server running on lab computer is a `Apache/Ubuntu`. The latest version of Apache is `2.4.43`.  The top 3 web server in market is `Nginx`, `Apache` and `Cloudflare Server`.

#### The webserver was set up and started by the root user on the Ubuntu machines in the lab. Why are you (a normal unix user) not able to start a web server on port 80? What is the “security” issue?

Since the low port numbers are reserved for specific use, like `80/http` and `25/smtp`, which are high risk applications. When client accesses a host with HTTP, the default port is 80 and if a vulnerable server is running on that, it might be hacked by malicious attackers, causing a serious security accident. To ensure that the user has fully understand the critical security issue, running a web server (or any other application on low ports) is considered as a sensitive behavior that will needs `sudo`.

#### Why is the web server running as www-data, and not as the user root? What is the “security” issue?

Compare to `root`, `www-data` is a unprivileged user that has only access to `/var/www/`. If the website is hacked by attacker, the attacker has no priviledge to conduct further exploitation. Therefore, it's considered as a practical measure to reduce the impact when the web server is compromised. However, the issue is yet fully solved since the attacker could exploit the kernel to escape the isolation and get the access to root user.

