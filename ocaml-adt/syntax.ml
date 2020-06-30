module type AriaLeas = sig
  val typ_loria : string
  val typ_oria : string
  val typ_tira : string 
  val typ_aria : string
  val unexp_type : string -> string -> string
end

module AriaLeasEN : AriaLeas = struct
  open Printf
  let typ_loria = "LORIA(Void)"
  let typ_oria = "ORIA(Number)"
  let typ_tira = "TIRA(Boolean)"
  let typ_aria = "ARIA(String)"
  let unexp_type = fun a b -> 
    sprintf "This expression has type %s but an expression was expected to have type %s."
    a b
end

module AriaTira(Leas : AriaLeas) = struct
  open Leas
  type oria = float
  type tira = bool
  type aria = string
  type mar = string

  type 'a nelweld = 'a ref

  type iry1 = 
  | Yuery
  | Wory
  | Minus
  | Nel

  type iry2 = 
  | Add
  | Sub
  | Mul
  | Div
  | Gr
  | GrEq
  | Le
  | LeEq
  | Eq
  | And
  | Or
  | Con (* For Strings *)

  type tin  = (* Expression *)
  | Loria (* VOID *)
  | Oria of oria
  | Tira of tira
  | Aria of aria
  | Iry1 of iry1 * tin
  | Iry2 of iry2 * (tin * tin)


  type walre = (* Statement *)
  (* Declaration *)
  | Holy of mar * tin
  (* If-Else *)
  | SieSyua of tin * walre * walre
  (* While-Loop *)
  | EndiaWhile of tin * walre
  (* Break Time! *)
  | Diry
  (* A Bunch of Walre(d) *)
  | Walred of walre list

  let seld = true
  let nelseld = false

  let rec eval : tin -> tin = fun tin ->
    match tin with
    | Loria   -> tin
    | Oria(v) -> tin
    | Tira(v) -> tin
    | Aria(v) -> tin
    | Iry1(o,v) -> iry1 o v
    | Iry2(o,(l,r)) -> iry2 o l r
  and typename : tin -> mar = 
  fun tin -> match eval tin with
    | Loria   -> typ_loria
    | Oria(_) -> typ_oria
    | Tira(_) -> typ_tira
    | Aria(_) -> typ_aria
    | _ -> failwith "Assertion: Should not happen."
  and assert_oria : tin -> oria = 
  fun tin -> match eval tin with
    | Oria(o) -> o
    | _ -> failwith @@ unexp_type (typename tin) typ_oria
  and assert_tira : tin -> tira = 
  fun tin -> match eval tin with
    | Tira(t) -> t
    | _ -> failwith @@ unexp_type (typename tin) typ_tira
  and assert_aria : tin -> aria = 
  fun tin -> match eval tin with
    | Aria(a) -> a
    | _ -> failwith @@ unexp_type (typename tin) typ_aria 
  and iry1 : iry1 -> tin -> tin =
  fun o v ->
    match o with
    | Yuery -> Oria(assert_oria (eval v) +. 1.0)
    | Wory  -> Oria(assert_oria (eval v) -. 1.0)
    | Minus -> Oria(-.(assert_oria (eval v)))
    | Nel   -> Tira(not @@ assert_tira (eval v))
  and iry2 : iry2 -> tin -> tin -> tin =
  fun o l r ->
    match o with
    | Add  -> Oria((assert_oria (eval l)) +. (assert_oria (eval r)))
    | Sub  -> Oria((assert_oria (eval l)) -. (assert_oria (eval r)))
    | Mul  -> Oria((assert_oria (eval l)) *. (assert_oria (eval r)))
    | Div  -> Oria((assert_oria (eval l)) /. (assert_oria (eval r)))
    | Gr   -> Tira((assert_oria (eval l)) >  (assert_oria (eval r)))
    | GrEq -> Tira((assert_oria (eval l)) >= (assert_oria (eval r)))
    | Le   -> Tira((assert_oria (eval l)) <  (assert_oria (eval r)))
    | LeEq -> Tira((assert_oria (eval l)) <= (assert_oria (eval r)))
    | Eq   -> Tira((assert_oria (eval l)) =  (assert_oria (eval r)))
    | And  -> Tira((assert_tira (eval l)) && (assert_tira (eval r)))
    | Or   -> Tira((assert_tira (eval l)) || (assert_tira (eval r)))
    | Con  -> Aria((assert_aria (eval l)) ^  (assert_aria (eval r)))
end

module AriaTiraEN = AriaTira(AriaLeasEN)
open AriaTiraEN
let testcase_oria = 
Iry2 (
  Add, (Oria 1.5, Iry1(Yuery, Oria 2.0))
)
let expr0_eval = eval testcase_oria