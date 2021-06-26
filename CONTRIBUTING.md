# Contributing

If you feel like contributing there are a couple of ways to do this

1. You can add new super high speed bash code, optimizing existing or
   rewrite for broader support of bash environments across OS's

1. You can add domains to either the `submit_here/` folder of this repo.

1. Please add you contribution to either the vary beginning of the file
   or the bottom, the CI/CD will do the sorting.

## Workflow

### Add new hosts
The workflow is a bit clumsy, but the most reliable and fail-safe.
1. You add an issue with you question, feature request or contribution
   via [this form](https://mypdns.org/my-privacy-dns/porn-records/-/issues/new?issue[issue_type]=issue&issuable_template=Adult%20contents)
   (This is the history of _why_ to blacklist a record)

   ALL fields MOST be filled out, the questions are there for a
   good reason...

2. Add your new domain record(s) to suitable file(s) in the `submit_here/`
   folder.  
   A issue is required to be able to historically trace why you
   have committed the records.
    
3. You open a PR (Merge Request) where you'll add your contribution
   (This is the _when_ we did the blacklisting)

4. You add the new domain record entry in the top of the list, then
   it is easier to find.  
   The code will make it appear in alphanumeric order

5. Follow the [New commit](#new-commit) guide


### New code
If you like to add new code or modify existing code to make it run better,
faster, smarter etc. You will by editing and contributing to the code,
automatically be redirected to a fork of the main repo, from where you
add and/or modify the code.

### New commit
When you are done with your contribution, you will save the file in
a new branch. Don't forget to make a full reference to the issue in
your commit message as a full url to issue:

```md
https://mypdns.org/my-privacy-dns/porn-records/-/issues/<ID>
```

Replace the `$ID` with the issue id from <https://mypdns.org/my-privacy-dns/porn-records/-/issues>

![new commit](https://user-images.githubusercontent.com/44526987/68994730-a380f980-0886-11ea-84a6-7a921902de98.png)

Next you'll be taken to the `Open a pull request`

![Open a pull request](https://user-images.githubusercontent.com/44526987/68994731-a4199000-0886-11ea-8158-1cd2b0a4a271.png)

When everything is filled out curectly, you just hit the `Create pull request`
and you are done.


## GPG signed
We require all submissions to be signed with a valid GPG key.

Only exception to this rule is the CI/CD bot

### How to sign with GPG
If you know nothing about GPG keys I really suggest you search on
[duckduckgo](https://safe.duckduckgo.com) for the best way to do it, on
your current OS.

However if you do have a GPG key, add it to you submission profile add a
`-S` to the `git commit -S -m "Some very cool enhancements"` and that's
is. You can set this globally or pr git. Do a search on
[duckduckgo](https://duckduckgo.com) to figure out the current way.

### Encoding when writing files/lines
  - All files most end with a newline `\n`(LF) UTF-8.
  - All files have to be in universal UTF-8 style without BOM
  - Any files or file location containing `_windows_` in it's files must
    be encoded in `ISO-8859-1 Latin1` and newlines *most* end in (CRLF)
  - Line length should not be any longer than 80 chars for supporting
    terminals.

This version supersedes <https://mypdns.org/MypDNS/support/-/wikis/Contributing>

Revision date: 26. June 2021.

Last edited by: <https://mypdns.org/Spirillen/>

Approved by: <https://mypdns.org/Spirillen/>

Version: rPD 1.0
