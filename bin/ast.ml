(* ast.ml *)

type typ =
  | TInt
  | TBool
  | TUnit 
  | TRef of typ
  
type bop =
  | Plus | Minus | Times | Div
  | And | Or
  | Eq | Lt | Gt 

type expr =
  | Int of int
  | Bool of bool
  | Id of string
  | If of expr * expr * expr
  | ValueAt of expr (* !e *)
  | Alloc of expr (* new e *)
  | While of expr * expr
  | Let of string * typ * expr * expr
  | Atrib of string * expr
  | Binop of bop * expr * expr
  | Sentence of expr * expr (* e1;e2 *)
  | Empty (* () *)
  | Address (* l *)

  
