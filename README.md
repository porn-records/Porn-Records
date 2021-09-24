[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3edd253ce42f4f0d8f51fbf81095090d)](https://app.codacy.com/gh/mypdns/porn-records/dashboard)

# Porn Domains

This is an endeavour to find porn domains and list them in the shortest as
possible format it can be done. This means we are not generating any pre-
configured output zone files in this project, we are simply only storing,
and verifying the availability's of the records.

We do however serve a full DNS RPZ Firewall zone from
[adult.mypdns.cloud](https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud)
purely based of the records from this repository.

## DNS zones
If you are so lucky that you have updated your system to use a DNS resolver
rather than abusing your disk-IO with the `hosts` file, we also generate a few
zone files for Unbound, dnsmasq and regular RPZ supported resolvers.

**Note**: If you willl read more about why you should switch to a local
DNS resolver, please read this
[wiki](https://mypdns.org/mypdns/support/-/wikis/Performance-Test-of-Hosts-File-vs.-Dns-recursors)

### hosts file Location
You can see the full matrix for hosts file locations
[here](https://mypdns.org/mypdns/support/-/wikis/DNS-Hosts#location-in-the-file-system)

### Safe search enabled
Additionally, there is a new source file which will enforce Safe Search
in the safer and privacy enhanced [duckduckgo](https://safe.duckduckgo.com).

For unsafe search portals, we have added `Bing` and `Google` "safe search
ips".

However it has not been tested yet as both are blocked privately for
[SpyWare](https://mypdns.org/mypdns/support/-/wikis/SpyWare) issues with
both domains in question. It can be found [here](SafeSearch/hosts)

## Submitting

This is where you contributes with new domains matching any of these sub
files.

```shell
submit_here/
├── domains.list
├── hosts.txt
├── mobile.txt
├── README.md
├── rpz-ip
├── snuff.list
├── strict_adult.list
├── whitelist.list
├── wildcard.list
└── wildcard.rpz-nsdname
```

| File                   | Contents / Category                                                                                                                                                                                                                                                                                                          |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domains.list`         | This file is only for domains that can not be blocked with the `wildcard.list`. This is a list of subdomains, which solely is used for porn hosting, This file is relevant in ie. open blogs domains as `*.blogspot.TLD`.                                                                                                    |
| `hosts.txt`            | Domain who solely serves Porno in hosts file requirements. This list is unrelated to `domains.list` and only supplementary to hosts files generation, such as `lang.$domain.$TLD` or `cdn.$domain.$TLD`                                                                                                                      |
| `mobile.txt`           | Same as `hosts.txt` but only mobile specific domains like `m.example.net` as this is otherwise covered by the `wildcard.list`. This list is probably as good as dead, tanks to the responseble design nowadays. This list is swallowed by the ordinary hosts or subsidiary the domain.list                                   |
| `README.md`            | This File                                                                                                                                                                                                                                                                                                                    |
| `rpz-ip`               | To block any [#NSFW](https://mypdns.org/groups/my-privacy-dns/-/issues?scope=all&state=all&label_name[]=NSFW%3A%3APorn) by there [ip addresses](https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-response-ip-address-trigger-rpz-ip), yes, yet another cool DNS RPZ feature, hosts files doesn't have :smiley: |
| `snuff.list`           | Snuff Porno (No wildcard this far as the zone is way to small for that) These records will be part of the [adult.mypdns.cloud](https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud) RPZ Firewall zone                                                                                                        |
| `strict_adult.list`    | This is the VERY strict list containing domain with a mixed content like ex. `4chan.org` or `fastpic.ru`. It have been lunched as [strict.adult.mypdns.cloud](https://mypdns.org/mypdns/support/-/wikis/RPZ-List#strictadultmypdnscloud) RPZ Firewall zone                                                                   |
| `wildcard.list`        | Domain who solely serves Porno and therefor can be in wildcard formats used by proper [DNS recursor's](https://mypdns.org/mypdns/support/-/wikis/dns/DnsResolver) that in full supports [DNS RPZ](https://mypdns.org/MypDNS/support/-/wikis/rpz/)                                                                            |
| `wildcard.rpz-nsdname` | This file is to blacklist any DNS servers, that is solely used for serving porn. By using a zone like this, we can actually minimize the entire number of entries quit a bit, as ex. all `.xxx`domains is served from the same root server :smiley:                                                                          |
| `whitelist.list`       | The locally hosted list for domains that never should be put into any of the above categories or lists                                                                                                                                                                                                                       |

## Combining the lists

### DNS RPZ Firewall
If you, like the rest of the world, who knows just a bit about
[DNS](https://mypdns.org/MypDNS/support/-/wikis/dns/) and how a OS
(Operating System) are handling DNS queries over the network protocols,
you have of curse updated your local network to be using a local
[DNS resolver](https://mypdns.org/mypdns/support/-/wikis/dns/DnsResolver)
that have full support of the
[Response Policy zones](https://mypdns.org/MypDNS/support/-/wikis/rpz/),
such as the [PowerDNS Recursor](https://www.mypdns.org/source/pdns-recursor/)
or [ICS Bind9+](https://mypdns.org/rpz/dns-rpz-integration/-/tree/master/Bind_9).

In this case you'll only need to combine the following files.
Preferred response rule is the
["NXDOMAIN"](https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-nxdomain-action-cname-anchor-nxdomain)
Action:

  - `domains.list`
  - `rpz-ip`
  - `snuff.list`
  - `strict_adult.list` (Optional as this is tight blocking and 
    contains a lot of SFW domains)
  - `wildcard.list`
  - `wildcard.rpz-nsdname`

### Hosts files
If you are stocked on the very weird and extremely outdated way of
blocking DNS queries with a [hosts](https://mypdns.org/mypdns/support/-/wikis/DNS-Hosts)
file. You'll need to combine all the above files into a flat `hosts`
file with the exception of `README.md`, `rpz-ip` and
`wildcard.rpz-nsdname`, however, this _WILL_ gives you to many records,
as not necessary all domains are served over both `www.$domain.tld` and
`$domain.tld` equally, you will however be covered in full.

## Contributing
Any helpful [contributions](https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/CONTRIBUTING.md)
are appreciated.

## Contact
You can reach the team by issue or in one of our IRC (Internet Relay
Chat) channels on libera.chat. More about that in the support
[wiki](https://mypdns.org/mypdns/support/-/wikis/home#internet-relay-chat-irc)

..
