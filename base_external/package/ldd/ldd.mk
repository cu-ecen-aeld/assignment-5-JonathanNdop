LDD_VERSION = '718cbdf07e082486e008537660e6b9fb4fb07a45'
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-JonathanNdop.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULE = YES
#LDD_MODULE_SUBDIRS = YES


LDD_MODULE_SUBDIRS += misc-modules/
LDD_MODULE_SUBDIRS += scull/


define LDD_INSTALL_TARGET_CMDS

	$(INSTALL) -d $(TARGET_DIR)/lib
	$(INSTALL) -m 0644 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/
        $(INSTALL) -m 0644 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/
	$(INSTALL) -m 0644 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/


	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin

endef


$(eval $(kernel-module))
$(eval $(generic-package))
