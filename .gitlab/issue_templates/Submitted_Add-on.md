**Submitted by @dante** via [My privacy DNS][mypdns] [Add-on][AddOn]

- [X] Wildcarded
- [ ] Subdomain

## DNS RPZ records

<!-- IF not wildcard, then we should put a marker fro that, there is
easily spotted, as you are getting blind after handling 100's issues
in a row. -->

```css
domain
```

### Subdomains
To support [RFC:952][RFC952] ([hosts files][hf]) and Pi-hole

```css
null?
```

<!-- Using the "usual" matrix to break down the usage of www or not -->

```css
+ www
- www
www.?
```

## Screenshots
<!-- Default encapsulated to minimize the issue scroll length -->
<details><summary>Screenshot</summary>



</details>

## Relevant comments

## Relevant External sources
<!-- do the information origin from 3rd party? -->
- `` <!-- These should only be default in the "human" template -->

### All Submissions:
- [X] Have you followed the guidelines in our [Contributing](CONTRIBUTING.md) documentation?
- [X] Have you checked to ensure there aren't other open
      [Merge Requests (MR)](../merge_requests) or [Issues](../issues) for the
      same update/change?
- [X] Added screenshot for proof of False Negative

### Todo
- [X] Added to Source file?
- [X] Added to the [DNS RPZ Firewall zone][RPZList] (@spirillen)

## External page sources
The following section is for cross resource searching

<details><summary>3rd party Domains</summary>

```python
N/A
```

</details>

/assign @spirillen 

/label ~"NSFW::Porn"

[AddOn]: https://mypdns.org/infrastructure/mypdns-report
[hf]: https://mypdns.org/mypdns/support/-/wikis/dns/DnsHosts "Hosts files"
[mypdns]: https://mypdns.org/ "My Privacy DNS, DNS Privacy Firewall with RPZ"
[RFC952]: http://tools.ietf.org/html/rfc952 
[RPZList]: (https://mypdns.org/mypdns/support/-/wikis/RPZ-List)
