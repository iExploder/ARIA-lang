
let decl (v:string) (t)

let add_ a b = 

(* NELWELD: Variable *)
type 't nelweld =
| Oria : oria -> oria nelweld
| Tira : tira -> tira nelweld
| Aria : aria -> aria nelweld

(* TINDHARIA: Variable Table *)
type _ tindharia =
| Neltin : unit tindharia
| Sa     : ('t nelweld) * ('any tindharia)
            -> ('t nelweld * 'any) tindharia

(* WELD: Literals *)
let oria_ (n: oria) = n
let tira_ (b: tira) = b
let aria_ (s: aria) = s

(* IRY: Operations *)
let add_ (a: oria) (b: oria) = Pervasives.( +. )
let sub_ (a: oria) (b: oria) = Pervasives.( -. )
let mul_ (a: oria) (b: oria) = Pervasives.( *. )
let div_ (a: oria) (b: oria) = Pervasives.( /. )
let mod_ (a: oria) (b: oria) = Pervasives.mod_float

let tindharia_ : unit tindharia = Neltin

let find_tdr_ : type a . type b . (a tindharia -> string -> b nelweld) =
fun t k ->
match
let cmd_decl ()