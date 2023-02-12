#!/bin/bash

clang-tidy \
	--fix \
	--fix-errors \
	--extra-arg=-std=c++20 \
	./**/*.[ch]pp \
	./*.[ch]pp

clang-format \
	-i \
	--sort-includes \
	./**/*.[ch]pp \
	./*.[ch]pp

pre-commit run --all-files
