# Simple vCPE
- Simple vCPE template with 2 __network functions__:
  - vRouter: using Vyatta VyOS
  - vDPI: nDPI + iptables config (for routing and access control)

- Notes:
  - The files with prefix `isolated-*` are used to create a topology in which network functions aren't under control of `cloudify manager` (do not create cloudify agent), so we can't get monitoring metrics of network functions.
  - The files with prefix `mgr-*` are used to create a topology in which network functions are under control of `cloudify manager`. That means we can monitor network functions, except vRouter VyOS in this case (I haven't found any solution to install cloudify agent on VyOS router yet).

- References:
  - https://hostingwikipedia.com/setup-ntop-ubuntu-14-04/
  - http://idroot.net/tutorials/how-to-install-ntopng-on-ubuntu-14-04/