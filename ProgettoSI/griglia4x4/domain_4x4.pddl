 (define (domain domain_4x4)
    (:requirements :negative-preconditions :typing :disjunctive-preconditions :conditional-effects)
 
 
    (:types
        robot
        box
        cell
    )
 
 
    (:predicates
        ;predicates referred to cell
        (horizontal ?c1 - cell ?c2 - cell)
        (vertical ?c1 - cell ?c2 - cell)
        (occupied_by_robot ?c -cell)
        (occupied_by_box ?c)
        (occupied_by_obstacle ?c - cell)
        (box_destination_cell ?c - cell)
 
        ;predicates referred to robot
        (robot_at_cell ?r - robot ?c - cell)
        (is_holding ?r - robot)
        (can_grasp ?r -robot)
 
        ;predicates referred to box
        (box_at_cell ?b - box ?c - cell)      
        (is_held ?b - box)
        (is_held_by ?b - box ?r - robot)
        (arrived_at_dest ?b -box ?c - cell)
 
    )
 
    (:action move_horizontal_robot_free
        :parameters (?r - robot ?cStart - cell ?cDest - cell)
        :precondition
        (and
            (or(horizontal ?cStart ?cDest)(horizontal ?cDest ?cStart))
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle ?cDest))
            (not(box_destination_cell ?cDest))
            (robot_at_cell ?r ?cStart)
            (not(is_holding ?r))
            (not(can_grasp ?r ))
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
        )
    )
 
       
 
    (:action move_vertical_robot_free
        :parameters (?r - robot ?cStart - cell ?cDest - cell)
        :precondition
        (and
            (or(vertical ?cStart ?cDest)(vertical ?cDest ?cStart))
            (not(occupied_by_robot ?cDest))
            (not(occupied_by_obstacle ?cDest))
            (not(box_destination_cell ?cDest))
            (robot_at_cell ?r ?cStart)
            (not(is_holding ?r))
            (not(can_grasp ?r ))
        )
 
        :effect
        (and
            (robot_at_cell ?r ?cDest)
            (occupied_by_robot ?cDest)
            (not(robot_at_cell ?r ?cStart))
            (not (occupied_by_robot ?cStart))
            (when(and(occupied_by_box ?cDest))
                (and
                    (can_grasp ?r)                  
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
            (occupied_by_box ?c)
            (can_grasp ?r)
        )
 
        :effect
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (not(occupied_by_box ?c))
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
        )
 
        :effect
        (and
            (robot_at_cell ?r ?c)
            (occupied_by_robot ?c)
            (box_at_cell ?b ?c)
            (occupied_by_box ?c)
            (box_destination_cell ?c)
            (arrived_at_dest ?b ?c)
            (not(is_held ?b))
            (not(is_holding ?r))
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
            (not(box_destination_cell ?cDest))
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
            (not(box_destination_cell ?cDest))
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
 