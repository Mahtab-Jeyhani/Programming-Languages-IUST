fun reverse lst =
    let
        fun revHelper ([], acc) = acc
          | revHelper (x::xs, acc) = revHelper (xs, x::acc)
    in
        revHelper (lst, [])
    end;

(* Example *)
val originalList = [1, 2, 3, 4, 5];
val reversedList = reverse originalList;
