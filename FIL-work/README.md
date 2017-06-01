# Testing scenarios
### Scenarios (do not use floating ip): 
- router + dpi 
- router + dpi + loadbalancer
- router + dpi + ids + loadbalancer

### VNFs requirements:
- `router`: VyOS (1CPU, 512MB RAM, 2GB hard disk)
- `dpi`: nDPI (1CPU, 1GB RAM, 5GB hard disk)
- `loadbalancer`: haproxy (1CPU, 1GB RAM, 5GB hard disk)
- `ids`: snort (centos - 1CPU, 1.5GB RAM, 5 GB hard disk)

### Test case:
- 1 chain type
- multi chain types
- current system load (cpu, ram, disk capacity) -> time for successful deployments (just 1 incomming request, multiple incomming requests)
- calculate by using cloudify (duration between 2 start and successful deployment events)
- impaction of flavor and real resources usages.

### Strategies:
- Monitoring physical servers 
- Measure resources (cpu, ram, disk) usage of each VNF (collectd + influxdb + grafana)
- Interval time to get metrics (1s, 2s, 5s,...)
