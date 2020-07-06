(* aria.ml
 * (C) 2020 iExploder
 * This code is licensed under MIT license (see LICENSE for details)
 *)
open Syntax
open Lexer
open Parser

let parse x = Parser.main Lexer.token (Lexing.from_channel x)
let exec = Syntax.eval_walre

let () = 
  if Array.length Sys.argv <> 2 then
  print_string "Usage: aria <filename>\n"
  else
  let ch = open_in Sys.argv.(1) in 
  exec @@ parse ch;
  close_in ch
