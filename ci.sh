#!/bin/bash

clang-tidy \
	--fix \
	--fix-errors \
	./**/*.[ch]pp

clang-format \
	-i \
	--sort-includes \
	./**/*.hpp

pre-commit run --all-files
