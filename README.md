# Ejemplos de MIPS

1. Primer ejercicio `compare.c` y `compare.s`.

Una función que recibe dos argumentos enteros y devuelve lo siguiente.

```math
\text{compare}(a, b) = 
\begin{cases} 
> 0 & \text{si } a > b \\
\:\:\: 0 & \text{si } a = b \\
< 0 & \text{si } a < b 
\end{cases}
```

2. Segundo ejercicio `stringlength.c` y `stringlength.s`.

Una función que recibe un argumento de tipo *string* y devuelve la cantidad de caracteres (su longitud).

```c
stringlength("hola") // devuelve 4
stringlength("no me sale\n") // devuelve 11
```
