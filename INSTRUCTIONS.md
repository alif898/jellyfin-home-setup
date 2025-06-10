# Instructions

This file will contain instructions to replicate the setup.

## Installation

This is the full list of applications, separated by category:

### Media server
![Jellyfin Badge](https://img.shields.io/badge/Jellyfin-00A4DC?logo=jellyfin&logoColor=fff&style=flat)

### Media downloader

![qbittorrent Badge](https://img.shields.io/badge/qbittorrent-2F67BA?logo=qbittorrent&logoColor=fff&style=flat)
![prowlarr](https://img.shields.io/static/v1?label=&message=prowlarr&color=%23E66000&style=flat)
![radarr Badge](https://img.shields.io/badge/radarr-FFCB3D?logo=radarr&logoColor=000&style=flat)
![sonarr Badge](https://img.shields.io/badge/sonarr-2596BE?logo=sonarr&logoColor=fff&style=flat)
![bazarr](https://img.shields.io/static/v1?label=&message=bazarr&color=%234051B5&style=flat)

### Media request interface
![Jellyseerr](https://img.shields.io/static/v1?label=&message=Jellyseerr&color=7A3AE8&style=flat)
![Docker Badge](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff&style=flat)
![Proton VPN Badge](https://img.shields.io/badge/Proton%20VPN-66DEB1?logo=protonvpn&logoColor=000&style=flat)

### Remote access

![Tailscale Badge](https://img.shields.io/badge/Tailscale-242424?logo=tailscale&logoColor=fff&style=flat)

***

Except for the media request interface group, all other applications are installed on Windows and ran on the server directly. These applications should be installed as a Windows service, where it will startup automatically upon Windows startup.

***

For the media request interface group, Jellyseerr is run on Docker and uses Proton VPN to ensure connections to the external APIs required by Jellyseerr. This is configured using the `docker-compose.yml` file, which will initialize Proton VPN via Gluetun and once a health check passes, Jellyseerr will be initialized.

A `.env` file containing the following keys are needed:
```
OPENVPN_USER=
OPENVPN_PASSWORD=
OUTBOUND_SUBNETS=
```
The `OPENVPN` details are obtained from Proton VPN, while `OUTBOUND_SUBNETS` refers to the IP address of the network in which the server resides. For example, `999.999.9.0/24`, which will cover 0 to 24 for that network.

To run Jellyseerr + Proton VPN:
```
docker-compose up -d
```

## Port directory

| Application | Port |
| --- | --- |
| Jellyfin | 8096 |
| Jellyseerr | 5055 |
| Radarr | 7878 |
| Sonarr | 8989 |
| Prowlarr | 9696 |
| Bazarr | 6767 |
| qBittorrent | 8080 |

From the end user perspective, only ports 8096 (Jellyfin) and 5055 (Jellyseerr) are relevant.

## Cost

All applications used in this setup are free.
A user account is needed for Tailscale and Proton VPN, both of which provide generous free tiers.