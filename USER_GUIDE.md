# ZERODAY WARRIORS - ISP Security & Cyber Audit Suite

This guide is for **Security Engineers** and **ISP Administrators** using the ZeroDay Warriors toolkit for organizational auditing and subscriber protection.

## 1. Prerequisites
- **Python 3.x**: Ensure Python is installed.
- **Administrator Privileges**: Required for network-level tools (ARP Scanning, Sniffing).
- **Npcap**: Required for full Scapy functionality on Windows.
- **Libraries**: `scapy`, `requests`, `colorama`, `dnspython`, `phonenumbers`.

---

## 2. Installation & Setup
Run the setup script as an Administrator to install all professional-grade dependencies:
```cmd
setup.bat
```

### **Configuring Real-Time Email Notifications**
To receive actual MFA codes and audit alerts in your Gmail inbox:
1.  **Enable 2-Step Verification** on your Google Account.
2.  **Generate an App Password**:
    - Go to [Google Account Security](https://myaccount.google.com/security).
    - Search for "App Passwords".
    - Create a new app (e.g., "ISP Toolkit").
    - Copy the 16-character code.
3.  **Configure the Toolkit**:
    - Launch `toolkit.py`.
    - When prompted, choose `y` to configure SMTP.
    - Enter your Gmail and the 16-character App Password.
    - The credentials will be saved securely in `audit_logs/.config.json`.

---

## 3. Tool Overview (ISP & Security Context)

### **ISP SIM Security & Audit Portal (Extended)**
- **Purpose**: Professional-grade subscriber management, provisioning, and security auditing.
- **Strict Dependencies**:
    - **Administrator Privileges**: Required to access the ISP suite (verified via system check).
    - **Internet Connectivity**: Required for real-time HLR/VLR API pings and Cloud Sync.
    - **Verified SMTP**: Sensitive operations (SIM Swap) are blocked unless a Gmail App Password is configured.
- **Features**:
    - **Carrier & Region ID**: Identifies network provider and subscriber region.
    - **Tower-to-Tower Mapping**: Simulates live location tracking via nearby cell towers (BTS).
    - **Visual Mapping**: Generates interactive HTML maps showing tower locations (requires `folium`).
    - **SIM Provisioning & Swap**: Formal workflow for deactivating old SIMs and activating new ones via ICCID.
    - **HLR Audit**: Detailed reports on SIM status, porting history, and last activity logs.
    - **Compliance Logging**: Automatically logs every swap event and audit for regulatory reporting.

### **Master Admin & Next-Gen MFA Security**
- **System Locking**: The toolkit is protected by a **Master Admin Password** and a **Self-Generating MFA System**.
- **Cloud Database Sync**: All audit logs and swap entries are automatically synchronized to the cloud database at `uabduluba001@gmail.com`. This ensures a remote, immutable audit trail for organizational compliance.
- **In-App MFA**: Sensitive actions (like SIM Swaps) require a 6-digit **Session MFA Code**. This code is generated dynamically within the interface using a secure Time-based One-Time Password (TOTP) algorithm, mimicking the high-security systems used by major Nigerian ISPs.
- **Setup**: On first run, the system initializes your unique MFA secret and Master Admin credentials.

### **ISP Advanced Provisioning & SIM Rectification**
- **Subscriber Identity Lookup (CRM)**: Retrieves original owner details (Full Name, DOB, Address, ID Number) using either the Phone Number or the SIM ICCID for high-accuracy verification.
- **ICCID Guidance**: Detailed technical guidance on identifying the 19-20 digit ICCID from Nigerian SIM packs (MTN, Airtel, Glo).
- **SIM Rectification & HLR Sync**: Corrects subscriber data discrepancies and synchronizes the updated profile across HLR/VLR nodes.
- **Stealth Service Routing**: Enables the diversion of calls and SMS services from one subscriber to another using a "No Trace" routing path (VLR -> STP).
- **Real-Time Notifications**: Sends automated SMS alerts to the NEW subscriber number and email logs to the administrator upon successful SIM swap.
- **Real-Time Email Alerts**: Every sensitive event (SIM Swap, Routing, Rectification) triggers an immediate email alert to the master cloud database at `uabduluba001@gmail.com`.
- **Network Device Discovery**: Maps organizational infrastructure using ARP scanning.
- **Port Scanner & Service Discovery**: Audits open services for potential entry points.
- **Vulnerability Audit**: Compares service banners against known CVE signatures.

### **Network Defense & Simulation**
- **ARP Spoofing (MITM)**: Educational simulation of internal network vulnerabilities.
- **Packet Sniffer**: Audits internal traffic for unencrypted credentials (PII protection).

### **System Configuration & Knowledge Base**
- **System Configuration (Option 14)**: A dedicated portal for managing the toolkit's operational state.
    - **SMTP Management**: Update your Gmail App Password or alert recipient on the fly.
    - **Operational Modes**: Toggle between **Live Mode** (real API calls) and **Simulation Mode** for training.
    - **Node Refresh**: Force a synchronization with enterprise HLR nodes.
- **Educational Explanations (Option 13)**: A built-in technical reference for ISP and security concepts.
    - Covers HLR/VLR architecture, ICCID identification, ARP spoofing mechanics, and the importance of HTTP security headers.

---

## 4. Professional Best Practices
- **Ethical Use**: This suite is for authorized organizational audits only.
- **Subscriber Privacy**: Ensure all PII (Personally Identifiable Information) gathered via the SIM Audit portal is handled according to local data protection laws (e.g., NDPR in Nigeria).
- **Live Integration**: For ISPs, use the provided documentation in Option 10 to implement real-time HLR/VLR pings and biometric verification.

---

## 5. Troubleshooting
- **"Library not found"**: Re-run the `setup.bat` script.
- **"Permission Denied"**: Always run your terminal as an Administrator for network tools.
- **"Invalid Subscriber Number"**: Ensure numbers are entered in international format (e.g., +234...).
