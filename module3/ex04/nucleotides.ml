type phosphate = string
type deoxyribose = string

(* this is a variant,
like enums in c but without a direct mapping to int
each variation can be used as a constructor or to pattern match *)
type nucleobase = A | C | G | T | None

(* this is a record, like a struct in c,
where you can have labeled fields of different types *)
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
  let base_char =
    match nucleotide.base with
    | A -> 'a'
    | C -> 'c'
    | G -> 'g'
    | T -> 't'
    | None -> 'n'
  in
  print_endline @@ "Base: " ^ String.make 1 base_char

let () =
  (* Utility for printing a nucleotide nicely *)
  (* let pretty_print_nucleotide nucleotide =
    Printf.printf "Nucleotide: { Base: %c; Phosphate: %s; Deoxyribose: %s }\n"
      (match nucleotide.base with
       | A -> 'A'
       | C -> 'C'
       | G -> 'G'
       | T -> 'T'
       | None -> 'N')
      nucleotide.phosphate
      nucleotide.deoxyribose
  in *)

  (* Utility for testing a single case *)
  let test_case input expected_base =
    Printf.printf "\nTest Case: Input '%c'\n" input;
    let nucleotide = generate_nucleotide input in
    print_nucleotide nucleotide;
    Printf.printf "Expected Base: %c | Actual Base: %c\n"
      (match expected_base with
       | A -> 'A'
       | C -> 'C'
       | G -> 'G'
       | T -> 'T'
       | None -> 'N')
      (match nucleotide.base with
       | A -> 'A'
       | C -> 'C'
       | G -> 'G'
       | T -> 'T'
       | None -> 'N');
    Printf.printf "-------------------------\n"
  in

  (* Edge cases and normal cases to test *)
  let test_cases = [
    ('a', A);
    ('c', C);
    ('g', G);
    ('t', T);
    ('x', None);  (* Invalid base *)
    ('1', None);  (* Non-alphabetic input *)
    ('n', None);  (* Ambiguous/unknown input *)
    ('A', None);  (* Test case sensitivity *)
  ] in

  (* Run all test cases *)
  List.iter (fun (input, expected) -> test_case input expected) test_cases;
