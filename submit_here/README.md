# Submit

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
│   ├── submit_here/strict.adult.mypdns.cloud/strict.domains.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.hosts.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.rpz-ip
│   ├── submit_here/strict.adult.mypdns.cloud/strict.white.list
│   ├── submit_here/strict.adult.mypdns.cloud/strict.wildcard.list
│   └── submit_here/strict.adult.mypdns.cloud/strict.wildcard.rpz-nsdname
└── submit_here/whitelist.list
```


| File                   | Contents / Purpose                                                                                                                                                                                                                                                                                                                                                  | Used by: | [DNS RPZ](#dns-rpz-firewall) | Pi-hole<br>([with wildcard](#pi-hole) support) | Pi-Hole<br>(without wildcard support) | [Hosts files](#hosts-files) |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------------- | ---------------------------------------------- | ------------------------------------- | --------------------------- |
| Intro:                 | The difference between the files inside the `submit_here/adult.mypdns.cloud` and the `submit_here/strict.adult.mypdns.cloud` is that the strict folder contains domains that otherwise hosts SFW contents, while records found in the `adult.mypdns.cloud` is mainly adult domains.<br>The description of the files contents is equal independent of the folder     |          |                              |                                                |                                       |                             |
| `domains.list`         | This file is only for domains that can not be blocked with the `wildcard.list`. This is a list of subdomains, which solely is used for porn hosting, This file is relevant in ie. open blogs domains as `*.blogspot.TLD`.                                                                                                                                           |          | :heavy_check_mark:           | :heavy_check_mark:                             | :heavy_check_mark:                    | :heavy_check_mark:          |
| `hosts.txt`            | This list is unrelated to `domains.list` and contains only supplementary records required by dumb hosts files, such as `lang.$domain.$TLD` or `cdn.$domain.$TLD` as hosts files requires exact match to function [rfc:952](http://tools.ietf.org/html/rfc952). You should also take a look at this [wiki page](https://mypdns.org/mypdns/support/-/wikis/DNS-Hosts) |          | :heavy_division_sign:        | :heavy_division_sign:                          | :heavy_check_mark:                    | :heavy_check_mark:          |
| `mobile.txt`           | Same as `hosts.txt` but only mobile specific domains like `m.example.net` as this is otherwise covered by the `wildcard.list`. This list is probably as good as dead, tanks to the responseble design nowadays. This list is swallowed by the ordinary hosts or subsidiary the domain.list                                                                          |          | :heavy_division_sign:        | :heavy_division_sign:                          | :heavy_check_mark:                    | :heavy_check_mark:          |
| `rpz-ip`               | To block any [#NSFW](https://mypdns.org/groups/my-privacy-dns/-/issues?scope=all&state=all&label_name[]=NSFW%3A%3APorn) by there [ip addresses](https://mypdns.org/mypdns/support/-/wikis/RPZ-record-types#the-response-ip-address-trigger-rpz-ip), yes, yet another cool DNS RPZ feature, hosts files doesn't have :smiley:                                        |          | :heavy_check_mark:           | :heavy_division_sign:                          | :heavy_division_sign:                 | :heavy_division_sign:       |
| `snuff.list`           | Snuff Porno (No wildcard this far as the zone is way to small for that) These records will be part of the [adult.mypdns.cloud](https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud) RPZ Firewall zone                                                                                                                                               |          | :heavy_check_mark:           | :heavy_check_mark:                             | :heavy_check_mark:                    | :heavy_check_mark:          |
| `tld.list`             | This list contains Top Level Domains like `.xxx` which with wildcard allow us to make a huge impact on adult specific domain. A very short list, made to avoid FP while testing with @Pyfunceble.                                                                                                                                                                   |          | :heavy_check_mark:           | :heavy_check_mark:                             | :heavy_division_sign:                 | :heavy_division_sign:       |
| `wildcard.list`        | Domain who solely serves Porno and therefor can be in wildcard formats used by proper [DNS recursor's](https://mypdns.org/mypdns/support/-/wikis/dns/DnsResolver) that in full supports [DNS RPZ](https://mypdns.org/MypDNS/support/-/wikis/rpz/)                                                                                                                   |          | :heavy_check_mark:           | :heavy_check_mark:                             | :heavy_check_mark:                    | :heavy_check_mark:          |
| `whitelist.list`       | The locally hosted list for domains that never should be put into any of the above categories or lists                                                                                                                                                                                                                                                              |          | :heavy_check_mark:           | :heavy_division_sign:                          | :heavy_division_sign:                 | :heavy_division_sign:       |
| `wildcard.rpz-nsdname` | This file is to blacklist any DNS servers, that is solely used for serving porn. By using a zone like this, we can actually minimize the entire number of entries quit a bit, as ex. all `.xxx`domains is served from the same root server :smiley:                                                                                                                 |          | :heavy_check_mark:           | :heavy_division_sign:                          | :heavy_division_sign:                 | :heavy_division_sign:       |
| `README.md`            | This File                                                                                                                                                                                                                                                                                                                                                           |          |                              |                                                |                                       |                             |

## Combining the lists

### DNS RPZ Firewall
If you like the rest of the world who knows just a bit about
[DNS](https://mypdns.org/w/dns/) and how a OS (Operating System) is
doing it's queries over the network protocols, you have of curse updated
your local network with a
[DNS resolver](https://mypdns.org/w/dnsresolver/) that do support
the [Response Policy zones](https://mypdns.org/w/rpz/) in full, such
as the [PowerDNS Recursor](https://mypdns.org/source/pdns-recursor/)
or [ICS Bind9+](https://mypdns.org/source/dns-rpz-integration/browse/master/Bind_9/),
while unbound only have partial support of DNS RPZ you will be excluded
from the benefits of the `wildcard.rpz-nsdname`.

In this case you'll only need to combine the following files, preferred
by [The "NXDOMAIN" Action](https://mypdns.org/w/rpz_record_types/#the-quot-nxdomain-quot-action):

  - `domains.list`
  - `snuff.txt`
  - `strict_adult.list` (Optional as this is tight ass blocking)
  - `wildcard.list`
  - `wildcard.rpz-nsdname`

### Hosts files
If you are stocked on the very weird and extremely outdated way of
blocking DNS queries with a [hosts](https://mypdns.org/w/dnshosts/)
file. You'll need to combine all the above files into a flat `hosts`
file with the exception of `README.md`, `rpz-ip` and
`wildcard.rpz-nsdname`, however, this //WILL// gives you to many records,
as not necessary all domains are served over both `www.$domain.tld` and
`$domain.tld` equally, you will however be covered in full.
