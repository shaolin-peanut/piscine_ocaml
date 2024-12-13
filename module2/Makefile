DIRS := $(addprefix ex0,$(shell seq 0 8))

SRCS := $(shell find $(DIRS) -name '*.ml')

EXERCISES := $(join $(addsuffix /,$(DIRS)),$(SRCS))

RUN_TARGETS := $(addprefix run,$(shell seq 0 9))

all: $(DIRS)

$(DIRS):
	@echo "Compiling $@..."
	cd $@ && ocamlopt -o $@ $(notdir $(filter $@/%,$(EXERCISES)))

clean:
	@echo "Cleaning up..."
	for dir in $(DIRS); do \
		rm -f $$dir/$$dir $$dir/*.cmx $$dir/*.o $$dir/*.cmi; \
	done

run%: ex%
	@echo "Running ex$*..."
	./ex$*/ex$*

.PHONY: all clean $(DIRS) $(RUN_TARGETS)


