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

let allSpades = [
  { color = Color.Spade; value = Value.T2};
  { color = Color.Spade; value = Value.T3};
  { color = Color.Spade; value = Value.T4};
  { color = Color.Spade; value = Value.T5};
  { color = Color.Spade; value = Value.T6};
  { color = Color.Spade; value = Value.T7};
  { color = Color.Spade; value = Value.T8};
  { color = Color.Spade; value = Value.T9};
  { color = Color.Spade; value = Value.T10};
  { color = Color.Spade; value = Value.Jack};
  { color = Color.Spade; value = Value.Queen};
  { color = Color.Spade; value = Value.King};
  { color = Color.Spade; value = Value.As};
]

let allHearts = [
  { color = Color.Heart; value = Value.T2};
  { color = Color.Heart; value = Value.T3};
  { color = Color.Heart; value = Value.T4};
  { color = Color.Heart; value = Value.T5};
  { color = Color.Heart; value = Value.T6};
  { color = Color.Heart; value = Value.T7};
  { color = Color.Heart; value = Value.T8};
  { color = Color.Heart; value = Value.T9};
  { color = Color.Heart; value = Value.T10};
  { color = Color.Heart; value = Value.Jack};
  { color = Color.Heart; value = Value.Queen};
  { color = Color.Heart; value = Value.King};
  { color = Color.Heart; value = Value.As};
]

let allDiamonds = [
  { color = Color.Diamond; value = Value.T2};
  { color = Color.Diamond; value = Value.T3};
  { color = Color.Diamond; value = Value.T4};
  { color = Color.Diamond; value = Value.T5};
  { color = Color.Diamond; value = Value.T6};
  { color = Color.Diamond; value = Value.T7};
  { color = Color.Diamond; value = Value.T8};
  { color = Color.Diamond; value = Value.T9};
  { color = Color.Diamond; value = Value.T10};
  { color = Color.Diamond; value = Value.Jack};
  { color = Color.Diamond; value = Value.Queen};
  { color = Color.Diamond; value = Value.King};
  { color = Color.Diamond; value = Value.As};
]

let allClubs = [
  { color = Color.Club; value = Value.T2};
  { color = Color.Club; value = Value.T3};
  { color = Color.Club; value = Value.T4};
  { color = Color.Club; value = Value.T5};
  { color = Color.Club; value = Value.T6};
  { color = Color.Club; value = Value.T7};
  { color = Color.Club; value = Value.T8};
  { color = Color.Club; value = Value.T9};
  { color = Color.Club; value = Value.T10};
  { color = Color.Club; value = Value.Jack};
  { color = Color.Club; value = Value.Queen};
  { color = Color.Club; value = Value.King};
  { color = Color.Club; value = Value.As};
]

let all = allSpades @ allHearts @ allDiamonds @ allClubs

let getValue card = function
  | { color = c; value = v } -> v

let getColor card = function
| { color = c; value = v } -> c

let isOf card color =
  match card with
  | { color = c; _} ->
    if c = color then true
    else false

let isSpade card = isOf card Color.Spade
let isDiamond card = isOf card Color.Diamond
let isHeart card = isOf card Color.Heart
let isClub card = isOf card Color.Club


(* 
[ ] todo:
val toString : t -> string
val toStringVerbose : t -> string
val compare : t -> t -> int
val max : t -> t -> t
val min : t -> t -> t
val best : t list -> t


[x] done:
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