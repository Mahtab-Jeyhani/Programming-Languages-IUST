fun merge ([], ys) = ys
  | merge (xs, []) = xs
  | merge (x::xs, y::ys) =
      if x < y then
          x :: merge (xs, y::ys)
      else
          y :: merge (x::xs, ys);

(* Example *)
val sortedList1 = [1, 3, 5, 7];
val sortedList2 = [2, 4, 6, 8];
val mergedList = merge (sortedList1, sortedList2);

(* Printing the result *)
val _ = print (String.concatWith ", " (List.map Int.toString mergedList) ^ "\n");
