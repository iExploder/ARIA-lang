# ARIA TIRA(Grammar of ARIA-lang)

## TIND (Expressions)

* WELD (Literals)
  * OL ORIA(Numbers): `1`, `2`, `1.5`, ...
  * TIRA(Booleans): `SELD` , `NELSELD`
  * ARIA(String): Text quoted by `""`
* NELWELD (Variables)

## HORY (Declaration)

### HORY NELWELD (Declaration of Variables)

```
FEL HORY name (TAS type).
or
name HORK (TAS type).
```

Variable should have alphabetal name in **capital** letters, 
ends with `A`.

#### Examples

```
FEL HORY HOGEA.
FEL HORY PIYOA TAS ARIA.
FOOA HORK.
BARA HORK TAS ARIA.
```

Specially, Declaration with initialization could be written in

```
FEL HORY name (TAS type), SIE value.
or
name HORK (TAS type), SIE value.
```

### HOLY ENDY (Declcaration of Functions)

```
FEL ARS function-name. WEL FIRY param1 (SA/SE param2 ...).
  in-function contents
  WEL FIRK return-value.
LU.
```

## QURELY(Assignment)

```
name QURELY new-value.
```

Assign `new-value` to variable `name`.

## SIE-SYUA (If-condition Statement)

```
value1 SIE value2? SYUA statement1.
value1 SIE value2? SYUA statement1; NEL SYUA statement2.
```
If value1 equals value2, statement1 would be executed.
Otherwise, statement2 would be executed.

## ARY (Built-in Print)

```
FEL/LE/LEE ARY value (SA/SE value ...).
```

## ENDY (Function Call)

```
(param0 SIE value0, ..., ) LE/LEE WIRY function.
```
