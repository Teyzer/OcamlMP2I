let rec max l =
    match l with
    | [] -> 0
    | [h] -> h
    | h :: t -> let m = max t in
        if h < m then m else h
;;

let rec min_max l = 
    match l with
    | [] -> (0,0)
    | [h] -> (h, h)
    | h :: t -> let (mi, ma) = min_max t in
        if mi < h then 
            if ma > h then (mi, ma)
            else (mi, h)
        else
            if ma > h then (h, ma)
            else (h, h)
;;

let range a b =
    let rec aux i l =
        if i >= a then aux (i - 1) (i :: l)
        else l
    in aux (b - 1) []
;;

let concat l1 l2 =
    let rec aux l1 l2 =
        match l2 with
        | [] -> l1
        | h :: t -> aux (h :: l1) t
    in aux l2 (List.rev l1)
;;