# network_monitor

The **network_monitor** project is for **capturing, mirroring, and analyzing network traffic** in your lab.

It has three main parts:

1. **proxmox-traffic-mirror** – config to mirror traffic from a Proxmox bridge (e.g. `vmbr0`) into a capture interface/VM.
2. **network-capture-vm** – scripts to install capture tools (tcpdump, tshark, Zeek) and rotate PCAPs.
3. **ai-network-summary** – a placeholder module to feed captured data into an AI summarizer (local LLM) later.

Goal:  
See what’s going in/out of your Proxmox environment, store PCAPs, and later let an AI agent summarize suspicious activity or patterns.

---

## 1. High-Level Flow

```text
Proxmox host (vmbr0)
   ↓ (traffic mirroring via tc)
Capture interface (e.g. tap100i0 → capture VM)
   ↓
network-capture-vm (tcpdump / Zeek → PCAP files in /data/captures)
   ↓
ai-network-summary (reads logs/PCAP-derived JSON → sends to LLM for summary)
