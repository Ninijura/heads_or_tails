
(* function to finish up the process by printing out how your results are distributed and returning the pair of (number_of_heads, number_of_tails) as result. *)
let print_results (n_heads, n_tails) =
  let () = print_string ("You rolled " ^ string_of_int n_heads ^ " heads and " ^  string_of_int n_tails ^ " tails.")
  in (n_heads, n_tails);;


(* main counting function that repeatedly asks the user to input the result of their throw. *)
let start_counting (heads, tails, safeword) =
  let rec count (n_heads, n_tails, n_throws) =
    let () = print_string ("Enter the result of throw #" ^ string_of_int n_throws ^ ": ")
    and line = read_line ()
    in if line = heads
       then count (n_heads + 1, n_tails, n_throws + 1)
       else if line = tails
       then count (n_heads, n_tails + 1, n_throws + 1)
       else if line = safeword
       then print_results (n_heads, n_tails)
       else let () = print_string ("I'm sorry, I don't understand your input. Your commands are either " ^ heads ^ ", " ^ tails ^ ", or " ^ safeword ^ " to exit.\n")
            in count (n_heads, n_tails, n_throws)
  in count (0,0,1);;
    



(* main function that asks for the keybindings for heads, tails and exit and calls the counting function. *)

let count_my_rolls () =
  print_string "Hi what do you call the first side of your coin?\n";
  let side_one = read_line ()
  in print_string "What do you call the other side of your coin?\n";
     let side_two = read_line ()
     in print_string "Alright, what do you want to be your safeword (exit phrase)?\n";
        let safeword = read_line ()
        in start_counting (side_one, side_two, safeword);;
