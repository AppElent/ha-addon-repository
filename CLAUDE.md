# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **configuration-only** Home Assistant add-on repository. It contains no build system or compiled code — it hosts metadata (`config.yaml` files) that point to pre-built Docker images on external registries (GHCR, Docker Hub, etc.). Home Assistant reads this repository to discover and install add-ons.

## Validation

There are no build, lint, or test commands. Validation is manual:

- Check YAML syntax: `python3 -c "import yaml; yaml.safe_load(open('addon-name/config.yaml'))"`
- Ensure `run.sh` is executable: `chmod +x addon-name/run.sh`

## Add-on Structure

Each add-on lives in its own directory and must contain:

| File | Required | Purpose |
|------|----------|---------|
| `config.yaml` | Yes | Metadata, image reference, ports, volumes, schema |
| `run.sh` | Yes | Startup script using bashio framework |
| `README.md` | Recommended | User-facing documentation |
| `icon.png` | Optional | 256×256 PNG with transparency |

Use `_templates/` as the starting point for new add-ons — they contain full examples with comments explaining every option.

## config.yaml Key Fields

```yaml
name: "My App"
version: "1.0.0"
slug: my-app                          # lowercase, hyphens only, must be unique
description: "Short description"
url: "https://github.com/..."
image: ghcr.io/owner/my-app:latest    # pre-built image; use {arch} for multi-arch
arch: [amd64, aarch64, armv7, i386]
```

For multi-architecture images, use the `{arch}` placeholder:
```yaml
image: ghcr.io/owner/my-app-{arch}:latest
```

Common optional fields: `ports`, `ports_description`, `map` (volume mounts), `options`/`schema` (user config), `environment`, `network`, `privileged`, `devices`.

## Volume Mapping

Home Assistant paths available via `map`:
- `config` — HA config directory (`/config`)
- `share` — Shared storage (`/share`)
- `backup` — Backup directory (read-only recommended)
- `ssl` — SSL certificates

## Architecture

The repository is discovered by Home Assistant via `repository.yaml`. Each subdirectory with a valid `config.yaml` becomes an installable add-on. The Supervisor pulls the referenced Docker image and manages the container lifecycle — this repo only defines what to run, not how to build it.

Add-ons use **bashio** in `run.sh` to read user-supplied options at startup:
```bash
MY_VAR="$(bashio::config 'my_option')"
```
