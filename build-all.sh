#!/usr/bin/env bash

OUT_DIR="out/riscv"
TARGET="rv32imcb"
TOP_DIR=$(pwd)

mkdir -p ${TOP_DIR}/${OUT_DIR}

# build gcc first
echo "Building GCC..."
${TOP_DIR}/build-gcc-with-args.sh \
	"lowrisc-toolchain-gcc-${TARGET}" \
	"riscv32-unknown-elf" \
	"${TOP_DIR}/${OUT_DIR}" \
	"rv32imc_zba_zbb_zbc_zbs" \
	"ilp32" "medany"

# build clang next
echo "Building clang..."
${TOP_DIR}/build-clang-with-args.sh \
	"lowrisc-toolchain-${TARGET}" \
	"riscv32-unknown-elf" \
	"${TOP_DIR}/${OUT_DIR}" \
	"rv32imc_zba0p93_zbb0p93_zbc0p93_zbs0p93" \
	"ilp32" "medany" "-menable-experimental-extensions"

 compress the combined set of tools
tar -cvJf lowrisc-toolchain-rv32imcb-20220210-1.tar.xz -C "${TOP_DIR}/out/riscv/" .
