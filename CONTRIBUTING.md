# Contributing to Custom Web Applications

## Adding a New Add-on

### Step 1: Create the Directory Structure

```bash
mkdir my-new-addon
cd my-new-addon
```

### Step 2: Copy Templates

Copy the template files from `_templates/`:
- `config.yaml.template` → `config.yaml`
- `run.sh.template` → `run.sh`
- `README.md.template` → `README.md`

### Step 3: Configure config.yaml

Edit `config.yaml` with your add-on details:

```yaml
name: My Awesome App
version: "1.0.0"
slug: my-awesome-app
description: Brief description
url: https://github.com/yourorg/myapp
image: ghcr.io/yourorg/my-awesome-app:latest

# Optional: Expose ports
ports:
  8080/tcp: null

# Optional: Volume mappings
map:
  config:rw
  share:rw

# Optional: Configuration options
options:
  log_level: info
  debug: false

schema:
  log_level: selector
    options:
      - info
      - debug
      - warning
  debug: bool
```

### Step 4: Update run.sh

Ensure `run.sh` is executable and contains the startup logic:

```bash
#!/usr/bin/env bashio

# Your startup commands here
exec my-app --config /config
```

### Step 5: Add Documentation

Update `README.md` with:
- Clear description of what the app does
- Setup instructions
- Configuration options
- Usage examples

### Step 6: Add an Icon (Optional)

Place a `icon.png` file in your add-on directory:
- Recommended size: 256x256 pixels
- Format: PNG with transparency
- Should represent your application clearly

### Step 7: Test

Before submitting:
1. Verify the directory structure is correct
2. Validate YAML syntax in `config.yaml`
3. Ensure `run.sh` is executable (`chmod +x run.sh`)
4. Test the add-on in your Home Assistant instance if possible

## Image Hosting

Ensure your Docker images are:
- Publicly accessible from your registry (GHCR, Docker Hub, etc.)
- Tagged with specific versions (not just `latest`)
- Available for amd64 architecture (at minimum)
- Multi-architecture if possible (amd64, aarch64, armv7)

## Guidelines

- **Slug**: Lowercase, alphanumeric, hyphens only. Must be unique.
- **Version**: Follow semantic versioning (major.minor.patch)
- **Description**: Keep it brief and clear
- **Image reference**: Use specific version tags, not `latest` in production

## Commit Message Format

Use clear, descriptive commit messages:

```
Add my-awesome-app add-on

- Configure GHCR image reference
- Add documentation and examples
- Include icon
```

## Pull Request Process

1. Create a feature branch for your add-on
2. Commit your changes with clear messages
3. Push to your fork
4. Create a pull request with a description of the add-on

## Questions?

Refer to:
- [Home Assistant Developer Docs](https://developers.home-assistant.io/docs/apps/)
- Official example add-ons in this repository
- Home Assistant community forums
