-- Load DNSSEC root keys from dns-root-data package.
-- Note: If you provide your own Lua configuration file, consider
-- running rootkeys.lua too.
dofile("/usr/share/pdns-recursor/lua-config/rootkeys.lua")

rpzMaster(
	{"195.201.225.97:5306", "95.216.166.138:5306"},
	"pirated.mypdns.cloud",
	{refresh="120"}
)
