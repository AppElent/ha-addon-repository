# Custom Web Applications for Home Assistant

A Home Assistant add-on repository for hosting custom web applications. This repository contains configuration files for add-ons that reference Docker images hosted on GitHub Container Registry (GHCR) and other public registries.

## About

This repository serves as a configuration hub. The actual Docker images are built and hosted separately (typically on GHCR). This repository contains only the metadata and configuration files that Home Assistant needs to recognize and manage these add-ons.

## Installation

1. Open Home Assistant
2. Go to **Settings** → **Add-ons & Services** → **Add-on Store**
3. Click the menu icon (⋮) in the top-right corner
4. Select **Repositories**
5. Add this repository URL:
   ```
   https://github.com/appelent/ha-addon-repository
   ```
6. Click **Create**

The repository and its add-ons will now appear in your Add-on Store.

## Available Add-ons

- **Hello World** - A simple demo application to verify the repository setup

## Adding Your Own Add-ons

To add a new add-on to this repository:

1. Create a new directory with your add-on name (use lowercase and hyphens)
2. Copy the template files from `_templates/` directory
3. Configure `config.yaml` with:
   - Basic metadata (name, version, slug, description)
   - Docker image reference (from your registry)
   - Port mappings (if needed)
   - Configuration options and schema (if your app needs user input)
   - Volume mappings (if your app needs persistent storage)
4. Update `run.sh` with any startup commands
5. Add documentation in `README.md`
6. Optionally add an icon as `icon.png`

### Directory Structure for New Add-ons

```
my-awesome-app/
├── config.yaml          # Required: Add-on configuration
├── run.sh              # Required: Startup script
├── README.md           # Recommended: Documentation
├── icon.png            # Optional: Add-on icon (256x256)
└── rootfs/             # Optional: Files to include in container
```

## Configuration Reference

See `_templates/config.yaml.template` for a detailed example with all available options.

### Essential Fields

```yaml
name: My Awesome App
version: "1.0.0"
slug: my-awesome-app
description: A brief description of what the app does
url: https://github.com/yourorg/your-app
image: ghcr.io/yourorg/my-awesome-app:latest
```

### Common Options

- **image**: Docker image to run (required)
- **ports**: Port mappings, e.g., `8080/tcp` or `8080:8081/tcp`
- **environment**: Environment variables for the container
- **options**: Configuration options users can customize
- **schema**: Validation schema for options
- **map**: Volume mappings, e.g., `config:rw`, `share:rw`
- **boot**: Start mode - `auto` (default) or `manual`
- **startup**: Behavior - `application` (default), `service`, or `once`

## Using Images from Different Registries

### GitHub Container Registry (GHCR)
```yaml
image: ghcr.io/yourname/myapp:latest
```

### Docker Hub
```yaml
image: myname/myapp:latest
# or
image: docker.io/myname/myapp:latest
```

### Private Registries
Requires authentication - consult Home Assistant documentation for setup.

## Multi-Architecture Support

For architecture-specific builds, use the `{arch}` placeholder:

```yaml
image: ghcr.io/yourname/myapp-{arch}:latest
```

Available architectures:
- `amd64` - Intel/AMD 64-bit
- `aarch64` - ARM 64-bit
- `armv7` - ARM 32-bit
- `i386` - Intel/AMD 32-bit (legacy)

## Example: Simple Web Service

A minimal configuration for a web service:

```yaml
name: My Web App
version: "1.0.0"
slug: my-web-app
description: A simple web application
image: ghcr.io/yourorg/my-web-app:latest
ports:
  8080/tcp: null
startup: application
```

## Resources

- [Home Assistant Developer Documentation](https://developers.home-assistant.io/docs/apps/)
- [Add-on Configuration Reference](https://developers.home-assistant.io/docs/apps/configuration/)
- [Home Assistant Community](https://community.home-assistant.io/)

## License

Apache License 2.0 - See LICENSE file for details

## Support

For issues or questions about the repository structure, refer to the Home Assistant developer documentation. For issues with specific add-ons, consult their individual README files.
