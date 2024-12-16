type occ = char * int

let encode lst =
  match lst with
  | [] -> []
  | _ :: _ ->
    let rec helper lst acc =
      match lst with
      | [] -> acc
      | h :: t ->
        match acc with
        | [] -> helper t [(h, 1)]
        | (elem, count) :: acc_t ->
          if h = elem then
            helper t ((elem, count + 1) :: acc_t)
          else
            helper t ((h, 1) :: (elem, count) :: acc_t)
    in
    helper lst []

let print_result lst result =
  Printf.printf "Input: %s\n" (String.concat "" (List.map (String.make 1) lst));
  Printf.printf "Output:\n";
  List.iter (fun (el, count) ->
    Printf.printf "  %c: %d\n" el count
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
