open Syntax
open Lexer
open Parser

let read_whole_file fn =
  let ch = open_in fn in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let parse x = Parser.main Lexer.token (Lexing.from_string x)

let exec = Syntax.eval_walre

let () = 
  if Array.length Sys.argv <> 2 then
  print_string "Usage: aria <filename>\n"
  else
  let script = read_whole_file Sys.argv.(1) in 
  exec @@ parse script
