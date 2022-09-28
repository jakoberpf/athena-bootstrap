# athena-bootstrap

This project is the first stage of the athena kubernetes cluster.

- ***athena-bootstrap***
- athena-installer
- athena-configuration

## Improvements

Use SDN for cluster network with an OPNsense VM as router

### Reminders

OPNsense configuration

```bash
# LAN: 192.168.0.X/24 | StaticIP
# WAN: 10.10.10.1/24 | StaticIP
# Disable Firewall for WebUI access (https://think.unblog.ch/zugriff-auf-opnsense-web-gui-via-wan-nach-installation/)
pfctl -d
```
