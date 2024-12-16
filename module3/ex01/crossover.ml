let crossover lsta lstb =
  let rec exists elem lst =
    match lst with
    | [] -> false
    | h :: t -> if elem = h then true
    else exists elem t
  in
  let rec inter lst acc =
    match lst with
    | [] -> acc
    | h :: t ->
      if exists h lstb && not (exists h acc) then
        inter t (h :: acc)
      else
        inter t acc
      in
  if lsta = [] || lstb = [] then []
  else inter lsta []

let () =
  let lsta = [1; 2; 3; 4; 5] in
  let lstb = [6; 7; 1; 9; 3] in
  let lstc = crossover lsta lstb in
  List.iter (fun el -> print_endline (string_of_int el)) lstc;