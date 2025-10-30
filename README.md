# Fedora Workstation Development Environment Setup

Ansible playbooks to configure a Fedora Workstation with a complete DevOps toolset and customized shell environment.

## Overview

This setup consists of two main components:

1. **Host Setup** (`host-setup.yml`) - System-level packages and applications
2. **System Tools** (`system.yml`) - User-level DevOps tools and shell configuration

## What Gets Installed

### Host Setup (System-Level)
- **Shell**: zsh, vim
- **Editor**: Visual Studio Code (from Microsoft repository)
- **Browser**: Chromium (via Flatpak)
- **Base utilities**: curl, git, wget

### DevOps Tools (User-Level)
- **Kubernetes**: kubectl v1.31.1, kubectx/kubens v0.9.5, k9s v0.32.5, stern v1.30.0
- **Cloud**: AWS CLI v2
- **Utilities**: jira-cli v1.5.1, yq v4.44.3, sops v3.9.0
- **Containers**: podman, buildah, skopeo
- **Search**: fzf, ripgrep, jq
- **Shell**: Oh-My-Zsh with Powerlevel10k theme, zsh-autosuggestions, zsh-syntax-highlighting

All DevOps tools are installed to `~/.local/bin`.

## Usage

### Run Complete Setup

Run both playbooks in sequence:

```bash
ansible-playbook -i localhost, -c local setup.yml
```

### Run Individual Components

Run only host setup (requires sudo):
```bash
ansible-playbook -i localhost, -c local setup.yml --tags host
```

Run only user tools:
```bash
ansible-playbook -i localhost, -c local setup.yml --tags user
```

Run only package installation:
```bash
ansible-playbook -i localhost, -c local setup.yml --tags packages
```

Run only DevOps tools:
```bash
ansible-playbook -i localhost, -c local setup.yml --tags tools
```

### Run Individual Playbooks Directly

```bash
# Host setup only
ansible-playbook -i localhost, -c local host-setup.yml

# DevOps tools only
ansible-playbook -i localhost, -c local system.yml
```

## Post-Installation

After running the playbooks:

1. **Configure Powerlevel10k prompt**:
   ```bash
   p10k configure
   ```

2. **Start using zsh**:
   ```bash
   zsh
   ```
   
   Or log out and log back in for zsh to be your default shell.

3. **Verify installations**:
   ```bash
   kubectl version --client
   k9s version
   aws --version
   ```

## Shell Features

The setup configures zsh with:

- **Theme**: Powerlevel10k for a beautiful, informative prompt
- **Plugins**: git, kubectl, zsh-autosuggestions, zsh-syntax-highlighting, fzf, podman
- **Kubectl aliases**: k, kctx, kns, k9, kgp, kgs, kgd, kaf, kdel, klog, kexec
- **Podman aliases**: docker→podman, pd, pdi, pds, pdsa, pdb, pdr, pde
- **Git aliases**: gs, ga, gc, gp, gl, gco, gb, gd, glog
- **FZF integration**: Fuzzy file finding with ripgrep

## Available Tags

- `host` - Host-level system setup
- `system` - System packages installation
- `packages` - Package installations
- `user` - User-level tools and configuration
- `tools` - DevOps tools installation
- `devops` - DevOps tools installation

## Requirements

- Fedora Workstation (tested on Fedora 40+)
- Ansible installed: `sudo dnf install ansible`
- Internet connection for downloading tools and packages
- Sudo privileges for system-level changes

## Backup

Your original Fedora Silverblue playbooks are preserved in `silverblue-backup/` if you need to reference them.

## Customization

- **Tool versions**: Edit version variables at the top of `system.yml`
- **Packages**: Modify `base_packages` list in `system.yml`
- **Shell aliases**: Edit the `.zshrc` content block in `system.yml`
- **VSCode extensions**: Add tasks to `host-setup.yml` using `code --install-extension`

## Troubleshooting

### Permission Denied on AWS CLI
The AWS CLI installation requires sudo. Make sure you're running with privilege escalation enabled.

### kubectl/k9s Command Not Found
Ensure `~/.local/bin` is in your PATH. Log out and log back in, or run:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

### Powerlevel10k Not Showing
Run `p10k configure` to set up the theme, or check that fonts are properly installed.

## License

Feel free to use and modify these playbooks for your own setup.
# private.workstation-bootstrap
# private.workstation-bootstrap
