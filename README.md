# Jellyfin Home Setup

To replicate the setup: [Instructions](INSTRUCTIONS.md)

## Table of Contents

- [Overview](#overview)
- [List of Applications/Technologies](#list-of-applicationstechnologies)
- [User Experience](#user-experience)
- [Future Plans](#future-plans)

## Overview
This project is a comprehensive, self-hosted content management and media streaming platform,
with automated media download workflows, seamless remote access and robust monitoring.
[Jellyfin](https://jellyfin.org/) is a versatile and open-source media server technology and is the main application around which this project is based on.

## List of applications/technologies

### Media server
![Jellyfin Badge](https://img.shields.io/badge/Jellyfin-00A4DC?logo=jellyfin&logoColor=fff&style=flat)

Jellyfin is the main application in the setup and other applications in the system are able to integrate with Jellyfin. 
Jellyfin is an open-source media server technology, allowing for streaming of movies, TV series and other content. 
It comes with web/mobile clients for users to view content, as well as an admin dashboard.

### Media downloader

![qbittorrent Badge](https://img.shields.io/badge/qbittorrent-2F67BA?logo=qbittorrent&logoColor=fff&style=flat)
![prowlarr](https://img.shields.io/badge/prowlarr-DC640D?style=flat)
![radarr Badge](https://img.shields.io/badge/radarr-FFCB3D?logo=radarr&logoColor=000&style=flat)
![sonarr Badge](https://img.shields.io/badge/sonarr-2596BE?logo=sonarr&logoColor=fff&style=flat)
![bazarr](https://img.shields.io/badge/bazarr-4958B2?style=flat)

This setup utilizes a suite of applications for automated media downloading and organization. 
qBittorrent is the torrent client used to download content. sonarr and radarr will automate download requests to qBittorrent, 
for TV shows and movies respectively, by searching for content on the indexers provided by prowlarr. 
bazarr is responsible for managing subtitles for all downloaded content.

### Media request interface

![Jellyseerr](https://img.shields.io/badge/Jellyseerr-7A3AE8?style=flat)
![Docker Badge](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff&style=flat)
![Proton VPN Badge](https://img.shields.io/badge/Proton%20VPN-66DEB1?logo=protonvpn&logoColor=000&style=flat)
![Gluetun](https://img.shields.io/badge/Gluetun-2CA02C?style=flat)

Jellyseerr provides a user-friendly interface for media requests, 
tightly integrated with Jellyfin to streamline content management. 
Users can request for specific movies/shows to be added to the library, once approved, 
the request will be passed along to sonarr/radarr for automatic download. 
It is deployed using Docker and routes its traffic through ProtonVPN (via [Gluetun](https://github.com/qdm12/gluetun)) to bypass [ISP restrictions](https://www.reddit.com/r/Overseerr/comments/1kra2v2/guide_solved_how_to_fix_500_internal_server_error/), 
ensuring consistent access to essential APIs like TMDB. 
Users can use the same credentials for both Jellyfin and Jellyseerr.

### Remote access

![Tailscale Badge](https://img.shields.io/badge/Tailscale-242424?logo=tailscale&logoColor=fff&style=flat)

Tailscale provides secure remote access to the entire setup. It allows users to connect to the network from anywhere. 
Devices connected to the Tailscale network are basically considered to be part of the 'home' network of the server, 
hence allowing access.

### Observability/Monitoring

![scraparr](https://img.shields.io/badge/scraparr-22BDED?style=flat)
![Prometheus Badge](https://img.shields.io/badge/Prometheus-E6522C?logo=prometheus&logoColor=fff&style=flat)
![Grafana Badge](https://img.shields.io/badge/Grafana-F46800?logo=grafana&logoColor=fff&style=flat)

The setup includes robust observability and monitoring, allowing for visibility on system status and quick identification of issues.
[scraparr](https://github.com/thecfu/scraparr) is a project which scans the *arr suite applications for metrics and exposes them.
Prometheus collects and stores metrics from scraparr and Tailscale,
while Grafana visualizes the metrics collected by Prometheus,
displaying key information through dashboards.

### Hardware

At the moment, the entire setup is run on an old Dell Inspiron laptop, with 8GB of RAM, using a 2TB Seagate external drive.

## User experience
From the end user perspective, there are only three interfaces, which are Tailscale, to connect to the network, Jellyfin, to play content, and Jellyseerr, to request content.

Once a content request on Jellyseerr is approved, it will be downloaded automatically, inclusive of subtitles, and once done, Jellyfin will automatically be updated.

## Future plans
Future enhancements, as well as any user feedback or issues, are tracked on [GitHub Issues](https://github.com/alif898/jellyfin-home-setup/issues).
