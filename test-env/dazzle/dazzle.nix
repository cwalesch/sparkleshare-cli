with (import <nixpkgs> {});
derivation {
  name = "dazzle";

  builder = "${bash}/bin/bash";
  args = [ "-c" "${coreutils}/bin/mkdir -p $out/bin && ${coreutils}/bin/cp $src $out/bin/dazzle.sh && ${coreutils}/bin/chmod +x $out/bin/dazzle.sh" ];

  src = pkgs.fetchurl {
    url = https://raw.githubusercontent.com/hbons/Dazzle/master/dazzle.sh;
    sha256 = "175fb5f7cf8f85ec004df3414db1697cfe15c28f95430c5329c5454654b93e6a";
  };

  system = builtins.currentSystem;
}
