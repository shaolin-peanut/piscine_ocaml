(* gray  *)
let gray (n : int) =
  (** [pow2 n] returns 2 raised to the power of [n] *)
  let rec pow2 n =
    if n = 0 then 1
    else 2 * pow2 (n - 1)
  in
  
  (** [print_binary x n] prints the binary representation of [x] with [n] digits *)
  let rec print_binary x n =
    if n > 0 then begin
      print_binary (x / 2) (n - 1);
      print_int (x mod 2)
    end
  in
  
  (** [turn_gray n] is a bitwise formula that returns the gray code of [binary] *)
  let turn_gray binary =
    let shifted = binary lsr 1 in
    binary lxor shifted
  in
  
  (** [loop_numbers n u current] prints all the gray code numbers from [current] to [u] with [n] digits *)
  let rec loop_numbers n u current =
    if current < u then begin
      if current > 0 then print_char ' ';
      let grayed = turn_gray current in
      print_binary grayed n;
      loop_numbers n u (current + 1)
    end
  in
  if n > 0 then
    loop_numbers n (pow2 n) 0;
  print_char '\n'

let () =
  gray 1;
  gray 2;
  gray 3;
  gray 4;
  gray 5;