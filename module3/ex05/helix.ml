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
      let base = choose_random_base Random.int 4 in
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

