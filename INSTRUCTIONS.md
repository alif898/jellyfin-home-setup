# Instructions

This file will contain instructions to replicate the setup.

## Installation

At the moment, applications in the setup are either run directly on Windows or through Docker.

### Direct Windows install

![Jellyfin Badge](https://img.shields.io/badge/Jellyfin-00A4DC?logo=jellyfin&logoColor=fff&style=flat)

![qbittorrent Badge](https://img.shields.io/badge/qbittorrent-2F67BA?logo=qbittorrent&logoColor=fff&style=flat)
![prowlarr](https://img.shields.io/badge/prowlarr-DC640D?style=flat)
![radarr Badge](https://img.shields.io/badge/radarr-FFCB3D?logo=radarr&logoColor=000&style=flat)
![sonarr Badge](https://img.shields.io/badge/sonarr-2596BE?logo=sonarr&logoColor=fff&style=flat)
![bazarr](https://img.shields.io/badge/bazarr-4958B2?style=flat)

![Tailscale Badge](https://img.shields.io/badge/Tailscale-242424?logo=tailscale&logoColor=fff&style=flat)

These applications should be installed as a Windows service, where they will launch automatically on Windows start up.

### Docker

![Jellyseerr](https://img.shields.io/badge/Jellyseerr-7A3AE8?style=flat)
![Proton VPN Badge](https://img.shields.io/badge/Proton%20VPN-66DEB1?logo=protonvpn&logoColor=000&style=flat)
![Gluetun](https://img.shields.io/badge/Gluetun-2CA02C?style=flat)

![scraparr](https://img.shields.io/badge/scraparr-22BDED?style=flat)
![Prometheus Badge](https://img.shields.io/badge/Prometheus-E6522C?logo=prometheus&logoColor=fff&style=flat)
![Grafana Badge](https://img.shields.io/badge/Grafana-F46800?logo=grafana&logoColor=fff&style=flat)

These applications are run on Docker, configured using the `docker-compose.yml`.

A `.env` file is needed, the necessary keys are found in the example `sample.env`.
`TZ` refers to timezone, e.g. `Asia/Tashkent`.
The `OPENVPN` details are obtained from Proton VPN, while `OUTBOUND_SUBNETS` refers to the IP address of the network in which the server resides. 
For example, `999.999.9.0/24`, which will cover 0 to 24 for that network.

Jellyseerr uses Proton VPN to ensure connections to the external APIs required by Jellyseerr.
Proton VPN is run via Gluetun and once a health check passes, Jellyseerr will be initialized.
scraparr utilises the `.env` file to search for the *arr stack applications.
Prometheus is configured using `/prometheus/prometheus.yml`.
Connecting to Prometheus from Grafana is done directly on its UI after successful launch.

To run the Docker setup:
```
docker-compose up -d
```

## Port directory

| Application | Port |
|-------------|------|
| Jellyfin    | 8096 |
| Jellyseerr  | 5055 |
| radarr      | 7878 |
| sonarr      | 8989 |
| prowlarr    | 9696 |
| bazarr      | 6767 |
| qBittorrent | 8080 |
| scraparr    | 7100 |
| Prometheus  | 9090 |
| Grafana     | 3000 |

From the end user perspective, only ports 8096 (Jellyfin) and 5055 (Jellyseerr) are relevant.

## Cost

All applications used in this setup are free.
A user account is needed for Tailscale and Proton VPN, both of which provide generous free tiers.