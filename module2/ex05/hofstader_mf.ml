let rec hfs_m n =
  if n < 0 then -1
  else if n = 0 then 0
  else
    n - hfs_f(hfs_m (n - 1))
and hfs_f n =
  if n < 0 then -1
  else if n = 0 then 1
  else
    n - hfs_m(hfs_f (n - 1))

let () =
  List.iter ( fun n ->
    hfs_m n |> string_of_int |> print_endline)
    [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10];

  assert (hfs_m 0 = 0);
  assert (hfs_m 1 = 0);
  assert (hfs_m 2 = 1);
  assert (hfs_m 3 = 2);
  assert (hfs_m 4 = 2);
  assert (hfs_m 5 = 3);
  assert (hfs_m 6 = 4);
  assert (hfs_m 7 = 4);
  assert (hfs_f 0 = 1);
  assert (hfs_m 4 = 2);
  assert (hfs_f 4 = 3);
