let ft_print_rev str =
        let rec print_next (n : int) =
                if n < 0 then
                        print_char '\n'
                else (
                        print_char (str.[n]);
                        print_next (n - 1)
                )
        in
        print_next (String.length str - 1)


let () =
        ft_print_rev "Hello world!";
        ft_print_rev "wouah";
        ft_print_rev "";
        ft_print_rev "1";