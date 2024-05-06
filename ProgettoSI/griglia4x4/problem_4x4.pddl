(define (problem problem_4x4) (:domain domain_4x4)
    (:objects
        robot1 - robot
        box1 - box
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 - cell
    )
 
    (:init
        (horizontal c1 c2)
        (horizontal c2 c3)
        (horizontal c3 c4)
        (horizontal c5 c6)
        (horizontal c6 c7)
        (horizontal c7 c8)
        (horizontal c9 c10)
        (horizontal c10 c11)
        (horizontal c11 c12)
        (horizontal c13 c14)
        (horizontal c14 c15)
        (horizontal c15 c16)
 
        (vertical c1 c5)
        (vertical c5 c9)
        (vertical c9 c13)
        (vertical c2 c6)
        (vertical c6 c10)
        (vertical c10 c14)
        (vertical c3 c7)
        (vertical c7 c11)
        (vertical c11 c15)
        (vertical c4 c8)
        (vertical c8 c12)
        (vertical c12 c16)
 
        (robot_at_cell robot1 c1)
        (box_at_cell box1 c16)
        (occupied_by_box c16)
        (occupied_by_obstacle c2)
        (occupied_by_obstacle c6)
        (occupied_by_obstacle c10)
    )
 
    (:goal
        (and
            (robot_at_cell robot1 c1)
            (box_at_cell box1 c4)
            (arrived_at_dest box1 c4)
        )
 
    )
)