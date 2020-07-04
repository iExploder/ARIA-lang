# ARIA TIRA(Syntax of ARIA-lang)

## Reserved words (alphabetal sorted)

The following words are **reserved** words.
You **CAN NOT** use them as names of variables or functions.

* ARIA
* ARS
* DIRY
* ENDIA
* FIE
* FEL
* FIRK
* FIRY
* HORK
* HORY
* LAWARY
* LE
* LEE
* LU
* NEL
* NEN
* ORIA
* QURELY
* SA
* SE
* SIE
* SYUA
* TAS
* TIRA
* WEL
* WIRY

## TIND (Expressions)

* WELD (Literals)
  * ORIA(Numbers): `1`, `2`, `1.5`, ...
  * TIRA(Booleans): `SELD` , `NELSELD`
  * ARIA(String): Text quoted by `""`
* NELWELD (Variables)

## HORY (Declaration)

### HORY NELWELD (Declaration of Variables)

Variable should have alphabetal name in **capital** letters,
ends with `A`.

#### Examples

```aria
FEL HORY name, FIE value.
name HORK, FIE value.
```

Variable's `type` is infered by initial value if it is not specified.

### HOLY ENDY (Declaration of Functions)

```aria
FEL ARS LO function-name, WEL FIRY param1 (SA/SE param2 ...).
  in-function contents
  WEL FIRK return-value.
LU.
```



## IRY (Operations)

### Arithmetic Operations

Like most popular programming languages, ARIA provided built-in operations in C-style.

* Addition        `+`
* Subtraction     `-`
* Multiplication  `*`
* Division        `/`
* Modular         `%`
  
Notice: Priority of Multiplication and Division is higher than Addition and Subtraction.

* Increment       `YUERY`
* Decrement       `WORY`

### Comparation Operation

* Greater           `>`
* Greater or Equal  `>=`
* Less              `<`
* Less or Equal     `<=`
* Equal             `=`

Notice `=` can operate on **ORIA**(Numbers), **TIRA**(Booleans) and **ARIA**(Strings)
but `> >= < <=` can only operate on **ORIA**(Numbers).

### Boolean Operation

* Boolean AND     `SA` or `SE`
* Boolean OR      `SO`

### General Operations

* Concat Strings  `&`

### ENDY (Function Call)

```aria
FEL/LE/LEE ENDY function MIO param0 SIE value0, ... .
function ENDK MIO param0 SIE value0, param1 SIE value1, ... .
```

## QURELY (Assignment Statement)

```aria
name QURELY new-value.
```

Assign `new-value` to variable `name`.

## RARY-SYUA (If-condition Statement)

```aria
value RARY? SYUA statement1.
value RARY? SYUA statement1. NEL SYUA statement2.
```

If value is SELD(true), statement1 would be executed.
Otherwise, statement2 would be executed.

## ENDIA (Loops Statement)

ENDIA(loop), DIRY(break)

### Infinite Loop (`do ... loop`)

```aria
FEL WIRY ENDIA.
  (do something)
ENDIA LU.
```

### While Loop

```aria
FEL WIRY ENDIA SAR condition.
  (do something)
ENDIA LU.
```

## ARY (Built-in Print Statement)

```aria
FEL/LE/LEE ARY value.
```


