#!/bin/bash

test() {
	# cmake -S . -B build
	# cmake --build build
	# ctest --test-dir build
	for f in ./dsalgo/*.cpp; do
		echo "next run $f"
		./run $f
	done
}

clang-tidy \
	--fix \
	--fix-errors \
	./**/*.[ch]pp

clang-format \
	-i \
	--sort-includes \
	./**/*.hpp

pre-commit run --all-files
# test
