I believe this domain is an Adult(-related) domain --> that have to be blocked as..

- [X] Wildcarded
- [ ] Single domain blocking

```python
domain   CNAME . ; Adult
*.domain   CNAME . ; Adult
```

### Additional requirements for hosts and Pi-hole

```python
NULL

+ www
- www
www.
```

## Screenshots

<details><summary>Screenshot</summary>



</details>

## Relevant comments


## Relevant External sources
- `https://github.com/tiuxo/hosts/pull/49` Thanks to @defa02005

### All Submissions:
- [X] Have you followed the guidelines in our [Contributing](CONTRIBUTING.md) documentation?
- [X] Have you checked to ensure there aren't other open
      [Merge Requests (MR)](../merge_requests) or [Issues](../issues) for the
      same update/change?
- [X] Added screenshot for proof of False Negative

### Todo
- [X] Added to Source file?
- [X] Added to the RPZ zone [adult.mypdns.cloud][adultmypdnscloud] (@spirillen)

#### Logger output

<details><summary>Domains ONLY</summary>

```python

```

</details>

/label ~"NSFW::Porn"

[adultmypdnscloud]: (https://mypdns.org/mypdns/support/-/wikis/RPZ-List#adultmypdnscloud)
