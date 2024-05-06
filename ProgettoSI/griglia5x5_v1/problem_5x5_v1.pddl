(define (problem problem_5x5_v1) (:domain domain_5x5_v1)
   
   
    (:objects
        robot1 - robot
        box1 box2 - box
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 - cell
    )
 
    (:init
        (horizontal c1 c2)
        (horizontal c2 c3)
        (horizontal c3 c4)
        (horizontal c4 c5)
        (horizontal c6 c7)
        (horizontal c7 c8)
        (horizontal c8 c9)
        (horizontal c9 c10)
        (horizontal c11 c12)
        (horizontal c12 c13)
        (horizontal c13 c14)
        (horizontal c14 c15)
        (horizontal c16 c17)
        (horizontal c17 c18)
        (horizontal c18 c19)
        (horizontal c19 c20)
        (horizontal c21 c22)
        (horizontal c22 c23)
        (horizontal c23 c24)
        (horizontal c24 c25)
 
        (vertical c1 c6)
        (vertical c6 c11)
        (vertical c11 c16)
        (vertical c16 c21)
        (vertical c2 c7)
        (vertical c7 c12)
        (vertical c12 c17)
        (vertical c17 c22)
        (vertical c3 c8)
        (vertical c8 c13)
        (vertical c13 c18)
        (vertical c18 c23)
        (vertical c4 c9)
        (vertical c9 c14)
        (vertical c14 c19)
        (vertical c19 c24)
        (vertical c5 c10)
        (vertical c10 c15)
        (vertical c15 c20)
        (vertical c20 c25)
 
 
        (robot_at_cell robot1 c1)
        (box_at_cell box1 c14)
        (box_at_cell box2 c24)
 
        (occupied_by_obstacle c2)
        (occupied_by_obstacle c9)
        (occupied_by_obstacle c11)
        (occupied_by_obstacle c12)
        (occupied_by_obstacle c13)
        (occupied_by_obstacle c22)
        (occupied_by_box c14)
        (occupied_by_box c24)
    )
 
    (:goal
        (and
            (robot_at_cell robot1 c1)
            (box_at_cell box1 c21)
            (arrived_at_dest box1 c21)
            (box_at_cell box2 c16)
            (arrived_at_dest box2 c16)
        )
    )
)