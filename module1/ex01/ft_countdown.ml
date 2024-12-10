let rec ft_countdown x =
        if x <= 0 then print_endline "0"
        else (
                print_endline (string_of_int x);
                ft_countdown (x - 1))

let () =
        ft_countdown 3;
        ft_countdown 0;
        ft_countdown (-1)
