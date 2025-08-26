# ROS2 Aliases

A collection of useful aliases and shortcuts for ROS2 development workflows.

## Quick Install

```bash
git clone https://github.com/tedsamu/ros2-aliases.git
bash ros2-aliases/install.sh
source ~/.bashrc
```

## Available Aliases

| Alias | Description |
|-------|-------------|
| `ros2-source` | Source ROS2 environment and workspace |
| `ros2-build` | Build and source workspace with RelWithDebInfo |
| `ros2-build-release` | Build and source workspace with Release optimizations |
| `ros2-build-debug` | Build and source workspace with Debug symbols |
| `ros2-test` | Run all tests and show verbose results |
| `ros2-clean` | Clean build artifacts and reset environment |
| `ros2-ps` | Show running ROS/Ignition processes |
| `ros2-kill` | Kill all ROS/Ignition processes |
| `ros2-info` | Display current ROS2 configuration |
| `ros2-cd` | Navigate to workspace root |
| `ros2-help` | Show help message with all aliases and version info |

## Configuration

The aliases use these environment variables (with defaults):

- `ROS_WS`: Your workspace path (default: `$HOME/ros2_ws`)
- `ROS_DISTRO`: ROS2 distribution (default: `humble`)

You can override these by setting them in your `.bashrc` before sourcing the aliases:

```bash
export ROS_WS="/path/to/my/workspace"
export ROS_DISTRO="iron"
source "/path/to/ros2-aliases.sh"
```

## Docker Usage

### Default (Humble)

Instead of adding all those RUN commands to your Dockerfile:

```dockerfile
RUN git clone https://github.com/tedsamu/ros2-aliases.git /opt/ros2-aliases && \
    bash /opt/ros2-aliases/install.sh
```

### Other ROS2 Distributions (e.g., Jazzy)

To use with a different ROS2 distribution, set the environment variable before installation:

```dockerfile
# For ROS2 Jazzy
ENV ROS_DISTRO=jazzy
ENV ROS_WS=/home/devuser/ros2_ws

RUN git clone https://github.com/tedsamu/ros2-aliases.git /opt/ros2-aliases && \
    bash /opt/ros2-aliases/install.sh
```

Or set it in a single RUN command:

```dockerfile
RUN ROS_DISTRO=jazzy ROS_WS=/path/to/workspace \
    git clone https://github.com/tedsamu/ros2-aliases.git /opt/ros2-aliases && \
    bash /opt/ros2-aliases/install.sh
```

## Manual Installation

If you prefer not to use the install script:

1. Clone or download `ros2-aliases.sh`
2. Add this line to your `~/.bashrc`:
   ```bash
   source "/path/to/ros2-aliases.sh"
   ```
3. Reload your shell: `source ~/.bashrc`

## Uninstall

Remove the source line from your `~/.bashrc`:
```bash
sed -i '/ros2-aliases.sh/d' ~/.bashrc
```

## Contributing

Feel free to open issues or submit pull requests with additional useful aliases!