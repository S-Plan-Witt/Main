# S-Plan

## Setup

### Requirements
- SSL Certificates and DNS records
- API requirements see https://github.com/Nils-witt/S-Plan_APi/blob/master/INSTALL.md

### Confguration
1. Place the SSL certs as cert.key and cert.crt in configs/proxy/certs. 
2. Adjust the configs in configs/proxy/conf/conf.d. e.g:
```bash
server_name  api.splan.nils-witt.de;
```
to
```bash
server_name  your-domain;
```

3. Place the API keyfiles under configs/api/keys
4. Adjust the docker-compose.yaml to your servers 
- ORIGIN must be the hostname of the PWA Container
- LDAP* see https://github.com/Nils-witt/S-Plan_APi/blob/master/INSTALL.md -> LDAP Setup
- MYSQL set a strong password for the server and put it in the api variables
