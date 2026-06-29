(* type storable_value = 
  | Ast (*um valor , pode ser um int, bool, unit ou um ponteiro guardando o index de outro slot de memoria*)
  | MEmpty 


let mem_size = 10

let memory : storable_value array = Array.make mem_size 


let value_of_storableValue
(...)

let storableValue_of_value
(...)

let allocate 
(...) *)