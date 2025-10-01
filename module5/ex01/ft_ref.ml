type 'a ft_ref = { mutable contents : 'a }

let return x = { contents = x }

let get r = r.contents
 
let set r x = r.contents <- x

let bind r f : 'b ft_ref = 
  set r @@ f r.contents;
  r

let () =
  let test_ref = return 5 in
  Printf.printf "Printing the content of test_ref, an int: %d\n" @@ get test_ref;
  let initial_ref = return 1 in
  Printf.printf "Inital ref2 value: %d\n" @@ get initial_ref;
  let () = set initial_ref 25 in
  Printf.printf "Changed ref2 value: %d\n" @@ get initial_ref;
  let timestwo x = x * 2 in
  let bind_result = bind initial_ref timestwo in
  Printf.printf "initial_ref with timestwo function applied to its content: %d\n" @@ get bind_result
