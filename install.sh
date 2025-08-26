#!/bin/bash

# ROS2 Aliases Installation Script
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALIASES_FILE="$SCRIPT_DIR/ros2-aliases.sh"
BASHRC_FILE="$HOME/.bashrc"

echo -e "${YELLOW}Installing ROS2 aliases...${NC}"

# Check if aliases file exists
if [ ! -f "$ALIASES_FILE" ]; then
    echo -e "${RED}Error: ros2-aliases.sh not found in $SCRIPT_DIR${NC}"
    exit 1
fi

# Check if already installed
if grep -q "source.*ros2-aliases.sh" "$BASHRC_FILE" 2>/dev/null; then
    echo -e "${YELLOW}ROS2 aliases already installed in .bashrc${NC}"
    echo "To reinstall, remove the existing line from ~/.bashrc and run this script again."
    exit 0
fi

# Add source line to .bashrc
echo "" >> "$BASHRC_FILE"
echo "# ROS2 Aliases" >> "$BASHRC_FILE"
echo "source \"$ALIASES_FILE\"" >> "$BASHRC_FILE"

echo -e "${GREEN}✓ ROS2 aliases installed successfully!${NC}"
echo ""
echo "To use the aliases in your current session, run:"
echo -e "${YELLOW}  source ~/.bashrc${NC}"
echo ""
echo "Or start a new terminal session."
echo ""
echo "Available aliases:"
echo "  ros2-source       - Source ROS2 environment and workspace"
echo "  ros2-build        - Build workspace with RelWithDebInfo (symlink-install)"
echo "  ros2-build-release- Build workspace with Release optimizations"
echo "  ros2-build-debug  - Build workspace with Debug symbols (symlink-install)"
echo "  ros2-test         - Run all tests and show verbose results"
echo "  ros2-clean        - Clean build artifacts (install/build/log) and reset env"
echo "  ros2-ps           - Show running ROS/Ignition processes"
echo "  ros2-kill         - Kill all ROS/Ignition processes"
echo "  ros2-info         - Display current ROS2 configuration and workspace status"
echo "  ros2-cd           - Navigate to workspace root directory"
echo "  ros2-cdsrc        - Navigate to workspace src directory"
echo "  ros2-help         - Show help message with all aliases and version info"