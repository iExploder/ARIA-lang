module type AriaLeas = sig
  val typ_oria : string
  val typ_tira : string 
  val typ_aria : string
  val unexp_type : string -> string -> string
end

module AriaLeasEN : AriaLeas = struct
  open Printf
  let typ_oria = "ORIA(Number)"
  let typ_tira = "TIRA(Boolean)"
  let typ_aria = "ARIA(String)"
  let unexp_type = fun a b -> 
    sprintf "This expression has type %s but an expression was expected to have type %s."
    a b
end