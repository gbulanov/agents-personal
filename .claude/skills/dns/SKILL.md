---
name: dns
description: DNS operations — query records, debug resolution, audit Route53, check TTLs, diagnose propagation
disable-model-invocation: false
user-invocable: true
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "<action: query|debug|audit|records> <domain or hosted-zone>"
---

# DNS Operations

Action: $ARGUMENTS

## Actions

### `query` <domain>
Comprehensive DNS lookup:
```bash
dig <domain> A +short
dig <domain> AAAA +short
dig <domain> CNAME +short
dig <domain> MX +short
dig <domain> TXT +short
dig <domain> NS +short
dig <domain> SOA +short
```
Show all records, TTLs, and nameservers.

### `debug` <domain>
Debug DNS resolution issues:
1. Query from multiple resolvers (8.8.8.8, 1.1.1.1, system resolver)
2. Trace resolution path: `dig +trace <domain>`
3. Check for NXDOMAIN, SERVFAIL, truncation
4. Verify nameserver delegation
5. Check DNSSEC validation if enabled
6. For K8s: check CoreDNS pods, /etc/resolv.conf, search domains

### `audit` [hosted-zone-id]
Audit Route53 configuration:
```bash
aws route53 list-hosted-zones
aws route53 list-resource-record-sets --hosted-zone-id <id>
```
1. Identify stale records (pointing to deleted resources)
2. Check TTL values (too low = high query cost, too high = slow failover)
3. Verify health checks on failover records
4. Check alias vs CNAME usage (alias for AWS resources)
5. Identify records without health checks on weighted/failover routing

### `records` <hosted-zone-id>
List and analyze all records:
1. Categorize by type (A, CNAME, ALIAS, TXT, MX)
2. Show routing policies (simple, weighted, failover, latency, geo)
3. Identify potential conflicts
4. Check for wildcard records
