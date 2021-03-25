# S-Plan

## Setup

Repository clonen
```
git clone https://github.com/Nils-witt/S-Plan
```

Anpassung der Konfiguration
1. SSL Zertifikate in `config/proxy/certs` kopieren
2. Anpassung der Proxykonfiguration in `configs/proxy/conf/conf.d`
```bash
server_name  api.splan.nils-witt.de;
```
zu
```bash
server_name  your-domain;
```
4. Die `docker-compose.yaml` ensprechdend anpassen
5. Starten mit `docker-compose up -d`
