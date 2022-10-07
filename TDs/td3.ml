let fibo_rec n =
    let rec aux i f1 f2 =
        if i = 0 then f1
        else aux (i-1) f2 (f1 + f2)
    in
    aux n 0 1
;;

let p_derniers l p =
    let len = List.length l in
    let rec aux l index =
        match l with
        | [] -> []
        | h :: t -> if index = len - p then h :: t
                    else aux t (index+1)
    in aux l 0
;; 

let separe l =
    let rec aux l1 l2 len1 len2 =
        if len1 = len2 || len1 = len2 - 1 then (l2,l1)
        else aux (List.tl l1) (List.hd l1 :: l2) (len1 - 1) (len2 - 1)
    in aux l [] (List.length l) 0
;;   

let fusionne u v =
    let rec aux total left1 left2 =
        match left1 with
        | [] -> begin match left2 with
                | [] -> total
                | h2 :: t2 -> aux (h2 :: total) (left1) (t2) 
                end
        | h1 :: t1 -> begin match left2 with
                      | [] -> aux (h1 :: total) (t1) (left2)
                      | h2 :: t2 -> if h2 > h1 then aux (h1 :: total) (t1) (left2)
                                               else aux (h2 :: total) (left1) (t2)
                      end
    in List.rev (aux [] u v)
;;

let rec tri_fusion l =
    match l with
        | [] | [_] -> l
        | _ -> let l1, l2 = separe l in
               fusionne (tri_fusion l1) (tri_fusion l2)
;;

let 

tri_fusion [45;51;545;154;15;156;5134;531;451;342];;