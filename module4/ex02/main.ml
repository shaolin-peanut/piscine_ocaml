(* main.ml for ex02: comprehensive tests for Card module *)

(* ANSI color codes for output *)
let reset = "\x1b[0m"
let blue  = "\x1b[34m"
let green = "\x1b[32m"
let red   = "\x1b[31m"

(* prints a nicely separated section header *)
let print_section title =
  Printf.printf "%s\n" (String.make 60 '=');
  Printf.printf "%s%s%s\n" blue title reset;
  Printf.printf "%s\n" (String.make 60 '=')

(* a generic string-based test *)
let test name f expected =
  let result = f () in
  if result = expected then
    Printf.printf "%s[PASS]%s %s -> %s\n" green reset name result
  else
    Printf.printf "%s[FAIL]%s %s -> %s (expected %s)\n"
      red reset name result expected

(* an integer-based test *)
let test_int name f expected =
  let result = f () in
  if result = expected then
    Printf.printf "%s[PASS]%s %s -> %d\n" green reset name result
  else
    Printf.printf "%s[FAIL]%s %s -> %d (expected %d)\n"
      red reset name result expected

let () =
  (*========================================================================*)
  (* Card.Color *)
  print_section "Card.Color Tests";
  List.iter (fun c ->
    let s = Card.Color.toString c in
    let v = Card.Color.toStringVerbose c in
    Printf.printf "Color %-7s => %s, verbose = %s\n" v s v
  ) Card.Color.all;

  (*========================================================================*)
  (* Card.Value *)
  print_section "Card.Value Tests";
  List.iter (fun v ->
    let i  = Card.Value.toInt v in
    let s  = Card.Value.toString v in
    let vs = Card.Value.toStringVerbose v in
    Printf.printf "Value %-7s -> int: %2d, str: %2s, verbose: %s\n"
      vs i s vs
  ) Card.Value.all;

  (* next & previous round-trip sanity check *)
  test "next ∘ previous of Jack"
    (fun () ->
       Card.Value.next Card.Value.Jack
       |> fun nxt -> Card.Value.previous nxt
       |> Card.Value.toString
    ) "J";

  (*========================================================================*)
  (* Card.t *)
  print_section "Card Tests";
  let c1 = Card.newCard Card.Value.T10 Card.Color.Heart in
  let c2 = Card.newCard Card.Value.As  Card.Color.Spade in

  test "toString 10♥"        (fun () -> Card.toString c1)        "10H";
  test "toStringVerbose 10♥" (fun () -> Card.toStringVerbose c1) "Card(T10,Heart)";

  test "toString A♠"         (fun () -> Card.toString c2)        "AS";
  test "toStringVerbose A♠"  (fun () -> Card.toStringVerbose c2) "Card(As,Spade)";

  (* compare, max, min, best *)
  test_int "compare equal"      (fun () -> Card.compare c1 c1) 0;
  test_int "compare 10H < AS"   (fun () -> Card.compare c1 c2) (-1);

  test "max(10H,AS)"           (fun () -> Card.toString (Card.max c1 c2)) "AS";
  test "min(10H,AS)"           (fun () -> Card.toString (Card.min c1 c2)) "10H";

  let best_card = Card.best [c1; c2; Card.newCard Card.Value.King Card.Color.Club] in
  test "best of [10H,AS,K♣]"    (fun () -> Card.toString best_card) "AS";

  (* isOf predicates *)
  test "isHeart 10H"            (fun () -> string_of_bool (Card.isHeart c1)) "true";
  test "isSpade 10H"            (fun () -> string_of_bool (Card.isSpade c1)) "false";

  (*========================================================================*)
  (* all-cards lists *)
  print_section "All-Cards Lists";
  test_int "allSpades length"   (fun () -> List.length Card.allSpades)   13;
  test_int "allClubs length"    (fun () -> List.length Card.allClubs)    13;
  test_int "allDiamonds length" (fun () -> List.length Card.allDiamonds) 13;
  test_int "allHearts length"   (fun () -> List.length Card.allHearts)   13;
  test_int "allCards length"    (fun () -> List.length Card.all)         52;

  (* done *)
  Printf.printf "%sAll tests done.%s\n" green reset
