# dry-nix

Nix flake for [dry](https://github.com/moncho/dry).
Dry is a terminal application to manage Docker and Docker Swarm.

# Usage

Add the dry flake as a flake input.

```nix
inputs = {
  dry.url = "github:dump247/dry-nix";
};
```

Add the package to the list of packages to install.

```nix
packages = [
  dry.${system}.default
];
```
