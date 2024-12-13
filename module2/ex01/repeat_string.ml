let rec repeat_string ?str:(str1="x") n =
    if n < 0 then
        "Error"
    else if n = 0 then
        ""
    else
        str1 ^ repeat_string ~str:str1 (n - 1)

let () = (
  (* without the string argument *)
  List.iter (
      fun n ->print_endline (repeat_string n)
  ) [-1; 0; 2; 50];
  (* to replace the ones with two arguments I need some pattern matching and passing tuples to the function, doing later *)
  print_endline (repeat_string ~str:"yeah " (-1));
  print_endline (repeat_string ~str:"yeah " 5);
  print_endline (repeat_string ~str:"segfault " 10);
  print_endline (repeat_string ~str:"segfault " (-1));
  print_endline (repeat_string ~str:"a" 100);
  print_endline (repeat_string ~str:"a" 0);
  print_endline (repeat_string ~str:"what \n" 15);
)
