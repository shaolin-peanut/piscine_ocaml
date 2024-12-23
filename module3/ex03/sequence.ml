(** [encode] does run-length encoding on a list of ints *)
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
      | h :: t -> helper t (h, 1)

(** [flatten] flattens a list of tuples into a list of the contents of the tuples *)
let rec flatten lst =
  match lst with
  | [] -> []
  | (elem, count) :: t ->
    elem :: count :: flatten t

let sequence n =
  if n = 0 then ""
  else if n = 1 then "1"
  else
    let rec rle_to_string lst =
      match lst with
      | [] -> ""
      | (count, elem) :: t ->
        let str = (string_of_int elem) ^ (string_of_int count) in
        (rle_to_string t) ^ str
    in
    let rec loop n =
      if n = 2 then [1, 1]
      else
        let lst = loop (n - 1) in
        lst |> flatten |> encode
    in
    n |> loop |> rle_to_string
    (* rle_to_string (loop n) *)

let () =
    let test_cases = [
      (1, "1");
      (2, "11");
      (3, "21");
      (4, "1211");
      (5, "111221");
      (6, "312211")
    ] in
    List.iter (fun (n, result) ->
      print_endline @@ (string_of_int n) ^ " Output: " ^ (sequence n);
      (* print_endline @@ "Expected: " ^ result; *)
    ) test_cases

(* this one was difficult
The choice of data structures is important
Basically the baseline is always lists
We analyze the previous sequence as a list of ints,
by running run-length encoding on it which produces a list of tuples
Which we then flatten to a list of ints to either return from the recursive call,
or convert to a string if n is reached

The algorithmic complexity is probably horrendous, bit tricky to think through it
*)