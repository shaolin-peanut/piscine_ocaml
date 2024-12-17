let sequence n =
  let encode lst =
    let rec helper lst run =
      match lst, run with
      | [], (elem, count) -> [(elem, count)]
      | h :: t, (elem, count) -> begin
        if h = elem then
          helper t (elem, count + 1)
        else
          (elem, count) :: helper t (h, 1)
        end
      in
      match lst with
      | [] -> []
      | h :: t ->
        helper t (h, 1)
  in  
  let rec loop n =
    if n = 1 then [1]
    