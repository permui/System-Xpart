SRC_DIR			=	$(CURDIR)
DST_DIR			=	$(SRC_DIR)/build
SYSROOT			=	$(DST_DIR)/sysroot

include $(SRC_DIR)/app/Makefile

CROSS_PREFIX	=	riscv64-unknown-elf-
CC				=	$(CROSS_PREFIX)gcc
LD				=	$(CROSS_PREFIX)ld
AR				= 	$(CROSS_PREFIX)ar
OBJCOPY			=	$(CROSS_PREFIX)objcopy

ISA			=	rv64ima
ABI			=	lp64
INCLUDE		=	-I$(SRC_DIR)/include
CFLAG		=	-march=$(ISA) -mabi=$(ABI) -mcmodel=medany \
				-ffunction-sections -fdata-sections -nostartfiles \
				-nostdlib -nostdinc -fno-builtin \
				-g3 -static $(INCLUDE)

BUILD_LIST	= 	env lib
BUILT_IN	=	$(addsuffix /built-in.a,$(BUILD_LIST))

IMAGE		= 	simple_fs.cpio
IMAGE	   :=	$(addprefix $(DST_DIR)/,$(IMAGE))

export DST_DIR CC LD AR OBJCOPY CFLAG

.PHONY: all user clean

all: image

$(DST_DIR) $(SYSROOT):
	mkdir -p $@

$(BUILT_IN):
	$(MAKE) -C $(dir $@)

$(USER_TARGET): % : app/%.o $(BUILT_IN) $(DST_DIR)
	$(LD) -T env/link.ld -o $(DST_DIR)/$@ -melf64lriscv --build-id -X $< --whole-archive  $(BUILT_IN)   # --strip-debug
	# $(OBJCOPY) $(DST_DIR)/$@ -O binary $(DST_DIR)/$@.bin

image: $(USER_TARGET) $(SYSROOT)
	cd $(DST_DIR); cp $(USER_TARGET) $(SYSROOT)
	echo "flag={HappyNewYear2021}" > $(SYSROOT)/flag
	cd $(SYSROOT); find . | cpio -o -H newc > $(IMAGE)

clean:
	rm -rf **/*.o **/built-in.a $(BUILT_IN) build
