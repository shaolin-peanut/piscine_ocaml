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

