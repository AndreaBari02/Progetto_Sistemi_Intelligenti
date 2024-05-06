(define (domain domain_8x8)
    (:requirements :negative-preconditions :typing :disjunctive-preconditions :conditional-effects)
 
 
    (:types
        robot
        box
        cell
    )
 
 
    (:predicates
        (robot_at_cell ?r - robot ?c - cell)
        (box_at_cell ?b - box ?c - cell)
        (occupied_by_obstacle ?c - cell)
        (occupied_by_box ?c)
        (occupied_by_robot ?c -cell)
        (horizontal ?c1 - cell ?c2 - cell)
        (vertical ?c1 - cell ?c2 - cell)
        (is_held ?b - box )
        (is_held_by ?b - box ?r - robot)
        (box_destination_cell ?c - cell)
        (is_holding ?r - robot)
        (arrived_at_dest ?b -box ?c - cell) ;questo viene settato solo quando viene fatto il drop: dato che poi non ci sono azioni che hanno come precondizione il drop e abbiamo messo questo come goal,
        ;per forza quando il robot fa il drop deve essere a destinazione (prima magari prendeva un oggetto, lo metteva giù e poi lo riprendeva)
        ;(right_box ?b -box ?c - cell)
        (can_grasp ?r -robot) ;inizialmente a falso, viene settato a vero se un robot passa su una cella con un oggetto, se no è falso.
        ; il robot può afferrare un oggetto (quindi gran) solo se il can grasp è a true. ovviamente quando fa il grasp tornaa a false e eanche dopo aver fatto il drop è a false, se no nel momento in cui milla l'oggetto
        ;e diventa true può rifare il grasp
 
    )
 
    (:action move_horizontal_robot_free
        :parameters (?r - robot ?cStart - cell ?cDest - cell)
        :precondition
        (and
            (robot_at_cell ?r ?cStart)
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle ?cDest))
            (not(box_destination_cell ?cDest))
            (not(is_holding ?r))
            (not(can_grasp ?r ))
            (or(horizontal ?cStart ?cDest)(horizontal ?cDest ?cStart))
        )
        :effect
        (and
            (when (and(or(horizontal ?cStart ?cDest) (horizontal ?cDest ?cStart)))
                (and
                    (robot_at_cell ?r ?cDest)
                    (occupied_by_robot ?cDest)
                    (not(robot_at_cell ?r ?cStart))
                    (not (occupied_by_robot ?cStart))
                )
            )
            (when(and(occupied_by_box ?cDest))
                (and
                    (can_grasp ?r)                  
                )    
            )
            (when(and(not(occupied_by_box ?cDest)))
                (and
                    (not(can_grasp ?r ))                  
                )    
            )      
        )
    )
 
       
 
    (:action move_vertical_robot_free
        :parameters (?r - robot ?cStart - cell ?cDest - cell)
        :precondition
        (and
            (robot_at_cell ?r ?cStart)
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle ?cDest))
            (not(box_destination_cell ?cDest))
            (not(is_holding ?r))
            (not(can_grasp ?r))
            (or(vertical ?cStart ?cDest)(vertical ?cDest ?cStart))
        )
 
        :effect
        (and
            (when (and(or(vertical ?cStart ?cDest) (vertical ?cDest ?cStart)))
                (and
                    (robot_at_cell ?r ?cDest)
                    (occupied_by_robot ?cDest)
                    (not(robot_at_cell ?r ?cStart))
                    (not (occupied_by_robot ?cStart))
                )
            )
            (when(and(occupied_by_box ?cDest))
                (and
                    (can_grasp ?r)                  
                )    
            )
            (when(and(not(occupied_by_box ?cDest)))
                (and
                    (not(can_grasp ?r ))                  
                )    
            )      
        )
    )
 
 
    (:action grab
        :parameters (?r - robot ?b - box ?c - cell)
        :precondition
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (box_at_cell ?b ?c)
            (not(is_holding ?r))
            (can_grasp ?r)
        )
 
        :effect
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (not(box_at_cell ?b ?c))
            (is_held ?b )
            (is_holding ?r)
            (not(can_grasp ?r))
            (is_held_by ?b ?r)
        )
    )
 
 
    (:action drop
        :parameters (?r - robot ?b - box ?c - cell)
        :precondition
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (is_holding ?r)
            (is_held ?b)
            (not(can_grasp ?r ))
            (not(occupied_by_box ?c))
            ;(not(can_grasp ?r ))
        )
        :effect
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (box_at_cell ?b ?c)
            (occupied_by_box ?c)
            (arrived_at_dest ?b ?c)
            (not(is_held ?b))
            (not(is_holding ?r))
            (not(can_grasp ?r))
            (box_destination_cell ?c)
            (not(is_held_by ?b ?r))
        )
    )
 
    (:action move_horizontal_robot_with_box
        :parameters (?r - robot ?b - box ?cStart - cell ?cDest - cell )
        :precondition
        (and
            (robot_at_cell ?r ?cStart)
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle ?cDest))
            (not(occupied_by_box ?cDest))
            (or(horizontal ?cStart ?cDest)(horizontal ?cDest ?cStart))
            (not(can_grasp ?r ))
            (is_holding ?r)
            (is_held ?b)
            (is_held_by ?b ?r)
 
        )
        :effect
        (and
            (when (and(or(horizontal ?cStart ?cDest) (horizontal ?cDest ?cStart)))
                (and
                    (robot_at_cell ?r ?cDest)
                    (occupied_by_robot ?cDest)
                    (not(can_grasp ?r ))
                    (not(robot_at_cell ?r ?cStart))
                    (not (occupied_by_robot ?cStart))
                    (is_holding ?r)
                    (is_held ?b )
                )
            )
           
        )
    )
   
 
    (:action move_vertical_robot_with_box
        :parameters (?r - robot ?b - box ?cStart - cell ?cDest - cell )
        :precondition
        (and
            (robot_at_cell ?r ?cStart)
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle?cDest))
            (not(occupied_by_box ?cDest))
            (or(vertical ?cStart ?cDest)(vertical ?cDest ?cStart))
            (is_holding ?r)
            (is_held ?b )
            (is_held_by ?b ?r)
        )
 
        :effect
        (and
            (when (and(or(vertical ?cStart ?cDest) (vertical ?cDest ?cStart)))
                (and
                    (robot_at_cell ?r ?cDest)
                    (occupied_by_robot ?cDest)
                    (not(robot_at_cell ?r ?cStart))
                    (not (occupied_by_robot ?cStart))
                    (is_holding ?r)
                    (is_held ?b)
                )
            )      
        )
    )
)