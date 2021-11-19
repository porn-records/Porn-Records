# Contributing

If you feel like contributing there are a couple of ways to do this

1. You can add new super high speed code, optimizing existing code
   or rewrite for broader support of bash environments across *nix
   OS's

1. You should **_not_** add domains to the `submit_here/` folder of
   this repo.

1. Please add you contribution to either the vary beginning of the file
   or the bottom, the CI/CD will do the sorting.

## Workflow

### Add new hosts
There is a couple scenarios for this (Preferred order):

## The fastest and best covering
This one is tooooo simple or therefore probably to good to be
true... right?

Nope it is actually true. How can you be contribute to 4 Blacklist with
one issue + several RPZ Zone?

Simple, just commit your issue to the porn-records
[here][issue]

IMPORTANT: Fill out any fields, or you will at first be requested to add
missing values, if you fails to do this, you commitment can in sevier
cases end up by being deleted.

### The nearly as fast commit approach
1. You open a [ISSUE][issue] (Preferred)

   ### Issue comment
   you should know a couple of things about the issue templates,
   as I know a lot of people hates them as I suspect they don't
   understand the long term and bigger idea behind them.

   Hopefully the following text might help on that.
   - It is 1 domain = 1 issue
   - The templates are designed so nobody should have to visit any of the
   domains to verify, it is a pornographic domain, hence why the small
   screenshots of the site are required.
   - Everything should, at best, be designed to help other in there goal
   for maintaining and blacklisting adult related material.
   - We shall always do our best to achieve this, so that no one have to
   visit a pornographic site to verifying it, once the team behind the
   project have done this.
   - They are designed to match another project (Long term), currently known
   as the matrix, yes because of a $2 domain while watching the matrix
   movie. https://mypdns.org/infrastructure/matrix-rocks/www.matrix.rocks/-/blob/master/README.md


2. @spirillen will handle these on a regular basis, which usual
   would be a couple of times a week.

## Screenshot
Why @spirillen is so picky about the screenshots is do to the time
available for him to to handle this. You should also have read this
[comment](#issue-comment)

### New code
If you feel like adding new code or modify existing code to make it run
better, faster, smarter etc. You will by editing and contributing to the
code, automatically be redirected to a fork of the main repo, from where
you add and/or modify the code.

### New commit
When you are done with your contribution, you will save the file in
a new branch. Don't forget to make a full reference to the issue in
your commit message as a full url to issue:

```md
https://mypdns.org/my-privacy-dns/porn-records/-/issues/<ID>
```

Replace the `<ID>` with the issue id from
<https://mypdns.org/my-privacy-dns/porn-records/-/issues>

![new commit](https://user-images.githubusercontent.com/44526987/134584727-5ce2cc04-6eac-485d-a934-1b730cb1fe44.png)

Next you'll be taken to the `Open a pull request`

![Open a pull request](https://user-images.githubusercontent.com/44526987/134584048-51c583f1-8fe8-4536-831d-8b821077fe57.png)

When everything is filled out curectly, you just hit the `Create pull request`
and you are done.


## GPG signed
We require all submissions to be signed with a valid GPG key.

Only exception to this rule is the CI/CD bot

### How to sign with GPG
If you know nothing about GPG keys I really suggest you search on
[duckduckgo][duckduckgo] for the best way to do it, on your
current OS.

However if you do have a GPG key, add it to you submission profile add a
`-S` to the `git commit -S -m "Some very cool enhancements"` and that's
is. You can set this globally or pr git. Do a search on
[duckduckgo][duckduckgo] to figure out the current way.

### Encoding when writing files/lines
  - All files most end with a newline `\n`(LF) UTF-8.
  - All files have to be in universal UTF-8 style without BOM
  - Any files or file location containing `_windows_` in it's files must
    be encoded in `ISO-8859-1 Latin1` and newlines *most* end in (CRLF)
  - Line length should not be any longer than 80 chars for supporting
    terminals.


<!-- Document links -->

[duckduckgo]: https://safe.duckduckgo.com
[issue]: https://mypdns.org/my-privacy-dns/porn-records/-/issues/new

This version supersedes <https://mypdns.org/MypDNS/support/-/wikis/Contributing>

Revision date: 26. June 2021.

Last edited by: <https://mypdns.org/Spirillen/>

Approved by: <https://mypdns.org/Spirillen/>

Version: rPD 1.1
