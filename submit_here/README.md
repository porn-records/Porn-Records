# Submit

This is where you contributes with new domains matching any of these sub
files.

```shell
submit_here/
├── domains.list
├── hosts.txt
├── mobile.txt
├── README.md
├── rpz-ip
├── snuff.txt
├── strict_adult.txt
├── whitelist.txt
├── wildcard.list
└── wildcard.rpz-nsdname
```


| File                   | Contents / Category                                                                                                                                                                                                                             |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domains.list`         | This file is only for domains that do can not be blocked with the `wildcard.list`. This is a list of subdomains, which solely is used for porn hosting, This file is relevant in ie. open blogs domains as `*.blogspot.TLD`.                    |
| `hosts.txt`            | Domain who solely serves Porno in hosts file formatted files requirement. This list is unrelated to `domains.list` and only supplementary to hosts files generation, such as `lang.$domain.TLD` or `cdn.$domain.TLD`                            |
| `mobile.txt`           | Same as `hosts.txt` but only mobile specific domains like `m.example.net` as this is otherwise covered by the `wildcard.list`                                                                                                                   |
| `README.md`            | This File                                                                                                                                                                                                                                       |
| `rpz-ip`               | To block any porn hosted over [ip addresses](https://www.mypdns.org/w/rpz_record_types/#the-quot-response-ip-address), yes, yet another cool DNS RPZ feature, hosts files doesn't have :smiley:                                                 |
| `snuff.txt`            | Snuff Porno (No wildcard this far as the zone is way to small for that) These records will be part of the [adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#adult-mypdns-cloud) RPZ Firewall zone                                          |
| `strict_adult.txt`     | This is the VERY strict list containing domain with a mixed content like ex. `4chan.org` or `fastpic.ru`. It will later be served as [strict.adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#strict.adult-mypdns-cloud) RPZ Firewall zone |
| `wildcard.list`        | Domain who solely serves Porno in wildcard formats used for proper [DNS recursors](https://www.mypdns.org/w/dnsresolver/) that understand [DNS RPZ](https://www.mypdns.org/w/rpz/)                                                              |
| `wildcard.rpz-nsdname` | This file will blacklist all DNS AUTH servers, that is solely used for serving porn. By using a zone like this, we can actually minimize the entire quit a bit, as ex. all `.xxx`domains is served from the same root server :smiley:           |
| `whitelist.txt`        | The locally hosted list for domains that never should be put into any of the above categories or lists                                                                                                                                          |

## Combining the lists

### DNS RPZ Firewall
If you like the rest of the world who knows just a bit about
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

  - `snuff.txt`

  - `strict_adult.txt` (Optional as this is tight ass blocking)

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
