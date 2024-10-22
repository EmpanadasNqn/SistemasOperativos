# Lab 2: Implementación de un sistema de semáforos en xv6

Este proyecto se basa en xv6, un sistema operativo de enseñanza simple similar a Unix desarrollado por el MIT con fines educativos. En este proyecto, hemos implementado un sistema de semáforos, seis syscalls personalizadas y las funciones de usuario `pingpong`, `holamundo`, `holamundosyscall`.

## Contenido

- [Sistema de Semáforos](#sistema-de-semáforos)
- [Implementación de Syscalls](#implementación-de-syscalls)
- [Implementación de Programas de Usuario](#implementación-de-programas-de-usuario)
- [Ejecución del Emulador QEMU](#ejecución-del-emulador-qemu)
- [Comandos útiles](#comandos-útiles)
- [Bibliografía](#bibliografía)
- [Contribución](#contribución)
- [Copyright xv6](#copyright-xv6)

## Sistema de Semáforos

La implementación usada en este laboratorio es la de `Semáforos Nombrados`, inspirados en los semáforos nombrados que define POSIX.
Sus características son:

1. Son `administrados por el kernel`.
2. Están `disponibles globalmente` para todos los procesos del sistema operativo.
3. Su `estado se preserva` mientras el SO esté activo.
4. Cada semáforo tiene un `Nombre` que lo identifica con el kernel, en nuestro caso los nombres son números enteros entre cero y un límite máximo.

## Implementación de Syscalls

Las siguientes syscalls han sido implementadas en este proyecto:

- `int sem_open(int sem, int value)`: Esta función abre y/o inicializa el semáforo `sem` con un valor arbitrario `value`.
- `int sem_close(int sem)`: Libera el semáforo `sem`.
- `int sem_up(int sem)`: Incrementa el semáforo `sem` desbloqueando los procesos cuando su valor es cero.
- `int sem_down(int sem)`: Decrementa el semáforo `sem` bloqueando los procesos cuando su valor es cero. El valor del semáforo nunca puede ser menor a cero.
- `int sem_search(int value)`: Busca un semáforo disponible hasta poder entregarlo. De no haber retorna error.
- `int sys_hm(void)`: Es un hola mundo hecho Syscall.

Cada syscall ha sido añadida al kernel de xv6 en el archivo semaphores.c y puede ser utilizada por programas de usuario. La syscall sem_init() se agregó al main. Los archivos modificados para la implementación de las syscalls son en el directorio `kernel` y son `defs.h`, `syscall.h`, `syscall.c` y `sysproc.c`.

## Implementación de Programas de Usuario

- `holamundo`: Escribe un `Hola Mundo` normal y corriente, el de toda la vida.
- `holamundosyscall`: Es el programa que ejecuta la syscall `sys_hm()`, que escribe Hola Mundo! Soy una syscall. Al hacer ls en xv6, aparece como `holamundosysca` pero es porque el nombre es muy largo.
- `pingpong`: Imprime una secuencia de ping's y pong's intercalada sincronizada usando el sistema de semáforos. `Toma como argumento un entero` que será la cantidad de veces que aparecerá la palabra `ping` y `pong` en pantalla.

Para la implementación de estos programas se modificaron en el directorio `user` los archivos `holamundo.c`, `holamundosyscall.c`, `pingpong.c` y `Makefile` afuera del directorio `user`.

## Ejecución del Emulador QEMU

### Requisitos Previos

Para construir y ejecutar xv6, necesitas tener las siguientes herramientas instaladas en tu sistema:
- `gcc` (Colección de Compiladores de GNU)
- `qemu` (Emulador Rápido)
- `make`
- `git` (Sistema de control de versiones)

### Clonando el Repositorio

Clonar el repositorio con git:
```sh
git clone https://user@bitbucket.org/sistop-famaf/so23lab2g36.git
```
### Emulador QEMU

Posicionándose en el directorio so23lab2g36, ejecutar el comando `make QEMU`.

## Comandos útiles

- `ls`: Una vez en el emulador QEMU, al ejecutar ls lista todos los programas de usuario disponibles.
- `<CTRL-p>`: Lista todos los procesos que están corriendo en el sistema xv6.
- `<CTRL-a> x`: Sale del sistema operativo xv6.
- `make grade`: "Auto Corrige" el código.
- `make QEMU`: Ejecuta el emulador QEMU de xv6.

## Bibliografía

- `xv6: a simple, Unix-like teaching operating system`.
- `Operating Systems: Three Easy Pieces` Capítulo 31.

## Contribución

Participaron los estudiantes de la materia Sistemas Operativos, del grupo 36:
- `Santino Ponchiardi`
- `Santos Facundo Adrian Farias`
- `Brandon Michel`
- `Alejandro N. Pitt Aparicio`

## Copyright xv6

xv6 is a re-implementation of Dennis Ritchie's and Ken Thompson's Unix
Version 6 (v6).  xv6 loosely follows the structure and style of v6,
but is implemented for a modern RISC-V multiprocessor using ANSI C.

ACKNOWLEDGMENTS

xv6 is inspired by John Lions's Commentary on UNIX 6th Edition (Peer
to Peer Communications; ISBN: 1-57398-013-7; 1st edition (June 14,
2000)).  See also https://pdos.csail.mit.edu/6.1810/, which provides
pointers to on-line resources for v6.

The following people have made contributions: Russ Cox (context switching,
locking), Cliff Frey (MP), Xiao Yu (MP), Nickolai Zeldovich, and Austin
Clements.

We are also grateful for the bug reports and patches contributed by
Takahiro Aoyagi, Silas Boyd-Wickizer, Anton Burtsev, carlclone, Ian
Chen, Dan Cross, Cody Cutler, Mike CAT, Tej Chajed, Asami Doi,
eyalz800, Nelson Elhage, Saar Ettinger, Alice Ferrazzi, Nathaniel
Filardo, flespark, Peter Froehlich, Yakir Goaron, Shivam Handa, Matt
Harvey, Bryan Henry, jaichenhengjie, Jim Huang, Matúš Jókay, John
Jolly, Alexander Kapshuk, Anders Kaseorg, kehao95, Wolfgang Keller,
Jungwoo Kim, Jonathan Kimmitt, Eddie Kohler, Vadim Kolontsov, Austin
Liew, l0stman, Pavan Maddamsetti, Imbar Marinescu, Yandong Mao, Matan
Shabtay, Hitoshi Mitake, Carmi Merimovich, Mark Morrissey, mtasm, Joel
Nider, Hayato Ohhashi, OptimisticSide, Harry Porter, Greg Price, Jude
Rich, segfault, Ayan Shafqat, Eldar Sehayek, Yongming Shen, Fumiya
Shigemitsu, Cam Tenny, tyfkda, Warren Toomey, Stephen Tu, Rafael Ubal,
Amane Uehara, Pablo Ventura, Xi Wang, WaheedHafez, Keiichi Watanabe,
Nicolas Wolovick, wxdao, Grant Wu, Jindong Zhang, Icenowy Zheng,
ZhUyU1997, and Zou Chang Wei.


The code in the files that constitute xv6 is
Copyright 2006-2022 Frans Kaashoek, Robert Morris, and Russ Cox.

ERROR REPORTS

Please send errors and suggestions to Frans Kaashoek and Robert Morris
(kaashoek,rtm@mit.edu).  The main purpose of xv6 is as a teaching
operating system for MIT's 6.1810, so we are more interested in
simplifications and clarifications than new features.

BUILDING AND RUNNING XV6

You will need a RISC-V "newlib" tool chain from
https://github.com/riscv/riscv-gnu-toolchain, and qemu compiled for
riscv64-softmmu.  Once they are installed, and in your shell
search path, you can run "make qemu".
