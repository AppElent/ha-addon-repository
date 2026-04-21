# Hello World Add-on

A simple demo add-on that runs the [crccheck/hello-world](https://hub.docker.com/r/crccheck/hello-world) image to verify your Home Assistant add-on repository setup.

## About

This add-on uses the [crccheck/hello-world](https://hub.docker.com/r/crccheck/hello-world) image, a minimal HTTP server that responds with "Hello World!" to any request. When started, it listens on port 8000 and stays running as long as the add-on is active.

It is intended as a smoke-test to confirm that:
- The add-on repository is correctly configured in Home Assistant
- Home Assistant can build and run add-on images
- The add-on infrastructure (supervisor, image build, log output) is working

## Installation

1. Add the repository to your Home Assistant installation (if not already added)
2. Go to **Settings** → **Add-ons & Services** → **Add-on Store**
3. Find "Hello World"
4. Click **Install**
5. Click **Start**

## Usage

The add-on starts an HTTP server that responds with "Hello World!" to any request. It will keep running until you stop it.

To see the output:

1. Go to **Settings** → **Add-ons & Services**
2. Click the **Hello World** add-on
3. Click the **Logs** tab

You should see output similar to:

```
Serving on http://0.0.0.0:8000
```

## Configuration

This add-on has no configurable options.

## Supported Architectures

- `amd64` (Intel/AMD 64-bit)
- `aarch64` (ARM 64-bit)

## Support

For issues with this add-on:
1. Check the add-on logs as described above
2. Consult the [crccheck/hello-world image page](https://hub.docker.com/r/crccheck/hello-world)
3. Ask on [Home Assistant Community](https://community.home-assistant.io/)
