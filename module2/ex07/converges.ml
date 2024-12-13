let rec converges f x n =
  if n < 0 then
    false
  else if (f x) = x then
    true
  else
    converges f (f x) (n - 1)

let () =
    assert (converges (( * ) 2) 2 5 = false);
    assert (converges (fun x -> x / 2) 2 3 = true);
    assert (converges (fun x -> x / 2) 2 2 = true);
    