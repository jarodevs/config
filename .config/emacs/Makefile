#
# File: Makefile
# Time-stamp: <2024-06-01 11:30:00>
# Description: Makefile used to generate a lisp file from an org file
#

# Set configuration folder path
SRC_DIR=$(shell pwd)

# Source file (the org file)
SRC_FILE=$(SRC_DIR)/init.org

# Destination file (the emacs lisp file)
DEST_FILE=$(SRC_DIR)/init.el

# Destination directory where the lisp code will be generated
DEST_DIR=$(SRC_DIR)/lisp

# Main rule
all: build

build:
	mkdir -p $(DEST_DIR); \
	emacs --batch \
		--eval "(require 'org)" \
		--eval "(org-babel-load-file \"$(SRC_FILE)\")"

test:
	emacs -Q -l $(DEST_FILE)

clean:
	rm -rf $(DEST_FILE) $(DEST_DIR)
