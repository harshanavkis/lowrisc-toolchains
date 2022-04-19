lowrisc-toolchains build
=========================

The [original version](https://github.com/lowRISC/lowrisc-toolchains#readme) of this readme has been altered for brevity.

# Usage

Open a nix shell after cd'ing into the project's root dir. You can also configure it using [direnv](https://direnv.net/).

```
$ nix-shell
```

In the shell, just run the toolchain build scrip:

```
$ ./build-all.sh
```

The toolchain is produced as a compressed file:  ```lowrisc-toolchain-rv32imcb-20220210-1.tar.xz```

This file contains both the llvm and gcc toolchains.

# Limitations

- Currently only produces toolchains for the [Ibex core](https://github.com/lowRISC/ibex/).
- crosstool-ng has a known issue(https://github.com/crosstool-ng/crosstool-ng/issues/1625) with downloading packages. 
