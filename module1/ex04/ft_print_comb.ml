let ft_print_comb () =
                let print_digits a b c =
                        print_int a;
                        print_int b;
                        print_int c;
                        if not (a = 7 && b = 8 && c = 9) then
                                print_string ", ";
                in

                let rec print_combo a b c =
                        print_digits a b c;
                        
                        if c < 9 then print_combo a b (c + 1)
                        else if b < 8 then print_combo a (b + 1) (b + 2)
                        else if a < 7 then print_combo (a + 1) (a + 2) (a + 3)
                        else ()
                in
                print_combo 0 1 2 

let () =
        ft_print_comb ()
