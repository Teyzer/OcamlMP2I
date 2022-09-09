let tanh z = let e = exp z in (e-.1./.e)/.(e+.1./.e);;

let nb_solutions a b c = let delta = b * b - 4 * a * c in if delta > 0 then 2 else if delta = 0 then 1 else 0;;

let jour_de_semaine n =
    match n mod 7 with
        | 1 -> "lundi"
        | 2 -> "mardi"
        | 3 -> "mercredi"
        | 4 -> "jeudi"
        | 5 -> "vendredi"
        | 6 -> "samedi"
        | _ -> "dimanche"
;;

let palindrome l = l = List.rev l;;

let rec sum l = 
    match l with 
        | [] -> 0
        | a :: b -> a + sum b
;;