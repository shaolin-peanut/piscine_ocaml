let ft_string_all f str =
  let rec check_if n =
    if n < 0 then true
    else if f str.[n] then check_if (n - 1)
    else false
  in
  check_if ((String.length str) - 1)

let is_digit c =
  c >= '0' && c <= '9'

let () =
  print_endline (if (ft_string_all is_digit "0123456789")
    then "true" else "false");
  print_endline (if (ft_string_all is_digit "0123EA245B9")
    then "true" else "false");