# Laboratorios Sistemas Operativos

Laboratorios de Sistemas Operativos, FaMAF 2024
Santino Ponchiardi

---

## Lab 0: ShellScripting
Consiste de una serie de ejercicios que se resuelven con una línea de comando ejecutada en la consola.

---

## Lab 1: MyBash
### Objetivos
- Utilizar los mecanismos de concurrencia y comunicación de gruesa granularidad que brinda UNIX.
- Comprender que un intérprete de línea de comandos refleja la arquitectura y estructura interna de las primitivas de comunicación y concurrencia.
- Implementar de manera sencilla un intérprete de línea de comandos (shell).
- Utilizar buenas prácticas de programación: estilo de código, tipos abstractos de datos (TAD), prueba unitaria (unit testing), prueba de caja cerrada (black box testing), programación defensiva; así como herramientas de debugging de programas y memoria.
### Objetivos de implementación
Codificar un shell al estilo de bash (Bourne Again SHell) llamada mybash. El programa tiene las siguientes funcionalidades generales:
- Ejecución de comandos en modo foreground y background
- Redirección de entrada y salida estándar.
- Pipe entre comandos.

---

## Lab 2: Semaphore's en xv6
Se implemento un sistema de Semáforos para espacio de usuario, que sirven como mecanismo de sincronización entre procesos. Se implementarán en la versión RISC-V de XV6 (sistema operativo con fines académicos) en espacio de kernel y provee syscalls accesibles desde espacio de usuario.
Como los semáforos vienen en varios estilos, en este laboratorio se implemento sólo un estilo de semáforos llamado semáforos nombrados inspirándose en los [semáforos nombrados](http://linux.die.net/man/7/sem_overview) que define POSIX.

---

## Lab 3: 
