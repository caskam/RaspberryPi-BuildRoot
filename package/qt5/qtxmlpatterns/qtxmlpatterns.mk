QTXMLPATTERNS_VERSION = 5.1.1
QTXMLPATTERNS_SITE = http://download.qt-project.org/official_releases/qt/5.1/$(QTXMLPATTERNS_VERSION)/submodules/
QTXMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QTXMLPATTERNS_VERSION).tar.xz
QTXMLPATTERNS_DEPENDENCIES = qtbase
QTXMLPATTERNS_INSTALL_STAGING = YES

define QTXMLPATTERNS_CONFIGURE_CMDS
	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) distclean
	#run qmake
	(cd $(@D) && $(HOST_DIR)/usr/bin/qmake )
endef

define QTXMLPATTERNS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QTXMLPATTERNS_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) install
endef

define QTXMLPATTERNS_INSTALL_TARGET_CMDS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
endef

define QTXMLPATTERNS_UNINSTALL_TARGET_CMDS
	-rm $(TARGET_DIR)/usr/lib/libQt5XmlPatterns*.so.*
endef

$(eval $(generic-package))
