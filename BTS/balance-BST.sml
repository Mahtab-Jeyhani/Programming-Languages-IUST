(* Define the binary tree type *)
datatype 'a tree =
    Empty
  | Node of 'a * 'a tree * 'a tree;

(* Function to perform in-order traversal and collect values into a list *)
fun inOrderTraversal Empty = []
  | inOrderTraversal (Node (value, left, right)) =
      inOrderTraversal left @ [value] @ inOrderTraversal right;

(* Function to split a list into two parts at a given index *)
fun splitAt (0, xs) = ([], xs)
  | splitAt (_, []) = ([], [])
  | splitAt (n, x::xs) =
      let
          val (left, right) = splitAt (n - 1, xs)
      in
          (x :: left, right)
      end;

(* Function to build a balanced tree from a sorted list *)
fun buildBalancedTree [] = Empty
  | buildBalancedTree xs =
      let
          val len = length xs
          val mid = len div 2
          val (leftList, midElement::rightList) = splitAt (mid, xs)
      in
          Node (midElement, buildBalancedTree leftList, buildBalancedTree rightList)
      end;

(* Function to balance a BST *)
fun balanceBST tree =
    let
        val sortedList = inOrderTraversal tree
    in
        buildBalancedTree sortedList
    end;

(* Example usage *)

(* Example unbalanced BST *)
val exampleTree =
    Node (10,
          Node (5,
                Node (1, Empty, Empty),
                Empty),
          Node (20,
                Empty,
                Node (30, Empty, Empty)));

(* Balancing the example tree *)
val balancedTree = balanceBST exampleTree;

(* Function to convert a tree to a string representation for printing *)
fun treeToString Empty = "Empty"
  | treeToString (Node (value, left, right)) =
      "Node (" ^ Int.toString value ^ ", " ^ treeToString left ^ ", " ^ treeToString right ^ ")";

(* Printing the balanced tree *)
val _ = print ("Balanced tree: " ^ treeToString balancedTree ^ "\n");
