let () =
    (* Test all constructors *)
    let test_constructors () =
        let all_cards = [Color.Spade; Color.Heart; Color.Diamond; Color.Club] in
        print_endline "Testing constructors:";
        List.iter (fun card -> 
            print_endline (Color.toStringVerbose card)
        ) all_cards
    in

    (* Test Color.all list *)
    let test_all_list () =
        print_endline "\nTesting Color.all list:";
        print_endline ("List length correct: " ^ string_of_bool (List.length Color.all = 4));
        print_string "Contains all values: ";
        let has_all = List.for_all (fun x -> List.mem x Color.all) 
            [Color.Spade; Color.Heart; Color.Diamond; Color.Club] in
        print_endline (string_of_bool has_all)
    in

    (* Test toString function *)
    let test_toString () =
        print_endline "\nTesting toString:";
        let expected = [
            (Color.Spade, "S");
            (Color.Heart, "H");
            (Color.Diamond, "D");
            (Color.Club, "C")
        ] in
        List.iter (fun (card, expected_str) ->
            let result = Color.toString card in
            print_endline (Printf.sprintf "Expected: %s, Got: %s, Match: %b" 
                expected_str result (result = expected_str))
        ) expected
    in

    (* Test toStringVerbose function *)
    let test_toStringVerbose () =
        print_endline "\nTesting toStringVerbose:";
        let expected = [
            (Color.Spade, "Spade");
            (Color.Heart, "Heart");
            (Color.Diamond, "Diamond");
            (Color.Club, "Club")
        ] in
        List.iter (fun (card, expected_str) ->
            let result = Color.toStringVerbose card in
            print_endline (Printf.sprintf "Expected: %s, Got: %s, Match: %b" 
                expected_str result (result = expected_str))
        ) expected
    in

    (* Run all tests *)
    print_endline "=== Color Module Tests ===\n";
    test_constructors ();
    test_all_list ();
    test_toString ();
    test_toStringVerbose ();
    print_endline "\n=== Tests Complete ==="
