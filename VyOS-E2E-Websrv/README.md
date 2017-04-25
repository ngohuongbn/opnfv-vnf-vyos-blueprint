# E2E service function chain for webserver

### Service Function Chain is composed by set of following VNFs: vRouter - vFirewall - vIDS - vLoadbalancer (vIDS and vLoadbalancer are placed in DMZ domain)
- vRouter: VyOS 1.1.7
- vFirewall: iptables + ntopng
- vIDS: Snort 
- vLoadbalancer: configured HAproxy instance for 2 apache2 webserver instances.
