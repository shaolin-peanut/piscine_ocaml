let fibonacci n =
  let rec fibonacci_acc n acc =
    if n = 0 then 0
    else if n = 1 then 1
    else
      fibonacci_acc (n - 2) acc + fibonacci_acc (n - 1) acc
    in
  if n < 0 then
    -1
  else
    fibonacci_acc n 0

let () = (
  print_endline (string_of_int (fibonacci (-42)));
  print_endline (string_of_int (fibonacci 0));
  print_endline (string_of_int (fibonacci 1));
  print_endline (string_of_int (fibonacci 2));
  print_endline (string_of_int (fibonacci 3));
  print_endline (string_of_int (fibonacci 4));
  print_endline (string_of_int (fibonacci 5));
  print_endline (string_of_int (fibonacci 6));
  print_endline (string_of_int (fibonacci 7));
  print_endline (string_of_int (fibonacci 8));
  print_endline (string_of_int (fibonacci 9));
  print_endline (string_of_int (fibonacci 10));
  
  assert (fibonacci 0 = 0);
  assert (fibonacci 1 = 1);
  assert (fibonacci 2 = 1);
  assert (fibonacci 3 = 2);
  assert (fibonacci 4 = 3);
  assert (fibonacci 5 = 5);
  assert (fibonacci 6 = 8);
  assert (fibonacci 7 = 13);
  assert (fibonacci 8 = 21);
  assert (fibonacci 9 = 34);
  assert (fibonacci 10 = 55);
  assert (fibonacci 11 = 89);
  assert (fibonacci 12 = 144);
  assert (fibonacci 13 = 233);
  assert (fibonacci 14 = 377);
  assert (fibonacci 15 = 610);
  assert (fibonacci 16 = 987);
  assert (fibonacci 17 = 1597);
  assert (fibonacci 18 = 2584);
  assert (fibonacci 19 = 4181)
)