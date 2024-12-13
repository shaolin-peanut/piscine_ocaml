let rec repeat_x n =
    if n < 0 then
        "Error"
    else if n = 0 then
        ""
    else
        "x" ^ repeat_x (n - 1)

let () = (
    List.iter (
        fun n -> print_endline (repeat_x n)
    ) [-1; 0; 1; 2; 5; 50]
)
