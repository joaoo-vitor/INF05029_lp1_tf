type typ =
    TInt
  | TBool
  | TRef of typ
  | TUnit

type bop =
    Sum
  | Sub | Mul | Div
  | Eq | Lt| Gt
  | And | Or

type ast = Num of int
         | Bool of bool
         | Binop of bop * ast * ast
         | If of ast * ast * ast
         | Id of string
         | Let of string * typ * ast * ast
         | Asg of string * ast
                  
exception TypeError of string

type typenv = (string * typ) list (* list de ident e tipos*)
let rec type_of (g: typenv) (e: ast): typ =
  match e with
  | Num n -> TInt
  | Bool b -> TBool
  | Binop(bop, e1, e2) ->
      let t1 = type_of g e1 in
      let t2 = type_of g e2 in
      (match bop with
       | Sum | Sub | Mul | Div -> if t1 = TInt && t2 = TInt then TInt
           else raise (TypeError "operações aritmeticas requerem operandos do tipo Int")
       | Eq | Lt | Gt ->
           if t1 = TInt && t2 = TInt then TBool
           else raise (TypeError "operações relacionais requerem operandos do tipo Int")
       | And | Or ->
           if t1 = TBool && t2 = TBool then TBool
           else raise (TypeError "operações booleanas requerem operandos do tipo Bool")
      )
  | If(e1, e2, e3) ->
      if type_of g e1 = TBool then
        let t2 = type_of g e2 in
        let t3 = type_of g e3 in
        if t2 = t3 then t2
        else raise (TypeError "tipos de expressoes then e else devem ser iguais")
      else raise(TypeError "condição do if deve ser do tipo bool")
  | Asg(x, e1) ->
      let _ = type_of g e1 in
      TUnit
  | Id x ->
      (try
         List.assoc x g
       with Not_found -> raise (TypeError ("identificador "^ x ^ "nao foi declarado")))
  | Let(iden, typ, e1, e2) ->
      let _ = type_of g e1 in
      type_of ((iden, typ)::g) e2

