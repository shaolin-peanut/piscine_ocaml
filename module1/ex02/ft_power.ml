let rec ft_power x n =
  if n = 0 then 1
  else if n = 1 then x
  else x * ft_power x (n - 1)

let () =
  ft_power 2 4 |> string_of_int |> print_endline;
  ft_power 3 0 |> string_of_int |> print_endline;
  ft_power 0 5 |> string_of_int |> print_endline