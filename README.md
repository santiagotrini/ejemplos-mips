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
<br>

2. Segundo ejercicio `stringlength.c` y `stringlength.s`.

Una función que recibe un argumento de tipo *string* y devuelve la cantidad de caracteres (su longitud).

Para resolver este ejercicio van a necesitar una nueva instrucción: `lb` o *load byte*. La sintaxis es la misma que la de `lw`. En vez de poner 4 bytes en un registro solo carga un byte desde la memoria y por lo tanto es perfecta para leer caracteres individuales de un *string*.
Recuerden que los arreglos de caracteres o *strings* indican su final con el caracter nulo.

```c
stringlength("hola") // devuelve 4
stringlength("no me sale\n") // devuelve 11
```

3. Tercer ejercicio `my_atoi.c` y `my_atoi.s`.

Un clon de la función `atoi()` de C.

```c
atoi("1234") // devuelve 1234 (tipo int)
atoi("000")  // devuelve 0    (tipo int)
atoi("-12")  // devuelve -12  (tipo int)
```
