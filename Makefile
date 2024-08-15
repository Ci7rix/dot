FONTS_DIR=$(shell pwd)/fonts
MODULES_DIR=$(shell pwd)/modules

all: defaults installomator macport touchid dotfiles

dots:
	stow -v --ignore ".DS_Store" --dotfiles -t ~ dotfiles --adopt

defaults:
	@echo "Executing defaults.sh..."
	@bash $(MODULES_DIR)/defaults.sh
	@if [ $$? -ne 0 ]; then \
		echo "Error executing defaults.sh. Exiting."; \
		exit 1; \
	fi

fonts-monaspace:
	@echo "Installing fonts..."
	cp $(FONTS_DIR)/Monaspace/MonaspiceArNerdFontMono-*.otf ~/Library/Fonts

installomator:
	@echo "Executing installomator.sh..."
	@bash $(MODULES_DIR)/installomator.sh
	@if [ $$? -ne 0 ]; then \
		echo "Error executing installomator.sh. Exiting."; \
		exit 1; \
	fi

macport:
	@echo "Executing macport.sh..."
	@bash $(MODULES_DIR)/macport.sh
	@if [ $$? -ne 0 ]; then \
		echo "Error executing macport.sh. Exiting."; \
		exit 1; \
	fi

touchid:
	@echo "Executing touchid.sh..."
	@bash $(MODULES_DIR)/touchid.sh
	@if [ $$? -ne 0 ]; then \
		echo "Error executing touchid.sh. Exiting."; \
		exit 1; \
	fi

.PHONY: all
