{ pkgs, ... }:


{
        # https://nixos.wiki/wiki/DotNET
        programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
  (writeShellScriptBin "dev" ''
    export DOTNET_ROOT=${pkgs.dotnetCorePackages.sdk_8_0}/bin
    export PATH=$DOTNET_ROOT:$PATH

    nix-shell -p \
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
        dotnetCorePackages.sdk_8_0 \
        dotnetCorePackages.sdk_9_0 \
    --command "zsh"
  '')
];


}
