let rec iter f x n =
  if n < 0 then -1
  else if n = 0 then x
  else iter f (f x) (n - 1)

let () =
  List.iter ( fun n ->
    iter (fun x -> x + 1) 0 n |> string_of_int |> print_endline)
    [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10];

  assert (iter (fun x -> x * x) 2 4 = 65536);
  assert (iter (fun x -> x * 2) 2 4 = 32)