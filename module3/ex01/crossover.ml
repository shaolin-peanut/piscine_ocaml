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


let red = "\027[31m"
let green = "\027[32m"
let yellow = "\027[33m"
let blue = "\027[34m"
let magenta = "\027[35m"
let cyan = "\027[36m"
let reset = "\027[0m"


let () =
  (* ANSI escape codes for colors *)
  let red_start = "\027[31m" in
  let reset = "\027[0m" in

  let highlight_elements lst highlights =
    List.map
      (fun x ->
        if List.mem x highlights then
          red_start ^ string_of_int x ^ reset
        else
          string_of_int x)
      lst
    |> String.concat "; "
  in

  let print_test_case lsta lstb =
    (* Compute the crossover result *)
    let lstc = crossover lsta lstb in
    (* Prepare highlighted input lists *)
    let highlighted_a = highlight_elements lsta lstc in
    let highlighted_b = highlight_elements lstb lstc in
    (* Print input and result *)
    Printf.printf "Input List A: [%s]\n" highlighted_a;
    Printf.printf "Input List B: [%s]\n" highlighted_b;
    Printf.printf "Crossover Result: [%s]\n" (String.concat "; " (List.map string_of_int lstc));
    Printf.printf "------------------ \n";
  in

  (* List of test cases *)
  let test_cases = [
    ([1; 2; 3; 4; 5], [6; 7; 1; 9; 3]);
    ([10; 20; 30], [30; 20; 10]);
    ([1; 3; 5; 7], [2; 4; 6; 8]);
    ([], [1; 2; 3]);
    ([1; 2; 3], []);
    ([1; 1; 2; 3], [3; 3; 1; 4]);
    ([1; 2; 3], [1; 2; 3]);
    ([1; 2; 3], [1; 2; 3; 4]);
    ([1; 2; 3], [4; 5; 6; 7]);
    ([1; 2; 3], [4; 5; 6; 7; 8]);
  ] in
  (* Run all test cases *)
  List.iter (fun (lsta, lstb) -> print_test_case lsta lstb) test_cases;
