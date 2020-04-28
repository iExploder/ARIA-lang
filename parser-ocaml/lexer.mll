{
open Parser
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let alpha = ['A'-'Z' 'a'-'z' '_']


rule token = parse
  | digit+ '.' digit+
    { let str = Lexing.lexeme lexbuf in
      NUM (float_of_string str) }
  | '"' ([^'"''\\'] | '\\'['\x00'-'\xff'])+ '"' {
    let lexeme = Bytes.sub_string
      lexbuf.lex_buffer
      (lexbuf.lex_start_pos + 1)
      (lexbuf.lex_curr_pos - lexbuf.lex_start_pos - 2) in
    STRING(Scanf.unescaped lexeme)
  }

  (* Operators *)
  | '+'           { PLUS }
  | '-'           { MINUS }
  | '*'           { ASTERISK }
  | '/'           { SLASH }
  | '%'           { PERCENT }

  (* Delimiters *)
  | '.'           { FULLSTOP }
  | ','           { COMMA }

  (* Reserved words *)
  | "ARIA"        { ARIA }
  | "ARS"         { ARS }
  | "DIRY"        { DIRY }
  | "ENDIA"       { ENDIA }
  | "FIE"         { FIE }
  | "FEL"         { FEL }
  | "FIRK"        { FIRK }
  | "FIRY"        { FIRY }
  | "HORK"        { HORK }
  | "HORY"        { HORY }
  | "LAWARY"      { LAWARY }
  | "LEE"         { LEE }  
  | "LE"          { LE }
  | "LU"          { LU }
  | "NEL"         { NEL }
  | "NEN"         { NEN }
  | "ORIA"        { ORIA }
  | "QURELY"      { QURELY }
  | "SA"          { SA }
  | "SE"          { SE }
  | "SIE"         { SIE }
  | "SYUA"        { SYUA }
  | "TAS"         { TAS }
  | "TIRA"        { TIRA }
  | "WEL"         { WEL }
  | "WIRY"        { WIRY }

  (* Variables *)
  | alpha+ 'A'
    { VAR (Lexing.lexeme lexbuf) }
  
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