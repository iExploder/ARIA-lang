type token =
  | ORIA of (float)
  | ARIA of (string)
  | MAR of (string)
  | PLUS
  | MINUS
  | ASTERISK
  | SLASH
  | PERCENT
  | ANDMARK
  | GREATER
  | GREQUAL
  | LESS
  | LEEQUAL
  | EQUAL
  | QMARK
  | SELD
  | NELSELD
  | FEL
  | FIE
  | HORY
  | HORK
  | ARS
  | WEL
  | FIRY
  | SASE
  | FIRK
  | LU
  | YUERY
  | WORY
  | ENDY
  | MIO
  | SIE
  | ENDK
  | QURELY
  | SYUA
  | NEL
  | NEN
  | WIRY
  | ENDIA
  | SAR
  | ARY
  | LO
  | SA
  | SE
  | SO
  | DIRY
  | LE
  | LEE
  | RARY
  | EOF
  | FULLSTOP
  | COMMA

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.walre
