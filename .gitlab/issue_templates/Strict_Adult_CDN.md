<!-- Find tips in the bottom -->

I believe this domain is an Adult(-related) domain --> that have to be blocked as..

- [X] Wildcarded
- [ ] Single domain blocking

```css
domain   CNAME . ; Adult
*.domain   CNAME . ; Adult
```

CDN See [Linked issues](#related-issues) for details

### Additional requirements for hosts and Pi-hole

```css
www.
```

## Relevant logs or comments
<!-- comments like a specific url to see contents -->

## Relevant External sources
<!-- If you found this domain on another issueboard -->

### All Submissions:
- [X] Have you followed the guidelines in our [Contributing](CONTRIBUTING.md) documentation?
- [X] Have you checked to ensure there aren't other open
      [Merge Requests (MR)](../merge_requests) or [Issues](../issues) for the
      same update/change?

### Todo
- [ ] Added to Source file?
- [ ] Added to the RPZ zone [adult.mypdns.cloud](https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud) (@spirillen)

/assign @spirillen 

/label ~"CDN::NSFW-Strict"

<!--
usage of www or not

Please check if you submission is using the the www or not and put that into
the section of

You can tell us you have checked this by adding either a {key +}, a {key -} or `none` in front of the `www`

+ www  The domain uses **both** the `www` and the _none_ `www` names.
- www  The domain uses **only** the _none_ `www` name.
www.domain  The domain uses **only** the `www.` name.
www.? Leaving the question mark tells us you haven't tested this

Tips & Tricks

If you are using ie. uBlock Origin, you can sort the log output with this
one-liner in bash.
See snippet: https://mypdns.org/-/snippets/30
-->
