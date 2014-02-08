# This makefile will just do make clean and make all to all of the projects

# Detect library extension depending on OS
ifeq ($(OS),Windows_NT)
	OSNAME ?= WINDOWS
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSNAME ?= LINUX
	endif
endif

# Make all
all :
	@$(MAKE) -C TSDRPlugin_RawFile/ all JAVA_HOME=$(JAVA_HOME)
ifeq ($(OSNAME),WINDOWS)
	@$(MAKE) -C TSDRPlugin_Mirics/ all MIRICS_HOME=$(MIRICS_HOME)
	@$(MAKE) -C TSDRPlugin_ExtIO/ all MIRICS_HOME=$(MIRICS_HOME)
endif
	@$(MAKE) -C TempestSDR/ all
	@$(MAKE) -C JavaGUI/ all

# Clean artifacts
clean :
	@$(MAKE) -C TSDRPlugin_RawFile/ clean
	@$(MAKE) -C TSDRPlugin_Mirics/ clean
	@$(MAKE) -C TSDRPlugin_ExtIO/ clean
	@$(MAKE) -C TempestSDR/ clean
	@$(MAKE) -C JavaGUI/ clean
