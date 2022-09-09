let rec fact n = match n with
    | 0 -> 1
    | 1 -> 1
    | _ -> n * fact (n - 1)
;;

let rec pascal n p = 
    if p = 0 || p = n then 1
    else pascal (n - 1) (p - 1) + pascal (n - 1) p
;;

let rec fibonacci n = match n with
    | 0 -> 0
    | 1 -> 1
    | _ -> fibonacci (n - 1) + fibonacci (n - 2)
;;

let rec dernier l = match l with
    | a :: [] -> a
    | _ :: a -> dernier a
    | [] -> 0
;;

let rec acc lst m =
    match lst with
        | [] -> m
        | head :: tail -> if head > m then acc tail head else acc tail m
;;

let max l = 
    let rec acc lst m =
    match lst with
        | [] -> m
        | head :: tail -> if head > m then acc tail head else acc tail m
    in acc l 0
;;

print_int (max [4;5;6;7;8;9;88;6;5;2;3;1]);;
print_endline " ";;