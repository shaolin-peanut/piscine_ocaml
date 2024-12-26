let test_name name f =
    print_endline ("=== Testing " ^ name ^ " ===");
    f ();
    print_endline ""

let test_ordering () =
    print_endline "Testing basic ordering:";
    let pairs = [
        (Value.T2, Value.T3, "T2 < T3");
        (Value.T9, Value.T10, "T9 < T10");
        (Value.T10, Value.Jack, "T10 < Jack");
        (Value.Jack, Value.Queen, "Jack < Queen");
        (Value.Queen, Value.King, "Queen < King");
        (Value.King, Value.As, "King < As")
    ] in
    List.iter (fun (a, b, msg) ->
        print_endline (msg ^ ": " ^ string_of_bool (a < b))
    ) pairs

let test_toInt () =
    print_endline "Testing toInt (should be 1-13):";
    List.iter (fun card ->
        Printf.printf "%s: %d\n" 
            (Value.toStringVerbose card) 
            (Value.toInt card)
    ) Value.all

let test_all_list () =
    print_endline "Testing all list:";
    Printf.printf "Length is 13: %b\n" (List.length Value.all = 13);
    print_endline "Values (should be ordered from T2 to As):";
    List.iter (fun c -> print_endline (Value.toStringVerbose c)) Value.all

let test_toString () =
    print_endline "Testing toString (should be 2-10,J,Q,K,A):";
    List.iter (fun card ->
        Printf.printf "%s " (Value.toString card)
    ) Value.all;
    print_endline ""

let test_toStringVerbose () =
    print_endline "Testing toStringVerbose:";
    List.iter (fun card ->
        print_endline (Value.toStringVerbose card)
    ) Value.all

let test_next () =
    print_endline "Testing next:";
    let test_next_card card =
        try
            let next = Value.next card in
            Printf.printf "%s -> %s\n" 
                (Value.toStringVerbose card) 
                (Value.toStringVerbose next)
        with Invalid_argument s ->
            Printf.printf "%s -> Invalid_argument: %s\n" 
                (Value.toStringVerbose card) s
    in
    List.iter test_next_card Value.all

let test_previous () =
    print_endline "Testing previous:";
    let test_prev_card card =
        try
            let prev = Value.previous card in
            Printf.printf "%s -> %s\n" 
                (Value.toStringVerbose card) 
                (Value.toStringVerbose prev)
        with Invalid_argument s ->
            Printf.printf "%s -> Invalid_argument: %s\n" 
                (Value.toStringVerbose card) s
    in
    List.iter test_prev_card Value.all

let test_edge_cases () =
    print_endline "Testing edge cases:";
    print_endline "Previous of T2 (should raise Invalid_argument):";
    (try
        let _ = Value.previous Value.T2 in
        print_endline "ERROR: Should have raised Invalid_argument"
    with Invalid_argument _ -> 
        print_endline "OK: Raised Invalid_argument as expected");

    print_endline "\nNext of As (should raise Invalid_argument):";
    (try
        let _ = Value.next Value.As in
        print_endline "ERROR: Should have raised Invalid_argument"
    with Invalid_argument _ -> 
        print_endline "OK: Raised Invalid_argument as expected")

let () =
    test_name "Ordering" test_ordering;
    test_name "Integer conversion" test_toInt;
    test_name "All list" test_all_list;
    test_name "String conversion" test_toString;
    test_name "Verbose string conversion" test_toStringVerbose;
    test_name "Next value" test_next;
    test_name "Previous value" test_previous;
    test_name "Edge cases" test_edge_cases
