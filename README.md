[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3edd253ce42f4f0d8f51fbf81095090d)](https://app.codacy.com/gh/mypdns/porn-records?utm_source=github.com&utm_medium=referral&utm_content=mypdns/porn-records&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.com/mypdns/porn-records.svg?branch=master)](https://travis-ci.com/mypdns/porn-records)

# Porn Domains

This is an endeavour to find all porn domains and list them in the shortest as
possible format it can be done. This means we are not generating any pre-
configured output zone files in this project, we are simply only storing,
and verifying the availability's of the records.

We do however serve a fully DNS RPZ Firewall zone from
[adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#adult-mypdns-cloud)
purely based of the records from this repository.

## DNS zones
If you are so lucky that you have updated your system to use a DNS resolver
rather than abusing your disk-IO with the `hosts` file, we also generate a few
zone files for Unbound, dnsmasq and regular RPZ supported resolvers.

*Note*: If you'll read more about why you should switch to a local DNS resolver,
Please read this
[wiki](https://www.mypdns.org/w/performance_test_of_hosts_file_vs_dns-recursors/)

### hosts file Location
You can see the full matrix for hosts file locations here:
<https://www.mypdns.org/w/dnshosts/#location-in-the-file-system>

### Safe search enabled
Additionally, there is a new source file which will enforce Safe Search in the
safer and privacy enhanged [duckduckgo](https://safe.duckduckgo.com).

For unsafe search portals, we have added `Bing` and `Google`
"safe search ips".

However it has not been tested yet as both are blocked privately for
[SpyWare](https://www.mypdns.org/w/spyware/) issues with both domains in
question. It can be found [here](SafeSearch/hosts)

## Submit

This is where you contributes with new domains matching any of these sub
files.

```
lang=shell, name=submit_here, lines=10
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

| File | Contents / Category |
| ---- | ------------------- |
| `domains.list` | This file is only for domains that can not be blocked with the `wildcard.list`. This is a list of subdomains, which solely is used for porn hosting, This file is relevant in ie. open blogs domains as `*.blogspot.TLD`.|
| `hosts.txt` | Domain who solely serves Porno in hosts file formatted requirements. This list is unrelated to `domains.list` and only supplementary to hosts files generation, such as `lang.$domain.TLD` or `cdn.$domain.TLD` |
| `mobile.txt` | Same as `hosts.txt` but only mobile specific domains like `m.example.net` as this is otherwise covered by the `wildcard.list` |
| `README.md` | This File |
| `rpz-ip` | To block any [#NSFW](https://www.mypdns.org/tag/adult_contents_blocking/) hosted over [ip addresses](https://www.mypdns.org/w/rpz_record_types/#the-quot-response-ip-address), yes, yet another cool DNS RPZ feature, hosts files doesn't have :smiley: |
| `snuff.list` | Snuff Porno (No wildcard this far as the zone is way to small for that) These records will be part of the [adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#adult-mypdns-cloud) RPZ Firewall zone |
| `strict_adult.list` | This is the VERY strict list containing domain with a mixed content like ex. `4chan.org` or `fastpic.ru`. It have been lunched as [strict.adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#strict.adult-mypdns-cloud) RPZ Firewall zone |
| `wildcard.list` | Domain who solely serves Porno and therfor can be in wildcard formats used by proper [DNS recursors](https://www.mypdns.org/w/dnsresolver/) that in full supports [DNS RPZ](https://www.mypdns.org/w/rpz/) |
| `wildcard.rpz-nsdname` | This file is to blacklist any DNS servers, that is solely used for serving porn. By using a zone like this, we can actually minimize the entire number of entries quit a bit, as ex. all `.xxx`domains is served from the same root server :smiley: |
| `whitelist.list` | The locally hosted list for domains that never should be put into any of the above categories or lists |

## Combining the lists

### DNS RPZ Firewall
If you, like the rest of the world, who knows just a bit about
[DNS](https://www.mypdns.org/w/dns/) and how a OS (Operating System) is
doing it's queries over the network protocols, you have of curse updated
your local network with a
[DNS resolver](https://www.mypdns.org/w/dnsresolver/) that do support
the [Response Policy zones](https://www.mypdns.org/w/rpz/) in full, such
as the [PowerDNS Recursor](https://www.mypdns.org/source/pdns-recursor/)
or [ICS Bind9+](https://www.mypdns.org/source/dns-rpz-integration/browse/master/Bind_9/).

In this case you'll only need to combine the following files, preferred
by [The "NXDOMAIN" Action](https://www.mypdns.org/w/rpz_record_types/#the-quot-nxdomain-quot-action):

  - `domains.list`
  - `rpz-ip`
  - `snuff.list`
  - `strict_adult.list` (Optional as this is tight blocking and
    contains a lot of SFW domains)
  - `wildcard.list`
  - `wildcard.rpz-nsdname`

### Hosts files
If you are stocked on the very weird and extremely outdated way of
blocking DNS queries with a [hosts](https://www.mypdns.org/w/dnshosts/)
file. You'll need to combine all the above files into a flat `hosts`
file with the exception of `README.md`, `rpz-ip` and
`wildcard.rpz-nsdname`, however, this //WILL// gives you to many records,
as not necessary all domains are served over both `www.$domain.tld` and
`$domain.tld` equally, you will however be covered in full.
 
## Contributing
Any helpful [contributions](https://www.mypdns.org/source/PornRecords/browse/master/CONTRIBUTING.md) are appreciated.
