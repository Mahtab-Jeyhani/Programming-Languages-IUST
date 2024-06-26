datatype 'a tree =
    Empty
  | Node of 'a * 'a tree * 'a tree;

(* Define the depth function *)
fun depth Empty = 0
  | depth (Node (_, left, right)) =
      1 + Int.max (depth left, depth right);

(* Example *)
val exampleTree =
    Node (1,
          Node (2,
                Node (4, Empty, Empty),
                Empty),
          Node (3,
                Node (5, Empty, Empty),
                Node (6, Empty, Empty)));

val treeDepth = depth exampleTree;

(* Printing the result *)
val _ = print ("The depth of the tree is " ^ Int.toString treeDepth ^ ".\n");
