datatype 'a tree =
    Empty
  | Node of 'a * 'a tree * 'a tree;

(* Define the inOrderTraversal function *)
fun inOrderTraversal Empty = []
  | inOrderTraversal (Node (value, left, right)) =
      inOrderTraversal left @ [value] @ inOrderTraversal right;

(* Example *)
val exampleTree =
    Node (1,
          Node (2,
                Node (4, Empty, Empty),
                Node (5, Empty, Empty)),
          Node (3,
                Empty,
                Node (6, Empty, Empty)));

val traversalResult = inOrderTraversal exampleTree;

(* Printing the result *)
val _ = print ("In-order traversal of the tree: " ^
               String.concatWith ", " (List.map Int.toString traversalResult) ^ "\n");
