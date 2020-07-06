(* leas.ml
 * (C) 2020 iExploder
 * This code is licensed under MIT license (see LICENSE for details)
 *)

open Printf
let typ_loria = "LORIA(Void)"
let typ_oria = "ORIA(Number)"
let typ_tira = "TIRA(Boolean)"
let typ_aria = "ARIA(String)"
let unexp_type = fun a b -> 
    sprintf "This expression has type %s but an expression was expected to have type %s."
    a b
let unexp_undefined = fun v ->
    sprintf "NELWELD(Variable) %s is undefined." v
let unexp_defined = fun v ->
    sprintf "NELWELD(Variable) %s is already declared." v
let unexp_noreturn = 
    "No WEL FIRK(Return) in ENDY(Function)."
let warn_lee =
    "Warning: Impolite usage of LEE."