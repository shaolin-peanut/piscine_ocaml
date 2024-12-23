type phosphate = string
type deoxyribose = string

type nucleobase = A | C | G | T | U | None

type nucleotide = {
  base: nucleobase;
  phosphate: phosphate;
  deoxyribose: deoxyribose;
}

type helix = nucleotide list
type rna = nucleotide list

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
        | U -> "U" ^ loop t
        | None-> loop t
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
        | None | U -> loop t
  in
  loop helix 


let generate_rna (helix : helix) : rna =
  let rec loop = function
    | [] -> []
    | h :: t ->
        match h.base with
        | A -> { h with base = U } :: loop t
        | C -> { h with base = G } :: loop t
        | G -> { h with base = C } :: loop t
        | T -> { h with base = A } :: loop t
        | None | U -> loop t
  in
  loop helix

let test_generate_rna () =
  let helix1 = [
    { base = A; phosphate = "p"; deoxyribose = "d" };
    { base = T; phosphate = "p"; deoxyribose = "d" };
    { base = C; phosphate = "p"; deoxyribose = "d" };
    { base = G; phosphate = "p"; deoxyribose = "d" };
    { base = None; phosphate = "p"; deoxyribose = "d" };
  ] in

  let rna1 = generate_rna helix1 in
  let rna1_str = helix_to_string rna1 in

  Printf.printf "Test 1:\n";
  Printf.printf "  Input Helix: %s\n" (helix_to_string helix1);
  Printf.printf "  Output RNA:  %s\n" rna1_str;
  Printf.printf "  Expected: 'UAGC'\n";

  let helix2 = [] in
  let rna2 = generate_rna helix2 in
  Printf.printf "\nTest 2:\n";
  Printf.printf "  Input Helix: (empty)\n";
  Printf.printf "  Output RNA:  %s\n" (helix_to_string rna2);


  let helix3 = [
    { base = T; phosphate = "p"; deoxyribose = "d" };
    { base = T; phosphate = "p"; deoxyribose = "d" };
    { base = A; phosphate = "p"; deoxyribose = "d" };
  ] in

  let rna3 = generate_rna helix3 in
  let rna3_str = helix_to_string rna3 in

  Printf.printf "\nTest 3:\n";
  Printf.printf "  Input Helix: %s\n" (helix_to_string helix3);
  Printf.printf "  Output RNA:  %s\n" rna3_str;
  Printf.printf "  Expected: 'U A G C'\n"
;;

let () = test_generate_rna ()