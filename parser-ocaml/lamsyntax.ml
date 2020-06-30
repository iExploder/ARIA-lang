module type ARIASyntax = sig
  (* OCaml type aliases *)
  type oria = float
  type tira = bool
  type aria = string
  type mar = string

  type 'a repr

  val oria : oria -> oria repr
  val tira : tira -> tira repr
  val aria : aria -> aria repr

  val lam : ('a repr -> 'b repr) -> ('a -> 'b) repr
  val app : ('a -> 'b) repr -> 'a repr -> 'b repr
  val add : oria repr -> oria repr -> oria repr
  val sub : oria repr -> oria repr -> oria repr
  val mul : oria repr -> oria repr -> oria repr
  val div : oria repr -> oria repr -> oria repr
  val modf : oria repr -> oria repr -> oria repr

  val andb : tira repr -> tira repr -> tira repr
  val orb : tira repr -> tira repr -> tira repr
  val notb : tira repr -> tira repr

  val 

end