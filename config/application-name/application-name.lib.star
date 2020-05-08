load("@ytt:struct", "struct")

app = struct.encode({
  "labels": {
    "app.kubernetes.io/name": "application-name"
  },
  "service": {
    "name": "application-service-name",
    "port": 8000
  }
})