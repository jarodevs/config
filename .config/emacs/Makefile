#
# File: Makefile
# Description: tangles init.org → init.el with Straight.el
#

SRC_DIR  := $(shell pwd)
SRC_FILE := $(SRC_DIR)/init.org
DEST_FILE:= $(SRC_DIR)/init.el
DEST_DIR := $(SRC_DIR)/lisp

all: build

build:
	mkdir -p $(DEST_DIR); \
	emacs --batch \
	  --eval "(let* ((bootstrap-file (expand-file-name \"straight/repos/straight.el/bootstrap.el\" user-emacs-directory)) \
	                 (bootstrap-version 7)) \
	             (unless (file-exists-p bootstrap-file) \
	               (with-current-buffer \
	                   (url-retrieve-synchronously \
	                    \"https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el\" \
	                    'silent 'inhibit-cookies) \
	                 (goto-char (point-max)) \
	                 (eval-print-last-sexp))) \
	             (load bootstrap-file nil 'nomessage))" \
	  --eval "(straight-use-package 'org)" \
	  --eval "(org-babel-load-file \"$(SRC_FILE)\")"

test:
	emacs -Q -l $(DEST_FILE)

clean:
	rm -rf $(DEST_FILE) $(DEST_DIR)
