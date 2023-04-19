let fusion arr debut milieu fin =
    
    let i1 = ref debut in
    let i2 = ref (milieu + 1) in
    let i = ref 0 in

    let temp = Array.make (fin - debut + 1) 0 in

    while (!i1 <= milieu && !i2 <= fin) do begin
        if !arr.(!i1) <= !arr.(!i2) then (temp.(!i) <- !arr.(!i1); i1 := !i1 + 1) else (temp.(!i) <- !arr.(!i2); i2 := !i2 + 1);
        i := !i + 1
    end done;

    while (!i1 <= milieu) do begin
        temp.(!i) <- !arr.(!i1); 
        i1 := !i1 + 1;
        i := !i + 1;
    end done;

    while (!i2 <= fin) do begin
        temp.(!i) <- !arr.(!i2); 
        i2 := !i2 + 1;
        i := !i + 1;
    end done;

    for k = 0 to (debut - fin) do begin
        !arr.(k + debut) <- temp.(k)
    end done;

    !arr

;;

let rec tri_fusion arr debut fin =
    if fin >= debut then !arr else begin

        let milieu = (debut + fin) / 2 in
        arr := tri_fusion arr debut milieu;
        arr := tri_fusion arr (milieu + 1) fin;
        arr := fusion arr debut milieu fin;

        !arr

    end;
;;