# Log Notes


This file documents all observations, commands, log paths, and detection ideas as part of the LogShield SIEM project.

---

## 📁 1. Important Linux Log Files

| Log File              | Description                                                    |
|-----------------------|----------------------------------------------------------------|
| /var/log/auth.log     | Authentication logs: SSH, sudo attempts, login success/failure |
| /var/log/syslog       | General system log: cron jobs, services, kernel messages       |
| /var/log/kern.log     | Kernel-level messages                                           |
| /var/log/dpkg.log     | Package management logs (apt installs/removals)                |
| /var/log/bootstrap.log| Boot service logs                                               |
| /var/log/alternatives.log | Updates to system alternatives (e.g., default editors)     |

---

## 🔍 2. Sample Log Observations

### ✅ From `auth.log`:
- User `suzain` used `sudo` to run the `ls` command as root.
- Appears in `/var/log/auth.log`.

---

### 🧪 From Simulated Log (`ssh_fake.log`):

- Created using our custom fake log generator script.
- Helps us simulate brute-force or intrusion attempts in future stages.

---

## 🛡️ 3. Detection Use Cases

| Detection Idea                              | Log File              |
|---------------------------------------------|------------------------|
| Repeated failed login attempts (SSH brute)   | /var/log/auth.log     |
| Unauthorized sudo use                        | /var/log/auth.log     |
| Installation of tools like `nmap`, `netcat`  | /var/log/dpkg.log     |
| Suspicious cron job execution                | /var/log/syslog       |
| Kernel panic or exploit attempt              | /var/log/kern.log     |

---

## 🧠 4. Useful Commands for Log Investigation

```bash
# View latest auth events
tail -f /var/log/auth.log

# Check failed SSH attempts
grep "Failed" /var/log/auth.log

# View login history
last

# View kernel logs
tail /var/log/kern.log

# Search for 'nmap' installs
grep "nmap" /var/log/dpkg.log

# System-wide critical logs
journalctl -xe


- Created using our custom fake log generator script.
- Helps us simulate brute-force or intrusion attempts in future stages.

---

## 🛡️ 3. Detection Use Cases

| Detection Idea                              | Log File              |
|---------------------------------------------|------------------------|
| Repeated failed login attempts (SSH brute)   | /var/log/auth.log     |
| Unauthorized sudo use                        | /var/log/auth.log     |
| Installation of tools like `nmap`, `netcat`  | /var/log/dpkg.log     |
| Suspicious cron job execution                | /var/log/syslog       |
| Kernel panic or exploit attempt              | /var/log/kern.log     |

---

## 🧠 4. Useful Commands for Log Investigation

```bash
# View latest auth events
tail -f /var/log/auth.log

# Check failed SSH attempts
grep "Failed" /var/log/auth.log

# View login history
last

# View kernel logs
tail /var/log/kern.log

# Search for 'nmap' installs
grep "nmap" /var/log/dpkg.log

# System-wide critical logs
journalctl -xe

```

# Change file permissions
chmod 644 logs/ssh_fake.log  # Read/write for user, read-only for others
chmod 600 logs/ssh_fake.log  # More secure, only owner can read/write

# Check permissions
ls -l logs/ssh_fake.log

