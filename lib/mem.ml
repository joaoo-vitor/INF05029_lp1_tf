open Ast

type storable_value = 
  | Expr of expr (*um valor , pode ser um int, bool, unit ou um ponteiro guardando o index de outro slot de memoria*)
  (*aqui dizemos que é do tipo expr, mas na verdade pela semantica só pode ser um valor*)
  | MEmpty (*ou uma memoria vazia*)


let mem_size = 10
let memory : storable_value array = Array.make mem_size MEmpty

exception MemoryFull

let storableValue_of_value (v: expr) : storable_value=
  Expr v

let value_of_storableValue (sv: storable_value) : expr=
  match sv with
  | MEmpty -> failwith "usuario tentou pegar um valor nao alocado, isso nao era pra acontecer"
  | Expr e -> e 

let rec find_empty (m: storable_value array) (i:int) : int=
  if(i>(Array.length m)-1) then raise MemoryFull else
    if m.(i) = MEmpty then i
    else find_empty m (i+1)

let allocate (v: expr) (m: storable_value array): (int * storable_value array)=
  let index = find_empty m 0 in
  m.(index) <- Expr v;
  (index, m)



