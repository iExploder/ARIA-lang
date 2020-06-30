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

```aria
FEL HORY name TAS type.
name HORK TAS type.
FEL LAWARY name TAS type.
```

Variable should have alphabetal name in **capital** letters,
ends with `A`.

#### Examples

```aria
FEL HORY HOGEA.
FEL HORY PIYOA TAS ARIA.
BARA HORK TAS ARIA.
FEL LAWARY FUGAA TAS ORIA.
```

Specially, Declaration with initialization could be written in

```aria
FEL HORY name, FIE value.
FEL HORY name TAS type, FIE value.
name HORK, FIE value.
name HORK TAS type, FIE value.
```

Variable's `type` is infered by initial value if it is not specified.

### HOLY ENDY (Declaration of Functions)

```aria
FEL ARS function-name. WEL FIRY param1 (SA/SE param2 ...).
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

### General Operations

* Concat Strings  `&`

### ENDY (Function Call)

```aria
(param0 SIE value0, ..., ) LE/LEE WIRY function.
```

## QURELY (Assignment Statement)

```aria
name QURELY new-value.
```

Assign `new-value` to variable `name`.

## SIE-SYUA (If-condition Statement)

```aria
value1 SIE value2? SYUA statement1.
value1 SIE value2? SYUA statement1; NEL SYUA statement2.
```

If value1 equals value2, statement1 would be executed.
Otherwise, statement2 would be executed.

## ENDIA (Loops Statement)

ENDIA(loop), DIRY(break)

### Infinite Loop (`do ... loop`)

```aria
FEL WIRY ENDIA.
  (do something)
FEL ENDY ENDIA.
```

### While Loop

```aria
FEL WIRY ENDIA SAR condition.
  (do something)
FEL ENDY ENDIA.
```

## ARY (Built-in Print Statement)

```aria
FEL/LE/LEE ARY value (SA/SE value ...).
```


