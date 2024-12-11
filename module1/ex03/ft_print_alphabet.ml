let ft_print_alphabet () =
  let rec print_alph x =
    if x > 122 then print_char '\n'
    else (
        x |> char_of_int |> print_char;
        print_alph (x + 1)
    )
  in
  print_alph 97

let () =
  ft_print_alphabet ()