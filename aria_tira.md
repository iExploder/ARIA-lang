# ARIA TIRA(Syntax of ARIA-lang)

## Reserved words (alphabetal sorted)

The following words are **reserved** words.
You **CAN NOT** use them as names of variables.

* ENDIA
* SYUA
* SA

The following words are also **reserved**,
you can not use them as names of functions.

* SELD
* NELSELD
* FEL
* FIE
* HORY
* HORK
* ARS
* WEL
* FIRY
* SASE
* FIRK
* LU
* YUERY
* WORY
* ENDY
* MIO
* SIE
* ENDK
* QURELY
* NEL
* NEN
* WIRY
* SAR
* ARY
* LO
* SE
* SO
* DIRY
* LE
* LEE
* RARY

## TIND (Expressions)

* WELD (Literals)
  * ORIA(Numbers): `1`, `2`, `1.5`, ...
  * TIRA(Booleans): `SELD`(true) , `NELSELD`(false)
  * ARIA(String): Text quoted by `""`, `foo`, `hoge`, `しも～っす！`, ...
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

The name of functions should contains only **capital** letters and end in letter other than `A`.

```aria
FEL ARS LO function-name, WEL FIRY param1 (SA/SE param2 ...).
  in-function commands
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

### Break Statement

```aria
DIRY.
```
Use in loops to break out.

## ARY (Built-in Print Statement)

```aria
FEL/LE/LEE ARY value.
```

## Comments

Text quoted by `~` are comments.
Code or text as comments are ignored by the interpreter.
```aria
~ This is a comment. ~
~ hoge piyo fuga foo bar ~
~ そして誰もいなくなった ~
```
