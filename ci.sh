#!/bin/bash

clang-tidy \
	--fix \
	--fix-errors \
	./**/*.[ch]pp \
	./*.[ch]pp

clang-format \
	-i \
	--sort-includes \
	./**/*.[ch]pp \
	./*.[ch]pp

pre-commit run --all-files
