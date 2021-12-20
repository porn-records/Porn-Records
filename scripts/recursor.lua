-- Load DNSSEC root keys from dns-root-data package.
-- Note: If you provide your own Lua configuration file, consider
-- running rootkeys.lua too.

-- Copyright: https://mypdns.org/my-privacy-dns/matrix/blob/master/COPYRIGHT.md
-- Source: https://mypdns.org/my-privacy-dns/matrix/tree/master/safesearch
-- License: AGPL-3.0 (modified)
-- You should have received a copy of the license along with this
-- work. If not, see
-- https://mypdns.org/my-privacy-dns/matrix/blob/master/LICENSE

dofile("/usr/share/pdns-recursor/lua-config/rootkeys.lua")

rpzMaster(
	{"195.201.225.97:5306", "95.216.166.138:5306"},
	"pirated.mypdns.cloud",
	{refresh="120"}
)
