with import <nixpkgs> {};
with python39Packages;

let

  crosstools-ng = stdenv.mkDerivation {
    pname = "crosstools-ng";
	version = "1.24.0";

	src = fetchFromGitHub {
      owner = "crosstool-ng";
	  repo = "crosstool-ng";
	  rev = "6ddf9e8dbfeb14a256d484b6396f2574406e30c3";
      sha256 = "sha256-UcdI8zYd41+1ybKEmEDYW8bSK3+7D8fd74GeG4G07p4=";
	};

    preConfigure = ''
	  bash bootstrap
	'';

	nativeBuildInputs = [
	  flex texinfo unzip help2man file which libtool ncurses bison 
	  autoconf automake gcc gperf python3 gawk wget bzip2 xz
	  gnupatch rsync curl bash
	];
  };

in stdenv.mkDerivation rec {
  name = "lowrisc-toolchain-env";

  hardeningDisable = [ "format" ];

  nativeBuildInputs = [
    # for the native platform
	python3
	gcc
	cmake
    crosstools-ng
	texinfo
	autoconf
	automake
	m4
	zlib
	flex
	bison
	zip
  ];
}
