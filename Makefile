TARGET = tofi-pass
INSTALL_PATH = /usr/local/bin

install:
	@cp -f $(TARGET).sh $(INSTALL_PATH)/$(TARGET)
	@chmod +x $(INSTALL_PATH)/$(TARGET)
