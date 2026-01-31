# NixOS Configuration

A declarative NixOS system configuration using Nix flakes and home-manager. This repository contains the complete non- home-manager configuration for the 'canto' Thinkpad and the 'elysia' desktop.

## Project Structure

```
.
├── flake.nix                          # Flake configuration and inputs
├── hosts/                             # Per-host configurations
│   ├── canto/                         # Canto host (thinkpad)
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── home.nix
│   └── elysia/                        # Elysia host (desktop)
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── home.nix
└── modules/                           # Shared configuration modules
    ├── features/
    │   └── productivity.nix
    └── home-manager/
        └── terminal.nix
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
