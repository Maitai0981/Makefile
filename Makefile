ifeq ($(OS),Windows_NT)
    CLEAR   = cls
    SHOW    = type
    TARGET  = compilador.exe
else
    CLEAR   = clear
    SHOW    = cat
    TARGET  = compilador
endif

CXX = g++
CXXFLAGS = -O2 -Wall -std=c++17

c ?= main.cpp
en ?= en.txt
out = out.txt

MAKEFLAGS += --no-print-directory

.PHONY: $(filter %.cpp,$(MAKECMDGOALS))
$(filter %.cpp,$(MAKECMDGOALS)):
	$(MAKE) run c=$@

.PHONY: run
run: $(TARGET)
	@$(CLEAR)
	$(TARGET) < $(en) > $(out)
	@$(SHOW) $(out)

$(TARGET): $(c)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(c)
