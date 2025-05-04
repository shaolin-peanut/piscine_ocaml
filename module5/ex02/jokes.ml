let () =
  Random.self_init();

  let jokes_arr = [|
    "Im reading a book on anti-gravity. Its impossible to put down.";
    "I would tell you a joke about construction.... but I'm still working on it";
    "I tried to catch some fog yesterday... I mist";
    "Did you hear about the italian chef who died? He pasta-way";
    "what do you call an alligator in a vest? an in-vest-igator"
  |] in
  let rand_index = Random.int 4 in
  Printf.printf "%d: %s\n" rand_index jokes_arr.(rand_index)