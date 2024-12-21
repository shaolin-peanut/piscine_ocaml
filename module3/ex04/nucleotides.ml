type phosphate = string
type deoxyribose = string

(* this is a variant,
like enums in c but without a direct mapping to int
each variation can be used as a constructor or to pattern match *)
type nucleobase = A | C | G | T | None

(* this is a record, like a struct in c *)
type nucleotide = {
  base: nucleobase;
  phosphate: phosphate;
  deoxyribose: deoxyribose;
}

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

let print_nucleotide nucleotide =
  Printf.printf "Base: %c\n" (match nucleotide.base with
    | A -> 'a'
    | C -> 'c'
    | G -> 'g'
    | T -> 't'
    | None -> 'n'
  );
  Printf.printf "Phosphate: %s\n" nucleotide.phosphate;
  Printf.printf "Deoxyribose: %s\n" nucleotide.deoxyribose

let () =
  let nucleotide = generate_nucleotide 'a' in
  print_nucleotide nucleotide 