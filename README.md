# Neovim IDE
__Neovim IDE in a NixOS Docker Container__

```bash
docker run --volumes-from=nix -it -v $(pwd):/app -w /app --name neovim nixos/nix nix-shell /app/nvim.nix
```

- Starts an interactive session in a NixOS Docker container.
- The `nix` data container is used to shared persistent /nix for all Nix containers.
- Creates a volume wich mounts the current working directory to the `/app` directory in the container.

LINKS
____

- [ToiletHill.io]  Additional Notes & Info
- [NixOS]
- [NixOS Vim Wiki]
- [Neovim]
- [Setting Up Vim Post]
- [Docker]

[ToiletHill.io]: http://toilethill.io/notes/
[NixOS Vim Wiki]: https://nixos.wiki/wiki/Vim
[Setting Up Vim Post]: https://www.mpscholten.de/nixos/2016/04/11/setting-up-vim-on-nixos.html
[NixOS]: https://nixos.org/
[Neovim]: https://neovim.io/
[Docker]: https://hub.docker.com/r/nixos/nix/
[Markdown]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
