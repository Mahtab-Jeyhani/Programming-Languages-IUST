fun maxElement [] = NONE
  | maxElement (x::xs) =
    let
        fun findMax ([], currentMax) = SOME currentMax
          | findMax (y::ys, currentMax) =
              if y > currentMax then
                  findMax (ys, y)
              else
                  findMax (ys, currentMax)
    in
        findMax (xs, x)
    end;

(* Example *)
val numbers = [5, 3, 9, 1, 6];
val max = maxElement numbers;

(* Printing the result *)
case max of
     NONE => print "No maximum element found.\n"
   | SOME value => print ("The maximum element is " ^ Int.toString value ^ ".\n");
