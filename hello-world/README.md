# Hello World Add-on

A simple demo add-on that runs the Echo Server application.

## About

This add-on demonstrates a basic web service configuration for Home Assistant. It runs the [Echo Server](https://github.com/ealen/echo-server), a lightweight HTTP server that echoes back request information.

## Installation

1. Add the repository to your Home Assistant installation
2. Install the "Hello World" add-on
3. Start the add-on
4. Access it at `http://your-ha-ip:8080`

## Configuration

### Log Level

Configure the logging verbosity:

```yaml
log_level: info
```

Available levels:
- `emerg` - Emergency
- `alert` - Alert
- `crit` - Critical
- `err` - Error
- `warning` - Warning
- `notice` - Notice
- `info` - Info (default)
- `debug` - Debug

## Usage

Once started, the Echo Server will be available at:
- **Local**: `http://localhost:8080`
- **Network**: `http://your-ha-ip:8080`

Send any HTTP request to see the server echo back the request details.

## Example

```bash
curl http://your-ha-ip:8080/hello
curl -X POST http://your-ha-ip:8080/api/test
```

## Support

For issues with this add-on, check:
1. Add-on logs in Home Assistant
2. Echo Server [GitHub repository](https://github.com/ealen/echo-server)
3. Home Assistant community forums
