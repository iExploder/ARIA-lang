(* OCaml type aliases *)
type oria = float
type tira = bool
type aria = string
type mar = string

(* WELD: Literal *)
type weld = 
| Oria of oria
| Tira of tira
| Aria of aria

(* NELWELD: Variable *)
type nelweld = weld ref

type tindharia = (string * nelweld) list

type iry1 =
| Nel

type iry2 =
| Add
| Sub
| Mul
| Div
| Mod
| Con

type expr_type =
| OriaT
| TiraT
| AriaT
| EndyT of expr_type list

type expr =
| Weld of weld
| Nelweld of nelweld
| Iry1 of iry1 * expr
| Iry2 of iry2 * expr * expr

type stmt =
| HoryNelweld of mar * expr_type
| HoryNelweldFie of mar * expr_type option * expr
| HoryEndy of mar * expr_type list * 

let tindharia = []

