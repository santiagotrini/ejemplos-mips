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

4. Cuarto ejercicio `palindrome.c` y `palindrome.s`.

Una palabra es palíndromo si se lee igual desde la izquierda o la derecha. Ejemplos comunes de palíndromos son: "neuquen", "reconocer", "rapar", "salas", "oso" y "radar".
Implementar una función que devuelva uno si la palabra es palíndromo o cero de lo contrario.

Para este ejercicio conviene reutilizar la función `strlen()` que definieron en el ejercicio 2. El único problema con eso es que cuando llaman a `strlen()` dentro de `palindrome()` pierden la dirección de retorno a `main()`. A menos que guarden esa dirección en la pila de llamadas.

5. Quinto ejercicio. Hay que implementar la función distancia al cuadrado:

```math
D^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2
```

Para eso implementar dos funciones, $D^2$ y $f(x)=x^2$ en el código. El programa debe comenzar en `main()`, desde `main()` llamar a `D()` y desde `D()` llamar dos veces a `square()`. Lo queremos hacer así a propósito para entender como funciona la *call stack* (pila de llamadas).
