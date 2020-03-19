let 
  init_vim = import ./init_vim.nix rec { pkgs = pkgs; };
in

with import <nixpkgs> {
  config = {
    packageOverrides = pkgs : with pkgs; {
      myNeovim = neovim.override {
        configure = {

          customRC = init_vim.config;

          plug.plugins = with pkgs.vimPlugins; [
            vim-easy-align
            nerdtree
            vim-airline
            vim-airline-themes
            vim-autoformat
            vim-fugitive
            vim-gitgutter
            deoplete-nvim
            deoplete-jedi
            deoplete-ternjs
            deoplete-rust
            nvim-yarp
            vim-flake8
            neoformat
            vim-yapf
            auto-pairs
            vim-surround
            vim-jsbeautify
            typescript-vim
            vim-nix
            vim-solidity
            jedi-vim
          ];

        }; 
      };
    };
  };
};

stdenv.mkDerivation rec {
  name = "neovim";

  buildInputs = [
    git
    go
    rustc
    cargo
    nodejs
    ghc
    cabal-install
    solc
    python37
    python37.pkgs.pip
    python37.pkgs.msgpack
    python37.pkgs.jedi
    python37.pkgs.pynvim
    python37.pkgs.pyopenssl
    powerline-fonts
    xclip
    myNeovim
  ];
  shellHook = ''
    nvim +PlugInstall +qa
  '';
}
