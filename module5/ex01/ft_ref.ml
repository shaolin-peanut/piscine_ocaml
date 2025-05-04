type 'a ft_ref = { mutable contents : 'a }

let return x = { contents = x }

let get r = r.contents
 
let set r x = r.contents = x

(* let bind (r : 'a ft_ref) f : 'a ft_ref = f r.contents *)

let bind r f : 'b ft_ref = f r.contents