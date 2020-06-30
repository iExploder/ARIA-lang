open Syntax
module AriaTiraEN = AriaTira(AriaLeasEN)
open AriaTiraEN
let expr0 = Iry2 (Add, (Oria 1.5, Iry1(Yuery, Oria 2.0)))
let expr0_eval = eval expr0