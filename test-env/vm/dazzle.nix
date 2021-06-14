with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "dazzle";

  src = fetchFromGitHub {
    owner = "hbons";
    repo = "Dazzle";
    rev = "dcd80ba7624f053bf53366e36b5d09a1b1d4e28d";
    sha256 = "0hb5dc6awxpxfvfbsl787z93ik8m939zilyx54v4ws0q8jwv17hn";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/dazzle.sh $out/bin/dazzle
    chmod +x $out/bin/dazzle
  '';

  meta = with stdenv.lib; {
    description = "SparkleShare host setup script";
    homepage = https://github.com/hbons/Dazzle;
    license = licenses.wtfpl;
    platforms = platforms.linux;
  };
}
