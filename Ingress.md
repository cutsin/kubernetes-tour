#

## Reverse proxy (Ingress cannot cross namespace yet)

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/server-snippet: |
      location ~ "^/api/(user|xxx)" {
        proxy_pass http://backendName.namespace:8080;
        proxy_set_header Host domain.name;
      }
```

Ref: [https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#server-snippet]
