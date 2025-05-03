module Color = struct
  type t = Spade | Heart | Diamond | Club
  let all = [Spade; Heart; Diamond; Club]
  let toString (str : t) : string =
          match str with
          | Spade -> "S"
          | Heart -> "H"
          | Diamond -> "D"
          | Club -> "C"
        
  let toStringVerbose (str : t) : string =
          match str with
          | Spade -> "Spade"
          | Heart -> "Heart"
          | Diamond -> "Diamond"
          | Club -> "Club"
          (* val all : t list (** The list of all values of type t *) 
          
          val toString : t -> string (** "S", "H", "D" or "C" *)
          val toStringVerbose : t -> string (** "Spade", "Heart", etc *)
          *)
end

module Value = struct
  type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As
  let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]
  let toInt (card : t) =
          let rec find_in_all index = function
                  | [] -> index
                  | h :: t ->
                                  if h = card then index
                                  else find_in_all (index + 1) t 
          in
          find_in_all 1 all

  let toString (card : t) : string = 
          match card with
          | T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 ->
                  card |> toInt |> ( + ) 1 |> string_of_int
          | Jack -> "J"
          | Queen -> "Q"
          | King -> "K"
          | As -> "A"

  let toStringVerbose (card : t) : string =
        match card with
        | T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 ->
                  card |> toInt |> ( + ) 1 |>
                  string_of_int |> ( ^ ) "T" 
        | Jack -> "Jack"
        | Queen -> "Queen"
        | King -> "King"
        | As -> "As"

  let next (card : t) : t=
          let rec find_next (prev : t) = function
                  | [] -> invalid_arg "Give a lower value card"
                  | h :: t ->
                          if card = prev && card < h then h 
                          else find_next h t
          in find_next T2 all

  let previous (card : t) : t =
          if card = T2 then invalid_arg "Give a higher-value card"
          else
                  let rec find_previous prev = function
                          | [] -> prev
                          | h :: t ->
                                  if card = h then prev
                                  else find_previous h t
                  in find_previous T2 all

end

type t = {
  color: Color.t;
  value: Value.t;
}

let newCard value color =
  {
    color = color;
    value = value;
  }

let allOfX color =
        List.map (fun x ->
        { color = color; value = x }
        ) Value.all

let allSpades = allOfX Color.Spade
let allHearts = allOfX Color.Heart
let allDiamonds = allOfX Color.Diamond
let allClubs = allOfX Color.Club
let all = allSpades @ allHearts @ allDiamonds @ allClubs

let getValue card = function
  | { color = c; value = v } -> v

let getColor card = function
| { color = c; value = v } -> c

let isOf card color =
  match card with
  | { color = c; _} when c = color -> true
  | _ -> false

let isSpade card = isOf card Color.Spade
let isDiamond card = isOf card Color.Diamond
let isHeart card = isOf card Color.Heart
let isClub card = isOf card Color.Club

let toString (card : t) : string =
        Value.toString card.value
        ^ Color.toString card.color

let toStringVerbose (card : t) : string =
        "Card(" ^ Value.toStringVerbose card.value
        ^ "," ^ Color.toStringVerbose card.color ^ ")"

(** returns 0 if x = y, 1 if x > y, -1 if x < y *)
let compare x y =
        let vx = Value.toInt x.value and vy = Value.toInt y.value in
        if vx = vy then 0
        else if vx > vy then 1
        else -1

let max x y =
        if compare x y > -1 then x
        else y

let min x y =
        if compare x y <=0 then x
        else y

let compare_with_next lst =
        match lst with
        | [] -> invalid_arg "Empty list"
        | h :: (h2 :: t) ->
                if compare h h2 > -1 then h
                else h2
        | h :: [] -> h

let best lst =
        match lst with
        | [] -> invalid_arg "Empty list"
        | h :: t ->
                let find_best best_so_far x =
                        if compare best_so_far x < 0 then x
                        else best_so_far
                in
                List.fold_left find_best h t
(* 
[ ] todo:
val max : t -> t -> t
val min : t -> t -> t
val best : t list -> t


[x] done:
val compare : t -> t -> int
val toString : t -> string
val toStringVerbose : t -> string>
val newCard : Value.t -> Color.t -> t
val allSpades : t list
val allHearts : t list
val allDiamonds : t list
val allClubs : t list
val all : t list
val getValue : t -> Value.t
val getColor : t -> Color.t

val isOf : t -> Color.t -> bool
val isSpade : t -> bool
val isHeart : t -> bool
val isDiamond : t -> bool
val isClub : t -> bool
*)