# Talos Konfiguration Documentation

```bash
talosctl gen config athena-production https://...:6443 --with-examples=false --with-docs=true
talosctl validate --config controlplane.yaml --mode cloud
talosctl validate --config worker.yaml --mode cloud
```

## Custom Image Schematic - Metal

```yaml
# schematics.yaml
customization:
  systemExtensions:
    officialExtensions:
      - siderolabs/iscsi-tools
      - siderolabs/qemu-guest-agent
      - siderolabs/util-linux-tools
```

```bash
curl -X POST --data-binary @schematics.yaml https://factory.talos.dev/schematics
> {"id":"88d1f7a5c4f1d3aba7df787c448c1d3d008ed29cfb34af53fa0df4336a56040b"}
```

```bash
talosctl upgrade --talosconfig=./talosconfig --nodes ...  --image factory.talos.dev/installer/88d1f7a5c4f1d3aba7df787c448c1d3d008ed29cfb34af53fa0df4336a56040b:v1.8.4
```
