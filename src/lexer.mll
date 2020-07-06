(* lexer.mll
 * (C) 2020 iExploder
 * This code is licensed under MIT license (see LICENSE for details)
 *)
{
open Parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let alpha = ['A'-'Z' 'a'-'z' '_']


rule token = parse
  (* Comments *)
  | '~' (['\x00'-'\x7d' '\x7f'-'\xff'])+ '~' { token lexbuf }

  (* ORIA Literal *)
  | digit+ '.' digit+
    { let str = Lexing.lexeme lexbuf in
      ORIA (float_of_string str) }
  | digit+
    { let str = Lexing.lexeme lexbuf in
      ORIA (float_of_string str)}

  (* ARIA Literal *)
  | '"' ([^'"''\\'] | '\\'['\x00'-'\xff'])+ '"' {
    let lexeme = Bytes.sub_string
      lexbuf.lex_buffer
      (lexbuf.lex_start_pos + 1)
      (lexbuf.lex_curr_pos - lexbuf.lex_start_pos - 2) in
    ARIA (Scanf.unescaped lexeme)
  }

  (* TIRA Literal *)
  | "NELSELD" { NELSELD }
  | "SELD"    { SELD } 

  (* Operators *)
  | '+'       { PLUS }
  | '-'       { MINUS }
  | '*'       { ASTERISK }
  | '/'       { SLASH }
  | '%'       { PERCENT }
  | '&'       { ANDMARK }
  | ">="      { GREQUAL }
  | '>'       { GREATER }
  | "<="      { LEEQUAL }
  | '<'       { LESS }
  | '='       { EQUAL }

  (* Delimiters *)
  | '.'       { FULLSTOP }
  | ','       { COMMA }
  | '?'       { QMARK }

  (* Reserved words *)
  | "FEL"     { FEL }
  | "FIE"     { FIE }
  | "HORY"    { HORY }
  | "HORK"    { HORK }
  | "ARS"     { ARS }
  | "WEL"     { WEL }
  | "FIRY"    { FIRY }
  | "SASE"    { SASE }
  | "FIRK"    { FIRK }
  | "LU"      { LU }
  | "YUERY"   { YUERY }
  | "WORY"    { WORY }
  | "ENDY"    { ENDY }
  | "MIO"     { MIO }
  | "SIE"     { SIE }
  | "ENDK"    { ENDK }
  | "QURELY"  { QURELY }
  | "SYUA"    { SYUA }
  | "NEL"     { NEL }
  | "NEN"     { NEN }
  | "WIRY"    { WIRY }
  | "ENDIA"   { ENDIA }
  | "SAR"     { SAR }
  | "SA"      { SA }
  | "SE"      { SE }
  | "SO"      { SO }
  | "DIRY"    { DIRY }
  | "LE"      { LE }
  | "LEE"     { LEE }
  | "RARY"    { RARY }
  | "ARY"     { ARY }
  | "LO"      { LO }

  (* Variables *)
  | alpha+ 'A'
    { MAR (Lexing.lexeme lexbuf) }

  | alpha+
    { MARENDY (Lexing.lexeme lexbuf) }
  
  (* Control *)
  | eof       { EOF }

  (* Ignore spaces *)
  | space+    { token lexbuf }

  (* Unexpected cases *)
  | _
    {
      let pos_start = Lexing.lexeme_start_p lexbuf 
      and pos_end   = Lexing.lexeme_end_p lexbuf
      in
      let message = Printf.sprintf
        "Line %d, characters %d-%d: unknown token %s."
        (pos_start.pos_lnum)
        (pos_start.pos_cnum)
        (pos_end.pos_cnum)
        (Lexing.lexeme lexbuf)
      in
      failwith message
    }