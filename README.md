[![Codacy Badge](https://api.codacy.com/project/badge/Grade/84b46b76e27740bb9eb3770dc6b004a2)](https://app.codacy.com/gh/mypdns/porn-domains?utm_source=github.com&utm_medium=referral&utm_content=mypdns/porn-domains&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.com/mypdns/porn-domains.svg?branch=master)](https://travis-ci.com/mypdns/porn-domains)

# Porn Domains

This is an endeavor to find all porn domains and compile them into a fully
DNS Firewall compliant RPZ formatted zone under the
[adult.mypdns.cloud](https://www.mypdns.org/w/rpzlist/#adult-mypdns-cloud).

### DNS zones
If you are so lucky that you have updated your system to use a DNS resolver
rather than abusing your disk-IO with the `hosts` file, we also generate a few
zone files for Unbound, dnsmasq and regular RPZ supported resolvers.

*Note*: If you'll read more about why you should switch to a local DNS resolver,
Please read this wiki
https://www.mypdns.org/w/performance_test_of_hosts_file_vs_dns-recursors/

### RPZ
You'll find the RPZ formatted file in the [dns_zones/](dns_zones/) folder as
`pornhosts.mypdns.cloud.rpz`

The syntax used for is to provide a `NXDOMAIN` response

Ex.

```python
example.com		CNAME	.
*.example.com	CNAME	.
```

### Unbound
The Unbound formatted file is generated with the `always_nxdomain` syntax.

Ex.

```python
local-zone: "example.com" always_nxdomain
```

The file is found under the [dns_zones/](dns_zones/) as
`pornhosts.mypdns.cloud.zone`

### dnsmasq
The dnsmasq formatted file is located in the [dns_zones/](dns_zones/)
folder as `dnsmasq`

### hosts file Location
You can see the full matrix for hosts file locations here:
<https://www.mypdns.org/w/dnshosts/#location-in-the-file-system>


## Safe search enabled
Additionally, there is a new hosts file which will force Safe Search in the
safer and privacy enhanged [duckduckgo](https://safe.duckduckgo.com).

For unsafe search portals, we have added `Bing` and `Google`
"safe search ips".

However it has not been tested yet as both are blocked privately for
[SpyWare](https://www.mypdns.org/w/spyware/) issues with both domains in
question. It can be found [here](SafeSearch/hosts)

## Contributing
Any helpful [contributions](CONTRIBUTING.md) are appreciated
