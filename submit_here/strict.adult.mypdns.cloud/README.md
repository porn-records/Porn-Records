# Disclaimer
As written in this document you should be maintaining your own
[WhiteList][WhiteList] if you apply any of these lists.


# The strict anti adult files
These files will contain domains which primary is used to host non-adult
related contents and for that you might feel like experience a number of
[FalsePositive][FalsePositive]s while they are in the right blacklists.

You will find records like `*.blogspot.TLD` including subdomains like:

```css
1.bp.blogspot.com
2.bp.blogspot.com
3.bp.blogspot.com
```

[*.bp.blogspot.com][blogspot.com] for sure do deliver a high number of
pornographic material. It is probably the most used adult domain, if not
it is certainly among TOP 10. (Have only personal refence points here,
real numbers would be great)

## Why should this be in the strict list.
Because if we added the biggest porn serving domain, which also serves
SFW, to the ordinary adult section people start calling it
[FalsePositive][FalsePositive] as in issues like this:
~~[Bogus porn host: *.bp.blogspot.com][Bogus porn host]~~!


## Distinguish
These list *do not* distinguish between what is mainly the NSFW or SFW
purpose of any domain records listed within any resources found in this-
and any sub-folders.

If a significant amount of pornographic material have been located on any
of the records listed within this folder, they are added here


[blogspot.com]: https://mypdns.org/my-privacy-dns/porn-records/-/issues/1005 "blogspot.com the biggest porn distribution network"
[FalsePositive]: https://mypdns.org/mypdns/support/-/wikis/False-Positive "What is: False Positive"

[Bogus porn host]: https://github.com/StevenBlack/hosts/issues/1773 "The biggest porn host: Bogus repository with severe personal issues"

[WhiteList]: https://mypdns.org/mypdns/support/-/wikis/WhiteList
