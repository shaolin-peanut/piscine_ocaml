let () =
  let n_seconds =  int_of_string Sys.argv.(1) in
  let my_sleep = Unix.sleep n_seconds in
  my_sleep