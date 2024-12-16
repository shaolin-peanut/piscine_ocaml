(* O(n^2) time complexity because of list rebuilding and reversal needed in main *)
(* let encode lst =
  let rec helper lst acc =
    match lst with
    | [] -> acc
    | h :: t -> begin
      match acc with
      | [] -> helper t [(h, 1)]
      | (elem, count) :: acc_t ->
        if h = elem then
          helper t ((elem, count + 1) :: acc_t)
        else
          helper t ((h, 1) :: acc)
    end
  in
  helper lst [] *)


(* 0(n) time complexity *)
let encode lst =
  let rec helper lst run =
    match lst, run with
    | [], (elem, count) -> [(elem, count)]
    | h :: t, (elem, count) -> begin
      if h = elem then
        helper t (elem, count + 1)
      else
        (elem, count) :: helper t (h, 1)
      end
    in
    match lst with
    | [] -> []
    | h :: t ->
      helper t (h, 1)

let print_result lst result =
  Printf.printf "Input: %s\n" (String.concat "" (List.map (String.make 1) lst));
  Printf.printf "Output:";
  List.iter (fun (el, count) ->
    Printf.printf "%c%d" el count
  ) result;
  Printf.printf "\n"

let () =
  let test_cases = [
    ['a'; 'a'; 'a'; 'a'; 'b'; 'b'; 'b'];                (* Simple repeated characters *)
    ['x'; 'y'; 'z'; 'z'; 'z'; 'x'; 'x'; 'x'];           (* Mixed characters *)
    ['c'; 'c'; 'c'; 'c'; 'c'];                          (* Single repeated character *)
    ['a'; 'b'; 'c'; 'd'; 'e'];                          (* No repetition *)
    ['q'; 'q'; 'r'; 'r'; 'r'; 's'; 's'; 'q'];           (* More complex sequence *)
    []                                                  (* Empty list *)
  ] in
  List.iter (fun lst ->
    let result = encode lst in
    print_result lst result
  ) test_cases
