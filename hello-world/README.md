# Hello World Add-on

A simple demo add-on that runs the official Docker `hello-world` image to verify your Home Assistant add-on repository setup.

## About

This add-on uses the [official Docker hello-world image](https://hub.docker.com/_/hello-world), the smallest possible Docker image (~13 KB). When started, it runs the `/hello` binary, which prints a short confirmation message to the logs, then exits.

It is intended as a smoke-test to confirm that:
- The add-on repository is correctly configured in Home Assistant
- Home Assistant can pull images from Docker Hub
- The add-on infrastructure (supervisor, image pull, log output) is working

## Installation

1. Add the repository to your Home Assistant installation (if not already added)
2. Go to **Settings** → **Add-ons & Services** → **Add-on Store**
3. Find "Hello World"
4. Click **Install**
5. Click **Start**

## Usage

Because the `hello-world` binary prints its message and exits immediately, the add-on will start, produce output, and then stop. This is expected behaviour.

To see the output:

1. Go to **Settings** → **Add-ons & Services**
2. Click the **Hello World** add-on
3. Click the **Logs** tab

You should see output similar to:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

## Configuration

This add-on has no configurable options.

## Supported Architectures

- `amd64` (Intel/AMD 64-bit)
- `aarch64` (ARM 64-bit)

## Support

For issues with this add-on:
1. Check the add-on logs as described above
2. Consult the [Docker hello-world image page](https://hub.docker.com/_/hello-world)
3. Ask on [Home Assistant Community](https://community.home-assistant.io/)
