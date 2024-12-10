#DIRS := ex00 ex01 ex02 ex03 ex04 ex05 ex06 ex07 ex08 ex09
DIRS := ex00 ex01 ex02 ex03

SRCS := ft_test_sign.ml ft_countdown.ml ft_power.ml ft_print_alphabet.ml
#SRCS := ft_plus_sign.ml some_other_name.ml another_file.ml \
        fourth_file.ml fifth_file.ml sixth_file.ml \
        seventh_file.ml eighth_file.ml ninth_file.ml tenth_file.ml

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


