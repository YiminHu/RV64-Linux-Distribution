DIR_RVLINUX		:=$(wildcard ~/RV64-Linux-Distribution)
DIR_BUILD		:=$(DIR_RVLINUX)/build
DIR_EGCONF		:=$(DIR_RVLINUX)/conf-example
all:
	@cp $(DIR_EGCONF)/bblayers.conf $(DIR_BUILD)/conf/bblayers.conf
	@cp $(DIR_EGCONF)/local.conf $(DIR_BUILD)/conf/local.conf
	@cd $(DIR_BUILD);bitbake core-image-riscv
	@cd $(DIR_BUILD);bitbake bbexample
	@cd $(DIR_BUILD);bitbake core-image-riscv

