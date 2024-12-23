type phosphate = string
type deoxyribose = string

type nucleobase = A | C | G | T | None

type nucleotide = {
  base: nucleobase;
  phosphate: phosphate;
  deoxyribose: deoxyribose;
}

type helix = nucleotide list

let generate_nucleotide base =
  let choose_base = function
    | 'a' -> A
    | 'c' -> C
    | 'g' -> G
    | 't' -> T
    | _ -> None
  in
  {
    base = choose_base base;
    phosphate = "phosphate";
    deoxyribose = "deoxyribose"
  }

let generate_helix (n : int) : helix =
  let choose_random_base = function
    | 0 -> 'a'
    | 1 -> 'c'
    | 2 -> 'g'
    | 3 -> 't'
    | _ -> 'n'
  in
  let rec loop n =
    if n = 0 then []
    else
      let base = choose_random_base @@ Random.int 4 in
      generate_nucleotide base :: loop (n - 1)
  in
  loop n

let helix_to_string (helix : helix) =
  let rec loop = function
  | [] -> ""
  | h :: t ->
    match h.base with
    | A -> "A" ^ loop t
    | C -> "C" ^ loop t
    | G -> "G" ^ loop t
    | T -> "T" ^ loop t
    | None -> loop t
  in
  loop helix

let complementary_helix (helix : helix) : helix =
  let rec loop = function
  | [] -> []
  | h :: t ->
    match h.base with
    | A -> { h with base = T } :: loop t
    | C -> { h with base = G } :: loop t
    | G -> { h with base = C } :: loop t
    | T -> { h with base = A } :: loop t
    | None -> loop t
  in
  loop helix

let () =
  Random.self_init (); (* Initialize random seed for `generate_helix` *)

  (* Utility for printing helix content *)
  let pretty_print_helix helix =
    Printf.printf "Helix: [%s]\n" (helix_to_string helix)
  in

  (* Test Case 1: Generate helix of length 5 *)
  let helix_5 = generate_helix 5 in
  Printf.printf "Test Case 1: Generate Helix Length 5\n";
  pretty_print_helix helix_5;
  Printf.printf "Length: %d | Expected: 5\n" (List.length helix_5);
  Printf.printf "-------------------------\n";

  (* Test Case 2: Empty helix *)
  let helix_empty = generate_helix 0 in
  Printf.printf "Test Case 2: Empty Helix\n";
  pretty_print_helix helix_empty;
  Printf.printf "Length: %d | Expected: 0\n" (List.length helix_empty);
  Printf.printf "-------------------------\n";

  (* Test Case 3: Complementary helix *)
  let helix_complement = complementary_helix helix_5 in
  Printf.printf "Test Case 3: Complementary Helix\n";
  Printf.printf "Original ";
  pretty_print_helix helix_5;
  Printf.printf "Complement ";
  pretty_print_helix helix_complement;
  Printf.printf "-------------------------\n";

  (* Test Case 4: Helix-to-string accuracy *)
  let test_helix = [
    { base = A; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
    { base = C; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
    { base = G; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
    { base = T; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
  ] in
  Printf.printf "Test Case 4: Helix to String\n";
  pretty_print_helix test_helix;
  Printf.printf "Expected: ACGT\n";
  Printf.printf "-------------------------\n";

  (* Test Case 5: Complementary helix with None *)
  let helix_with_none = [
    { base = A; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
    { base = None; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
    { base = C; phosphate = "phosphate"; deoxyribose = "deoxyribose" };
  ] in
  let complementary_with_none = complementary_helix helix_with_none in
  Printf.printf "Test Case 5: Complementary Helix with None Base\n";
  Printf.printf "Original ";
  pretty_print_helix helix_with_none;
  Printf.printf "Complement ";
  pretty_print_helix complementary_with_none;
  Printf.printf "Expected: TG\n";
  Printf.printf "-------------------------\n";
