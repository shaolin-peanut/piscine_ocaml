let ft_sum f l u =
  let rec helper l acc =
    if l > u then acc
    else helper (l +. 1.) (acc +. f l)
  in
  if u < l then nan
  else helper l 0.


let () =
let test_cases = [
  ((fun x -> x), 0., 0., 0.);          (* Single point *)
  ((fun x -> x), 1., 1., 1.);          (* Single point *)
  ((fun x -> x), 1., 2., 3.);          (* Linear function over one step *)
  ((fun x -> x), 1., 3., 6.);          (* Linear sum: 1 + 2 + 3 *)
  ((fun x -> x *. x), 1., 3., 14.);    (* Quadratic sum: 1^2 + 2^2 + 3^2 *)
  ((fun x -> 1.), 1., 4., 4.);         (* Constant function: 1 + 1 + 1 + 1 *)
  ((fun x -> x *. x), 3., 2., nan);    (* Invalid range *)
] in

List.iter (fun (f, l, u, expected) ->
  let result = ft_sum f l u in
  Printf.printf "ft_sum (%f -> %f): expected = %f, got = %f\n"
    l u expected result;
  (* Assert equality for non-nan results *)
  if expected = expected then (* Handle non-nan comparisons *)
    assert (result = expected)
  else
    assert (classify_float result = FP_nan)
) test_cases;

Printf.printf "All tests passed!\n"