
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
  | Add  | Sub  | Mul  | Div  | Mod
  | Gr   | GrEq | Le   | LeEq  
  | Eq
  | And  | Or
  | Con (* For Strings *)

  type tin  = (* Expression *)
  | Loria (* VOID *)
  | Oria of oria
  | Tira of tira
  | Aria of aria
  | Iry1 of iry1 * tin
  | Iry2 of iry2 * (tin * tin)
  | Nelweld of mar
  | WiryEndy of mar * (mar * tin) list


  type walre = (* Statement *)
  (* Declaration *)
  | Hory of mar * tin
  (* Assignment *)
  | Qurely of mar * tin
  (* If-Else *)
  | RarySyua of tin * walre * walre
  (* While-Loop *)
  | EndiaWhile of tin * walre
  (* Break! *)
  | Diry
  (* A Bunch of Walre(d) *)
  | Walred of walre list
  | HoryEndy of mar * mar list * walre
  (* Return *)
  | WelFirk of tin
  | Ary of tin

  exception ARIADiry
  exception ARIAWelFirk of tin

  let seld = true
  let nelseld = false

  type tindharia = (mar * tin nelweld) list ref list ref
  let tindharia : tindharia = ref [ref []]

  type endy = mar * mar list * walre
  type endiad = endy list ref
  let endiad : endiad = ref []

  let hory_endy : mar * mar list * walre -> unit =
  fun fx ->
  endiad := fx :: (!endiad) 
  let wasry_endy : mar * mar list -> endy =
  fun (m, ml) ->
  List.find (fun (m', ml', _) -> (m=m') && (ml=ml')) !endiad

  let wasry : mar -> tin nelweld =
    fun mar ->
    let rec rory : (mar * tin nelweld) list ref list -> tin nelweld =
    function
    | [] -> raise Not_found
    | hd :: tl -> 
        try 
          let (m, tn) = List.find (fun (m_, tn_) -> mar = m_) (!hd)
          in tn
        with Not_found -> rory tl
    in 
    try rory (!tindharia) 
    with Not_found -> failwith @@ unexp_undefined mar
  
  let qurely : mar -> tin -> unit =
    fun mar tin ->
    (wasry mar) := tin
  
  let hory : mar -> tin -> unit = fun mar t ->
    let top_list = List.hd (!tindharia) in
    if List.exists (fun (m,t) -> (=) m mar) !top_list
    then failwith @@ unexp_defined mar
    else top_list := (mar, ref t) :: (!top_list)

  let rec eval : tin -> tin = fun tin ->
    match tin with
    | Loria   -> tin
    | Oria(v) -> tin
    | Tira(v) -> tin
    | Aria(v) -> tin
    | Iry1(o,v) -> iry1 o v
    | Iry2(o,(l,r)) -> iry2 o l r
    | Nelweld(mar) -> eval @@ !(wasry mar)
    | WiryEndy(m, p) ->
        let params = List.map (fun (a,b) -> (a, ref @@ eval b)) p in
        let param_mard = fst @@ List.split params in
        let (_,_,endy) = wasry_endy (m,param_mard) in
        (* PUSH Parameters into TINDHARIA Stack *)
        tindharia := ref params :: (!tindharia);
        try
          eval_walre endy;
          failwith unexp_noreturn
        with ARIAWelFirk(t) -> tindharia := List.tl (!tindharia);t
          

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
    let iry2_ooo = 
      fun op l r -> 
      Oria(op (assert_oria (eval l))  (assert_oria (eval r)))
    in
    let iry2_oot = 
      fun op l r -> 
      Tira(op (assert_oria (eval l))  (assert_oria (eval r)))
    in
    let iry2_ttt = 
      fun op l r -> 
      Tira(op (assert_tira (eval l))  (assert_tira (eval r)))
    in
    let iry2_aaa = 
      fun op l r -> 
      Aria(op (assert_aria (eval l))  (assert_aria (eval r)))
    in    
    match o with
    | Add  -> iry2_ooo ( +. ) l r
    | Sub  -> iry2_ooo ( -. ) l r
    | Mul  -> iry2_ooo ( *. ) l r
    | Div  -> iry2_ooo ( /. ) l r
    | Mod  -> iry2_ooo mod_float l r
    | Gr   -> iry2_oot ( >  ) l r
    | GrEq -> iry2_oot ( >= ) l r
    | Le   -> iry2_oot ( <  ) l r
    | LeEq -> iry2_oot ( <= ) l r
    | Eq   -> Tira((eval l) = (eval r))
    | And  -> iry2_ttt ( && ) l r
    | Or   -> iry2_ttt ( || ) l r
    | Con  -> iry2_aaa ( ^  ) l r
  and eval_walre : walre -> unit = function
  | Hory(name, tin) -> hory name (eval tin)
  | Qurely(name, tin) -> qurely name (eval tin)
  | RarySyua(cond, walS, walN) -> 
      if assert_tira (eval cond) 
      then eval_walre walS 
      else eval_walre walN

  | EndiaWhile(cond, wal) -> 
    begin
      try
      while assert_tira (eval cond) do
        eval_walre wal
      done
      with
      ARIADiry -> ()
    end
  | Diry -> raise ARIADiry
  | Walred(walList) -> List.iter eval_walre walList
  | HoryEndy(m,ml,w) -> hory_endy (m,ml,w)
  | WelFirk(t) -> raise (ARIAWelFirk (eval t))
  | Ary(t) -> ary (eval t)
  and ary : tin -> unit =
  fun t -> 
    match eval t with
    | Loria   -> ()
    | Oria(v) -> print_float v
    | Tira(v) -> if v then print_string "SELD" else print_string "NELSELD"
    | Aria(v) -> print_string v
    | _ -> failwith "Should not happen"

