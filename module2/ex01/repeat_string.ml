let rec repeat_string ?str:(str1="x") n =
    if n < 0 then
        "Error"
    else if n = 0 then
        ""
    else if n = 1 then
        str1
    else
        str1 ^ repeat_string ~str:str1 (n - 1)

let () = (
    print_endline (repeat_string (-1));
    print_endline (repeat_string 0);
    print_endline (repeat_string 2);
    print_endline (repeat_string ~str:"yeah " 5);
    print_endline (repeat_string ~str:"segfault " 10);
    print_endline (repeat_string ~str:"segfault " (-1));
    print_endline (repeat_string ~str:"a" 100);
    print_endline (repeat_string ~str:"a" 0);
    print_endline (repeat_string ~str:"what \n" 15);
)


(* let rec repeat_x n str =
  if n < 0 then
    "Error"
  else if n < 2 then
    str
  else
    str ^ repeat_x (n - 1) str
  if String.length str = 0 then
    let str = "x" in
    repeat_x n str
  else
    let str = "x" ^ str in
    repeat_x n str

let rec repeat_x n str =
  if n < 0 then
      "Error"
  else if n < 2 then
      str
  else
      str ^ repeat_x (n - 1) str

let () = (
  print_endline (repeat_x (-1));
  print_endline (repeat_x 0);
  print_endline (repeat_x 1);
  print_endline (repeat_x 2);
  print_endline (repeat_x 5);
) *)
