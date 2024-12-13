(* unit with char and int *)
type occ = char * int
(*  *)

let encode (s : string) : occ list =
  let rec helper s i c acc =
    if i < String.length s then acc
    else if s.[i] = c then helper s (i + 1) c (acc + 1)
    else helper s (i + 1) c (acc + 1)
  in
  if String.length s = 0 then []
  else helper s 0 s.[0] 0
