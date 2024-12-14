(* not tail recursive ... *)
(* let fibonacci n =
  let rec fibonacci_acc n acc =
    if n = 0 then 0
    else if n = 1 then 1
    else
      fibonacci_acc (n - 2) acc + fibonacci_acc (n - 1) acc
    in
  if n < 0 then
    -1
  else
    fibonacci_acc n 0 *)

let fibonacci n =
  let rec fibonacci_acc n current next =
    if n = 0 then current
    else fibonacci_acc (n - 1) next (current + next)
  in
  if n < 0 then
    -1
  else
    fibonacci_acc n 0 1


let () = (
  List.iter ( fun n ->
    print_string @@ "[" ^ (string_of_int n) ^ "]: ";
    fibonacci n |> string_of_int |> print_endline)
    [(-42); 0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 50];
  
  assert (fibonacci 0 = 0);
  assert (fibonacci 1 = 1);
  assert (fibonacci 2 = 1);
  assert (fibonacci 3 = 2);
  assert (fibonacci 4 = 3);
  assert (fibonacci 5 = 5);
  assert (fibonacci 6 = 8);
  assert (fibonacci 7 = 13);
  assert (fibonacci 8 = 21);
  assert (fibonacci 9 = 34);
  assert (fibonacci 10 = 55);
  assert (fibonacci 11 = 89);
  assert (fibonacci 12 = 144);
  assert (fibonacci 13 = 233);
  assert (fibonacci 14 = 377);
  assert (fibonacci 15 = 610);
  assert (fibonacci 16 = 987);
  assert (fibonacci 17 = 1597);
  assert (fibonacci 18 = 2584);
  assert (fibonacci 19 = 4181);
  assert (fibonacci 50 = 12586269025)
)