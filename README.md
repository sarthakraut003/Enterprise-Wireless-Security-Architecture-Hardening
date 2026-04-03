# Enterprise-Wireless-Security-Architecture-Hardening
A high-security wireless infrastructure designed to protect sensitive financial data from interception and unauthorized access. By moving beyond legacy WPA2-PSK systems, this architecture implements Zero Trust principles at the link layer, utilizing WPA3-Enterprise, RADIUS identity management, and proactive IDS/IPS monitoring. 

**A Comprehensive Defense-in-Depth Framework for Financial Services**

## 📌 Project Overview
This project demonstrates the design, implementation, and validation of a high-security wireless infrastructure tailored for a financial services environment. The architecture transitions legacy WPA2 networks to a **Zero Trust** model using modern encryption and identity management standards.

**Project Status:** Completed (March 2026)  
**Field:** Network Security / Infrastructure Auditing

---

## 🏗️ Security Architecture
The framework is built on a multi-layered defense strategy:

* **Authentication:** Transitioned to **WPA3-Enterprise (802.1X)** utilizing a **FreeRADIUS** backend with **EAP-TLS** (certificate-based) protocols.
* **Data Confidentiality:** Implemented an **OpenVPN** overlay using **AES-256-GCM** to secure traffic over untrusted wireless mediums.
* **Network Segmentation:** Established **VLAN-based isolation** and **iptables ACLs** to prevent lateral movement between Guest and Production segments.
* **Proactive Monitoring:** Deployed **Suricata IDS/IPS** for Wi-Fi threat detection and **btmon** for Bluetooth HCI protocol analysis.



---

## 🛠️ Tech Stack & Tools
| Category | Tools |
| :--- | :--- |
| **OS / Environment** | Kali Linux, VMware Workstation 17, Docker |
| **Network Services** | FreeRADIUS, Hostapd, OpenVPN, VLAN (802.1Q) |
| **Analysis / Monitoring** | Suricata, Wireshark, Aircrack-ng, btmon |
| **Governance** | GDPR, PCI-DSS, ISO/IEC 27001 |

---

## 🛡️ Key Features & Implementation
### 1. Wireless Hardening
Replaced vulnerable PSK-based authentication with a robust PKI-driven 802.1X environment, neutralizing the risk of shared-key interception and brute-force attacks.

### 2. Zero Trust Segmentation
Configured strict firewall rules to ensure that a compromise in the "Guest" segment cannot reach the "Core Finance" database, successfully validated through Metasploitable stress tests.

### 3. Real-time Threat Detection
Developed custom Suricata signatures to detect and automatically drop deauthentication attack packets and unauthorized Bluetooth reconnaissance scans.

---

## 🔍 Troubleshooting & Engineering Challenges
*Validated by real-world lab deployments:*

* **Hypervisor Carrier Sync:** Resolved persistent `NO-CARRIER` states on virtual interfaces by re-mapping hardware MAC addresses and resetting host-side NAT/DHCP services.
* **DHCP/NAT Conflict:** Overcame routing metric conflicts in dual-homed environments (`eth0`/`eth1`) by manually flushing the IP routing table and utilizing `nmcli` for managed-state recovery.
* **RADIUS Latency:** Diagnosed EAP-TLS handshake timeouts through debug logs (`freeradius -X`), identifying and fixing MTU fragmentation issues on the virtual bridge.

---

## 📋 Compliance Mapping
The technical controls in this project were mapped against:
* **PCI-DSS Requirement 4.1:** Strong encryption for data in transit.
* **GDPR Article 32:** Technical measures to ensure the security of processing.
* **ISO 27001:** Asset management and access control standards.

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
