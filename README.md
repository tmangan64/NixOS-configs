# NixOS Configuration

A declarative NixOS system configuration using Nix flakes and home-manager. This repository contains the complete system setup for the Elysia host.

## Overview

This project uses Nix flakes to manage dependencies and configure a NixOS system with reproducible builds. The configuration is split into system-level and user-level (home-manager) settings, allowing for modular and maintainable configuration.

## Project Structure

```
.
├── flake.nix                          # Flake configuration and inputs
├── hosts/                             # Per-host configurations
│   ├── canto/                         # Canto host (inactive)
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── home.nix
│   └── elysia/                        # Elysia host (active)
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── home.nix
└── modules/                           # Shared configuration modules
    ├── features/
    │   └── productivity.nix
    └── home-manager/
        └── terminal.nix
```

## Prerequisites

- NixOS with Nix flakes enabled
- Git for cloning the repository
- At least 1GB of free disk space for initial configuration

## Getting Started

### Initial Setup

1. Clone this repository to your system:
   ```bash
   git clone <repository-url> /etc/nixos
   ```

2. Adjust the hostname in `flake.nix` if needed. Currently configured for:
   - `elysia` (primary configuration)
   - `canto` (alternative configuration)

3. Review and update hardware-specific configurations:
   ```bash
   sudo nixos-generate-config --show-hardware-config > /tmp/hw.nix
   ```
   Compare and merge with `hosts/elysia/hardware-configuration.nix`.

### Building and Applying Configuration

To apply the configuration to your system:

```bash
sudo nixos-rebuild switch --flake .#elysia
```

For testing changes without switching:

```bash
sudo nixos-rebuild test --flake .#elysia
```

To build without applying:

```bash
sudo nixos-rebuild build --flake .#elysia
```

### Home Manager Setup

Home-manager is integrated into the system configuration and is automatically managed by NixOS. User-specific settings are defined in `hosts/elysia/home.nix` and referenced modules.

To apply home-manager changes:

```bash
home-manager switch --flake .#mizutani@elysia
```

## Configuration Details

### System Level (`hosts/elysia/configuration.nix`)

- Bootloader: systemd-boot with EFI
- Hostname: elysia
- Networking: NetworkManager
- Experimental features: nix-command, flakes enabled

### User Level (`hosts/elysia/home.nix`)

- User: mizutani
- Home directory: /home/mizutani
- Imported modules:
  - Terminal configuration
  - Productivity features
- Unfree packages allowed

### Modules

#### Terminal Module (`modules/home-manager/terminal.nix`)

Terminal and shell configuration for the user environment.

#### Productivity Module (`modules/features/productivity.nix`)

Productivity-focused tools and configurations.

## Dependencies

The flake defines the following inputs:

- **nixpkgs**: nixos-unstable - Latest unstable NixOS packages
- **home-manager**: nix-community/home-manager - User environment management
- **curd**: Wraient/curd - Custom tooling (follows nixpkgs)

## Modifications

To modify the configuration:

1. Edit the relevant `.nix` file in `hosts/` or `modules/`
2. Test changes with `nixos-rebuild test`
3. Apply with `nixos-rebuild switch` when satisfied
4. Commit changes to version control

For adding new packages or modules, follow the existing pattern in the respective configuration files.

## Troubleshooting

### Configuration fails to build
- Ensure your flake.nix is valid: `nix flake check`
- Check for syntax errors in modified files
- Run `nix flake update` to refresh inputs

### Home-manager conflicts
- Use `home-manager news` to check for breaking changes
- Remove conflicting files manually if needed
- Review the home-manager release notes for your NixOS version

### Applying changes doesn't work
- Run `sudo nixos-rebuild switch` with root privileges
- Check system logs: `journalctl -xe`
- Verify flake inputs with `nix flake show`

## Version Information

- NixOS Version: 24.05 (home-manager stateVersion)
- Nix Flakes: Experimental features required

## Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Flakes Documentation](https://nixos.wiki/wiki/Flakes)

## License

Specify your license here if applicable.
