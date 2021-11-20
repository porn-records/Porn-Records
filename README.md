[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3edd253ce42f4f0d8f51fbf81095090d)](https://app.codacy.com/gh/mypdns/porn-records/dashboard)

# Porn Domains

This is an endeavour to find porn domains and list them in the shortest
as possible format it can be done. This means we are not generating any
pre-configured output zone files in this project, we are simply only
storing, and verifying the availability's of the records.

We do however serve a full DNS RPZ Firewall zone from
[adult.mypdns.cloud][adult.mypdns.cloud] purely based of the records
from this repository.


## DNS zones

If you are so lucky that you have updated your system to use a DNS
resolver rather than abusing your disk-IO with the `hosts` file, we also
generate a few zone files for Unbound, dnsmasq and regular RPZ supported
resolvers.

**Note**: If you willl read more about why you should switch to a local
DNS resolver, please read this [wiki][DNS-resolver]

### hosts file Location

You can see the full matrix for hosts file locations [here][DNS-hosts]


### Safe search enabled

Additionally, there is a new source file which will enforce Safe Search
in the safer and more privacy aware [duckduckgo](https://safe.duckduckgo.com).

For unsafe search portals, we have added `Bing` and `Google` "safe search
ips".

However it has not been tested yet as both are blocked privately for
[SpyWare][SpyWare] issues with both domains in question. It can be found
[here](SafeSearch/hosts)


# The strict anti adult files

These files will contain domains which primary is used to host non-adult
related contents and for that you might feel like experience a number of
[FalsePositive][FalsePositive]s while they are in there right blacklists.

The specific readme,md for this is located [here][strict_readme.md]


## Submitting

This is where you contributes with new domains matching any of these sub
files.

```shell
submit_here
├── submit_here/adult.mypdns.cloud
│   ├── submit_here/adult.mypdns.cloud/domains.list
│   ├── submit_here/adult.mypdns.cloud/hosts.list
│   ├── submit_here/adult.mypdns.cloud/mobile.list
│   ├── submit_here/adult.mypdns.cloud/rpz-ip
│   ├── submit_here/adult.mypdns.cloud/snuff.list
│   ├── submit_here/adult.mypdns.cloud/tld.list
│   ├── submit_here/adult.mypdns.cloud/white.list
│   ├── submit_here/adult.mypdns.cloud/wildcard.list
│   └── submit_here/adult.mypdns.cloud/wildcard.rpz-nsdname
├── submit_here/README.md
├── submit_here/strict.adult.mypdns.cloud
│   ├── submit_here/strict.adult.mypdns.cloud/README.md
│   ├── submit_here/strict.adult.mypdns.cloud/strict.domains.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.hosts.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.rpz-ip
│   ├── submit_here/strict.adult.mypdns.cloud/strict.white.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.wildcard.list
│   └── submit_here/strict.adult.mypdns.cloud/strict.wildcard.rpz-nsdname
└── submit_here/whitelist.list
```


## File structure explained

| File                   | Contents / Purpose                                                                                                                                                                                                                                                                                                                                         | Used by:<br>[DNS RPZ](#dns-rpz-firewall) | Used by:<br>[Pi-Hole](#pi-hole) <br> [Hosts files](#hosts-files) |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------- | ---------------------------------------------------------------- |
| **Intro**:             | The difference between files inside `submit_here/adult.mypdns.cloud` and `submit_here/strict.adult.mypdns.cloud` is that the strict folder contains domains that otherwise *also* hosts SFW contents, while records found in the `adult.mypdns.cloud` is mainly adult domains.<br>The description of the files contents is equal independent of the folder |                                          |                                                                  |
| `domains.list`         | This file is only for domains that can not be blocked with the `wildcard.list`. This is a list of subdomains, which solely is used for porn hosting, This file is relevant in ie. open blogs domains as `*.blogspot.TLD` or [disqus.com (Adult Only)][disqus.com].                                                                                         | :heavy_check_mark:                       | :heavy_check_mark:                                               |
| `hosts.txt`            | This list is unrelated to `domains.list` and contains only supplementary records required by dumb hosts files, such as `lang.$domain.$TLD` or `cdn.$domain.$TLD` as hosts files requires exact match to function [rfc:952][rfc_952] and [rfc:1123][rfc_1123]. You should also take a look at this [wiki page][wiki_DNS_host]                               | :heavy_multiplication_x:                 | :heavy_check_mark:                                               |
| `mobile.txt`           | Same as `hosts.txt` but only mobile specific domains like `m.example.net` as this is otherwise covered by the `wildcard.list`. This list is probably as good as dead, tanks to the responseble design nowadays. This list is swallowed by the ordinary hosts or subsidiary the domain.list                                                                 | :heavy_multiplication_x:                 | :heavy_check_mark:                                               |
| `rpz-ip`               | To block any [#NSFW][NSFW] by there [ip addresses][IP_Addresses], yes, yet another cool DNS RPZ feature, hosts files doesn't have.                                                                                                                                                                                                                         | :heavy_check_mark:                       | :heavy_multiplication_x:                                         |
| `snuff.list`           | Snuff Porno (No wildcard this far as the zone is way to small for that) These records will be part of the [adult.mypdns.cloud][adult.mypdns.cloud] RPZ Firewall zone                                                                                                                                                                                       | :heavy_check_mark:                       | :heavy_check_mark:                                               |
| `tld.list`             | This list contains Top Level Domains like `.xxx` which with wildcard allow us to make a huge impact on adult specific domain. A very short list, made to avoid FP while testing with @Pyfunceble.                                                                                                                                                          | :heavy_check_mark:                       | :heavy_multiplication_x:                                         |
| `wildcard.list`        | This is the core domains for the rest of the "sub" files for which domains primarily hosting Porno and therefore can be in wildcard formats used by proper [DNS recursor's][DNS_recursor] that in full supports [DNS RPZ][DNS_RPZ]                                                                                                                         | :heavy_check_mark:                       | :heavy_check_mark:                                               |
| `whitelist.list`       | The locally hosted list for domains that never should be put into any of the above categories or lists                                                                                                                                                                                                                                                     | :heavy_check_mark:                       | :heavy_multiplication_x:                                         |
| `wildcard.rpz-nsdname` | This file is to blacklist any DNS servers, that is solely used for serving porn. By using a zone like this, we can actually minimize the entire number of entries quit a bit, as ex. all `.xxx` domains is served from the same root server. Read more about how the rpz-nsdname records on this [wiki page][wiki_rpz-nsdname]                             | :heavy_check_mark:                       | :heavy_multiplication_x:                                         |
| `README.md`            | See [submit_here/README.md](../submit_here/README.md)                                                                                                                                                                                                                                                                                                      |                                          |                                                                  |


## Combining the lists

### DNS RPZ Firewall

If you, like the rest of the world, who knows just a bit about
[DNS][DNS] and how a OS
(Operating System) are handling DNS queries over the network protocols,
you have of curse updated your local network to be using a local
[DNS resolver][DNS_recursor] that have full support of the
[Response Policy zones][DNS_RPZ], such as the
[PowerDNS Recursor][PowerDNS-Recursor] or [ICS Bind9+][ICS-Bind9],
while unbound only have partial support of DNS RPZ you will be excluded
from the benefits of the `wildcard.rpz-nsdname`.

In this case you'll only need to combine the following files.
Preferred response rule is the
["NXDOMAIN"](https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-nxdomain-action-cname-anchor-nxdomain)
Action:

  - `domains.list`
  - `rpz-ip`
  - `snuff.list`
  - `strict.wildcard.list` (Optional as this is tight blocking and 
    contains a lot of SFW domains)
  - `wildcard.list`
  - `wildcard.rpz-nsdname`


### Hosts files

If you are stocked on the very weird and extremely outdated way of
blocking DNS queries with a [hosts][wiki_DNS_host]
file. You'll need to combine all the above files into a flat `hosts`
file with the exception of `README.md`, `rpz-ip` and
`wildcard.rpz-nsdname`, however, this _WILL_ gives you to many records,
as not necessary all domains are served over both `www.$domain.tld` and
`$domain.tld` equally, you will however be covered in full.


### Pi-Hole

Since Pi-hole are crippled from using wildcard lists for blacklisting
through they have support for regex, then this is capped to be used for
internal management only. Read more about it in
[What lists to use in pi-hole][pi-hole_combo] by @pallebone


## Contributing

Any helpful [contributions][CONTRIBUTING] are appreciated.


## Contact

You can reach the team by
[issue](https://mypdns.org/my-privacy-dns/porn-records/-/issues/new "Contact My Privacy DNS") or
in one of our IRC (Internet Relay Chat) channels on libera.chat.
More about that in the support
[wiki](https://mypdns.org/mypdns/support/-/wikis/home#internet-relay-chat-irc "IRC Internet Relay Chat")


## Buzz words and keyword

Adult Only, DNS Filter, DNS Firewall, Family Filter, Family Shield,
FamilyShield, hosts file, hostsfile, Kids Safe, NSFW, parental control,
Pi-Hole, PiHole, Porn Block, Porn Blocker, Porn Detection, Porn Filter,
Porn Records, Pornhost, Pornographic, Pornography, PyFunceble, Safe Kids


## Why should I contribute
You should contribute to this list because it does matter for those who
have to block this kind of content.

Let's have a look at Cloudflares <https://cloudflare-dns.com/family/>
so called adult filter running on `1.1.1.3`

![Cloudflare-dns adult filtering](https://archive.mypdns.org/file/data/lethgvoookfqugdffqjk/PHID-FILE-fsnlpmklbe5rnalbjlip/preview-image.png)

From the test file
<https://mypdns.org/clefspeare13/pornhosts/-/blob/master/0.0.0.0/hosts>
which we are going to use for our test we see the following result and
why it matters you are contributing.

## Test result

| Status   | Percentage | Numbers |
| :------- | ---------: | ------: |
| ACTIVE   |        96% |    8615 |
| INACTIVE |         3% |     356 |
| INVALID  |         0% |       0 |

## Conclusion
We can hereby conclude this project have knowledge to 8615 domains, which
CloudFlare-dns do not know about


### Browser history

Don't forget to clear your browser history when you have bypassed these
filter!!!

[![browser history](.assets/browser-history.jpeg)](http://joyreactor.com/post/716777 "clear your browser history")


[adult.mypdns.cloud]: https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud "RPZ zone adult.mypdns.cloud"
[disqus.com]: https://mypdns.org/my-privacy-dns/porn-records/-/issues/1415 "disqus SpyWare"
[DNS_recursor]: https://mypdns.org/mypdns/support/-/wikis/dns/DnsResolver "DNS Recursor"
[DNS_RPZ]: https://mypdns.org/MypDNS/support/-/wikis/rpz/ "DNS RPZ Firewall"
[DNS]: https://mypdns.org/MypDNS/support/-/wikis/dns/
[FalsePositive]: https://mypdns.org/mypdns/support/-/wikis/False-Positive "What is: False Positive"
[ICS-Bind9]: https://mypdns.org/rpz/dns-rpz-integration/-/tree/master/Bind_9
[IP_Addresses]: https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-response-ip-address-trigger-rpz-ip
[NSFW]: https://mypdns.org/groups/my-privacy-dns/-/issues?scope=all&state=all&label_name[]=NSFW%3A%3APorn "Not Safe For Weaklings"
[PowerDNS-Recursor]: https://mypdns.org/source/pdns-recursor/
[rfc_1123]: https://www.rfc-editor.org/rfc/rfc1123 "Requirements for Internet Hosts"
[rfc_952]: https://www.rfc-editor.org/rfc/rfc952.html "DOD INTERNET HOST TABLE SPECIFICATION"
[strict_readme.md]: ../submit_here/strict.adult.mypdns.cloud/README.md
[wiki_DNS_host]: https://mypdns.org/mypdns/support/-/wikis/DNS-Hosts "DNS hostsfile wiki"
[wiki_rpz-nsdname]: https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-nsdname-trigger-rpz-nsdname-anchor-nsdname "DNS RPZ rpz-nsdname record types"
[DNS-resolver]: https://mypdns.org/mypdns/support/-/wikis/Performance-Test-of-Hosts-File-vs.-Dns-recursors "DNS recursors and DNS resolver"
[SpyWare]: https://mypdns.org/mypdns/support/-/wikis/SpyWare "What is SpyWare"
[CONTRIBUTING]: https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/CONTRIBUTING.md "How to contribute to My Privacy DNS"
[DNS-hosts]: https://mypdns.org/mypdns/support/-/wikis/DNS-Hosts#location-in-the-file-system "hosts files locations"
[pi-hole_combo]: https://mypdns.org/mypdns/support/-/issues/253 "What lists to use in pi-hole"
