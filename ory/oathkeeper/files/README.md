# Oathkeeper Configuration

## jwks.json

To generate this file, run:

```bash
oathkeeper credentials generate --alg RS256 > jwks.json
```

if Oathkeeper is natively installed on the OS and:

```bash
docker run oryd/oathkeeper:v0.38.9-beta.1 credentials generate --alg RS256 > jwks.json
```

if Oathkeeper is not locally installed on the OS.
