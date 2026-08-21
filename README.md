# Ejemplos de MIPS

## Ejercicios

1. **Primer ejercicio** `compare.c` y `compare.s`.

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

2. **Segundo ejercicio** `stringlength.c` y `stringlength.s`.

Una función que recibe un argumento de tipo *string* y devuelve la cantidad de caracteres (su longitud).

Para resolver este ejercicio van a necesitar una nueva instrucción: `lb` o *load byte*. La sintaxis es la misma que la de `lw`. En vez de poner 4 bytes en un registro solo carga un byte desde la memoria y por lo tanto es perfecta para leer caracteres individuales de un *string*.
Recuerden que los arreglos de caracteres o *strings* indican su final con el caracter nulo.

```c
stringlength("hola") // devuelve 4
stringlength("no me sale\n") // devuelve 11
```

3. **Tercer ejercicio** `my_atoi.c` y `my_atoi.s`.

Un clon de la función `atoi()` de C.

```c
atoi("1234") // devuelve 1234 (tipo int)
atoi("000")  // devuelve 0    (tipo int)
atoi("-12")  // devuelve -12  (tipo int)
```

4. **Cuarto ejercicio** `palindrome.c` y `palindrome.s`.

Una palabra es palíndromo si se lee igual desde la izquierda o la derecha. Ejemplos comunes de palíndromos son: "neuquen", "reconocer", "rapar", "salas", "oso" y "radar".
Implementar una función que devuelva uno si la palabra es palíndromo o cero de lo contrario.

Para este ejercicio conviene reutilizar la función `strlen()` que definieron en el ejercicio 2. El único problema con eso es que cuando llaman a `strlen()` dentro de `palindrome()` pierden la dirección de retorno a `main()`. A menos que guarden esa dirección en la pila de llamadas.

5. **Quinto ejercicio** hay que implementar la función distancia al cuadrado:

```math
D^2 = (x_2 - x_1)^2 + (y_2 - y_1)^2
```

<br>

Para eso implementar dos funciones, $D^2$ y $f(x)=x^2$ en el código. El programa debe comenzar en `main()`, desde `main()` llamar a `D()` y desde `D()` llamar dos veces a `square()`. Lo queremos hacer así a propósito para entender como funciona la *call stack* (pila de llamadas).

6. **Sexto ejercicio** una función que cuente en un *string* la cantidad de ocurrencias de un caracter determinado: `int char_count(char *s, char c)`.

```c
count_char("banana", 'a') // → 3
count_char("papoi", 'p') // → 2
```

7. **Séptimo ejercicio** hay que implementar una función `int wc(char *s)` que cuente palabras (delimitadas por espacios) en un *string*.

```c
wc("hola    mundo!") // → 2
wc("Oh! Bello, papaguena! Tu le bella comme le papaya") // → 9
```

## Convención de llamadas en MIPS

La **convención de llamadas** establece reglas para que las funciones puedan comunicarse entre sí correctamente: cómo se pasan los parámetros, dónde se devuelve el resultado y qué registros debe preservar una función.

### Registros principales

* `$a0 - $a3`: se utilizan para **pasar los primeros 4 argumentos** a una función.
* `$v0 - $v1`: se utilizan para **devolver valores** desde una función.
* `$ra`: contiene la **dirección de retorno** después de un `jal`.
* `$sp`: apunta al **top of stack** (tope de la pila).
* `$t0 - $t9`: registros **temporales**. Una función puede modificarlos sin necesidad de preservarlos.
* `$s0 - $s7`: registros **guardados** (*saved registers*). Si una función los modifica, debe guardar su valor original y restaurarlo antes de retornar.

### Llamar a una función

Para llamar a una función se utiliza:

```mips
jal funcion
```

`jal` guarda en `$ra` la dirección de la instrucción siguiente y salta a `funcion`.

La función retorna mediante:

```mips
jr $ra
```

### Ejemplo

```mips
# llamar a suma(10, 20)
li   $a0, 10
li   $a1, 20
jal  suma

# resultado en $v0
```

La función:

```mips
suma:
    add  $v0, $a0, $a1
    jr   $ra
```

En este caso:

* `$a0 = 10` → primer parámetro
* `$a1 = 20` → segundo parámetro
* `$v0 = 30` → valor retornado
* `$ra` → dirección a la que debe regresar la función

### ¿Por qué necesitamos el stack?

Cuando una función necesita hacer otra llamada mediante `jal`, el valor de `$ra` puede ser sobrescrito. Por eso, cuando corresponde, debemos **guardar `$ra` en el stack** y recuperarlo antes de retornar.

```mips
funcion:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    jal  otra_funcion

    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    jr   $ra
```

> **Idea clave:** la convención de llamadas permite que distintas funciones puedan trabajar juntas sin pisarse los datos importantes. Antes de escribir una función, preguntate: **¿qué recibo?, ¿dónde lo recibo?, ¿qué debo preservar?, ¿qué devuelvo y dónde?**

## Conceptos revisados

* **Registros MIPS**

  * Uso de registros temporales (`$t0-$t9`) y de argumentos/retorno (`$a0-$a3`, `$v0-$v1`).
  * Movimiento de datos entre registros con `move`.

* **Operaciones aritméticas y lógicas**

  * `add`, `addi`, `sub`, `mul`, `div`.
  * Comparaciones y operaciones lógicas.
  * Uso de `li` para cargar valores inmediatos.

* **Estructuras de control**

  * Condicionales: `beq`, `bne`.
  * Construcción de `if / else`.
  * Construcción de ciclos (`while`, `for`) mediante saltos.

* **Funciones**

  * Declaración y llamada de funciones con `jal`.
  * Retorno mediante `jr $ra`.
  * Paso de parámetros mediante registros.
  * Retorno de valores mediante `$v0`.

* **Convención de llamadas**

  * Uso correcto de registros según su propósito.
  * Registros temporales vs. registros que deben preservarse.
  * Importancia de respetar la convención al llamar a otras funciones.

* **Call Stack**

  * Uso de `$sp` para manejar la pila.
  * Reservar y liberar espacio en el stack.
  * Guardar y recuperar registros.
  * Preservar `$ra` cuando una función realiza llamadas a otras funciones.

* **Arrays y memoria**

  * Acceso a posiciones de memoria mediante direcciones.
  * Cálculo de offsets.
  * Diferencia entre dirección y valor almacenado.
  * Uso de `lw` / `sw`.

* **Strings**

  * Representación de strings como secuencias de bytes.
  * Terminador `\0`.
  * Recorrido carácter por carácter.
  * Uso de `lb` para leer caracteres.
  * Comparación de caracteres.

* **Conversión de tipos / caracteres**

  * Diferencia entre un carácter y su representación ASCII.
  * Conversión de caracteres numéricos (`'0'`–`'9'`) a valores enteros.
  * Construcción de números a partir de un string.

* **Relación C → MIPS**

  * Traducción de variables a registros/memoria.
  * Traducción de `if`, `while` y funciones.
  * Traducción de acceso a arrays y strings.
  * Identificación de qué operaciones realiza realmente el compilador a nivel de ensamblador.

* **Debugging**

  * Seguir la ejecución instrucción por instrucción.
  * Observar registros y memoria.
  * Verificar valores de `$sp` y `$ra`.
  * Detectar errores de direcciones, offsets y saltos.

### Para repasar antes de una evaluación

Deberías poder **leer código MIPS y explicar qué hace**, traducir código sencillo de **C a MIPS**, seguir el contenido de los **registros y la memoria** durante la ejecución y escribir funciones respetando la **convención de llamadas y el uso del stack**.

