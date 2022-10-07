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

