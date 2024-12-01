{ pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
  xclip
  vscode.fhs
  (writeShellScriptBin "nvim" ''
    export DOTNET_ROOT=${pkgs.dotnetCorePackages.sdk_8_0}/bin
    export PATH=$DOTNET_ROOT:$PATH

    nix-shell -p \
	neovim \
	git \
	nodejs \
	python3 \
	gcc \
	go \
	rustc \
	cargo \
	zig \
	cmake \
	unzip \
        csharp-ls \
        omnisharp-roslyn \
        dotnetCorePackages.sdk_8_0 \
        dotnetCorePackages.sdk_9_0 \
    --command "nvim -u /etc/nixos/dirty/nvim/init.lua $@"
  '')
];
  environment.variables = {
    EDITOR = "nvim";
  };
}

