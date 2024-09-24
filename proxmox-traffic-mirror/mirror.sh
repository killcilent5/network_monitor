
#!/bin/bash
IF=${1:-vmbr0}
CAP=${2:-tap100i0}
tc qdisc add dev $IF handle ffff: ingress || true
tc filter add dev $IF parent ffff: matchall action mirred egress mirror dev $CAP || true
