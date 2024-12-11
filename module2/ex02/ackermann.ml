let rec ackermann m n =
  if n < 0 || m < 0 then -1
  else
    if m = 0 then
        n + 1
    else if m > 0 && n = 0 then
        ackermann (m - 1) 1
    else
        ackermann (m - 1) (ackermann m (n - 1))

let () = (
  print_endline (string_of_int (ackermann 0 0));
  print_endline (string_of_int (ackermann 0 1));
  print_endline (string_of_int (ackermann 1 0));
  print_endline (string_of_int (ackermann 1 1));
  print_endline (string_of_int (ackermann 1 2));
  print_endline (string_of_int (ackermann 2 2));
  print_endline (string_of_int (ackermann 2 3));
  print_endline (string_of_int (ackermann 4 1));
  (* print_endline (string_of_int (ackermann 2 3));
  print_endline (string_of_int (ackermann 3 3));
  print_endline (string_of_int (ackermann 3 4));
  print_endline (string_of_int (ackermann 4 4));
  print_endline (string_of_int (ackermann 4 5));
  print_endline (string_of_int (ackermann 5 5));
  print_endline (string_of_int (ackermann 5 6)); *)
)