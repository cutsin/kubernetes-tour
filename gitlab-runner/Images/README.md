# Docker Image for Web Application

## Step 1. Build

```bash
docker-compose build --force-rm --pull YOUR_SERVICE_NAME
```

## Step 2. Push

```bash
docker-compose push
# or push single
docker-compose push YOUR_SERVICE_NAME
```
