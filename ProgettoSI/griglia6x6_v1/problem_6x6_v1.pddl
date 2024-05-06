(define (problem problem_6x6_v1) (:domain domain_6x6_v1)
   
   
    (:objects
        robot1 robot2  - robot
        box1 box2  - box
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 - cell
    )
 
    (:init
        (horizontal c1 c2)
        (horizontal c2 c3)
        (horizontal c3 c4)
        (horizontal c4 c5)
        (horizontal c5 c6)
 
        (horizontal c7 c8)
        (horizontal c8 c9)
        (horizontal c9 c10)
        (horizontal c10 c11)
        (horizontal c11 c12)
 
        (horizontal c13 c14)
        (horizontal c14 c15)
        (horizontal c15 c16)
        (horizontal c16 c17)
        (horizontal c17 c18)
 
        (horizontal c19 c20)
        (horizontal c20 c21)
        (horizontal c21 c22)
        (horizontal c22 c23)
        (horizontal c23 c24)
 
        (horizontal c25 c26)
        (horizontal c26 c27)
        (horizontal c27 c28)
        (horizontal c28 c29)
        (horizontal c29 c30)
 
        (horizontal c31 c32)
        (horizontal c32 c33)
        (horizontal c33 c34)
        (horizontal c34 c35)
        (horizontal c35 c36)
 
 
        (vertical c1 c7)
        (vertical c7 c13)
        (vertical c13 c19)
        (vertical c19 c25)
        (vertical c25 c31)
 
        (vertical c2 c8)
        (vertical c8 c14)
        (vertical c14 c20)
        (vertical c20 c26)
        (vertical c26 c32)
 
        (vertical c3 c9)
        (vertical c9 c15)
        (vertical c15 c21)
        (vertical c21 c27)
        (vertical c27 c33)
 
        (vertical c4 c10)
        (vertical c10 c16)
        (vertical c16 c22)
        (vertical c22 c28)
        (vertical c28 c34)
 
        (vertical c5 c11)
        (vertical c11 c17)
        (vertical c17 c23)
        (vertical c23 c29)
        (vertical c29 c35)
 
        (vertical c6 c12)
        (vertical c12 c18)
        (vertical c18 c24)
        (vertical c24 c30)
        (vertical c30 c36)
 
 
        (robot_at_cell robot1 c1)
        (robot_at_cell robot2 c36)
       
        (box_at_cell box1 c15)
        (box_at_cell box2 c16)


        (occupied_by_robot c1)
        (occupied_by_robot c36)

        (occupied_by_obstacle c8)
        (occupied_by_obstacle c9)
        (occupied_by_obstacle c10)
        (occupied_by_obstacle c14)
        (occupied_by_obstacle c20)
        (occupied_by_obstacle c26)
        (occupied_by_obstacle c27)
        (occupied_by_obstacle c29)
        (occupied_by_obstacle c28)
        (occupied_by_obstacle c23)

        (occupied_by_box c15)
        (occupied_by_box c16)


 
       
       
    )
 
    (:goal
        (and
            (robot_at_cell robot1 c1)
            (robot_at_cell robot2 c36)

            (box_at_cell box1 c6)
            (arrived_at_dest box1 c6)
            (box_at_cell box2 c31)
            (arrived_at_dest box2 c31)

        )
    )
)