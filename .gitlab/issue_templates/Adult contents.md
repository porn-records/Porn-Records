<!-- Find tips in the bottom -->

I believe this domain is an Adult(-related) domain --> that have to be blocked as..

- [X] Wildcarded
- [ ] Single domain blocking

```python
domain   CNAME . ; Adult
*.domain   CNAME . ; Adult
```

### Additional requirements for dumb hosts-files

```python

www.?
```

## Screenshots

<details><summary>Screenshot</summary>



</details>

### All Submissions:
- [ ] Have you followed the guidelines in our [Contributing](CONTRIBUTING.md) documentation?
- [ ] Have you checked to ensure there aren't other open
      [Merge Requests (MR)](../merge_requests) or [Issues](../issues) for the
      same update/change?
- [ ] Added screenshot for prove of False Negative

### Todo
- [ ] Added to Source file?
- [ ] Added to the RPZ zone [adult.mypdns.cloud](https://archive.mypdns.org/w/rpzlist/#adult) (@spirillen)

#### Logger output

<details><summary>Domains **ONLY**</summary>

```python

```

</details>


/assign @spirillen 

/label ~"NSFW::Porn"


<!--
usage of www or not

Please check if you submission is using the the www or not and put that into
the section of

You can tell us you have checked this by adding either a {key +}, a {key -} or `non` in front of the `www`

+ www.domain  The domain uses **both** the `www` and the //non// `www` names.
- www.domain  The domain uses **only** the //non// `www` name.
www.domain  The domain uses **only** the `www.` name.
www.? Leaving the question mark tells us you haven't tested this

Tips & Tricks

If you are using ie. uBlock Origin, you can sort the log output with this
one-liner in bash.
See snippet: https://mypdns.org/-/snippets/2
-->
