(* 
open Ast
let rec step (e: expr) (m: storable_value array) : ast * storable_value 
  match e with
  | Num _ | Id _ | Bool _ | Unit | Adress ->
    raise NoRuleApplies
  | Binop(bop, e1, e2) -> when (is_value v1) && (is_value v2) ->
    (compute(bop, v1,v2), m)
  | (...)
  | Let(x,t,v1,e2) when is_value v1 ->
    (subs v1 x e2, m)
  | Let(x,t,e1, e2)
  (...)
  | ValueAt e1 ->
    let sv = m.(l) in
    (value_of_storableValue sv, m) (* rotina para pegar a ast do valor na memoria*)
  | Alloc v when is_value v ->  (* new v*)
    let (l,m') = allocate v m in
    (Loc l, m')
  | Atrib(Adress l, v) when is_value v ->
    m.(l) <- storableValue_of_value v;
    (Empty, m)
  | Atrib(e0,e1) ->  (* e0 tem que ser um id, parser obriga isso*)
    let (e1,m') = step e1 m in
    (Atrib(e0,e1'),m')
  |(...)
  | While(e1,e2) -> 
    step (If(e1, Seq(e2, While(e1,e2)), Empty)) m

let rec subs v x e =
  | Num _ | Boool _ | Address _ | Unit -> e0
  | nOT E1 -> nOT (SUBS V X E1)
  | Not e1 -> Not (subs v x e1)
  | Deref e1 -> Deref (subs v x e1)
  | ...
  | Atrib(Id y, e1) when x = y -> Atrib (v, subs v x e1)
  | Atrib(e0,e1) -> Atrib (e0, subs v x e1)  (*n precisa fazer substituição de e0 pois será sempre um id*)
  | 

let compute(op, v1,v2) =
match op,v1,v2 with
| Or, Bool b1, Bool b2 -> Bool(b1 || b2)
| And, Bool b1, Bool b2 -> Bool(b1 && b2)
| (...)
| _ -> failwith "erro no typechecking, deixou permitir operandos de tipos errados" (*failwith sinaliza problema na implementação*)

let rec evalst e m =
  try
    let (e', m') = step e m
    in evalst e' m'
  with
    NoRuleApplies ->
      if is_value e then e else failwith "erro no typechecker ou no step" *)