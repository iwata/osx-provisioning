.PHONY: all
all : install_ansible dotfiles play_ansible

.PHONY: install_ansible
install_ansible :
	@./InstallAnsible.sh

.PHONY: dotfiles
play_ansible :
	@./Dotfiles.sh

.PHONY: play_ansible
play_ansible :
	@./PlayAnsible.sh
