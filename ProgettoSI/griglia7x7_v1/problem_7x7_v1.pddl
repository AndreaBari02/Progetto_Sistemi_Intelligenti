(define (problem problem_7x7_v1) (:domain domain_7x7_v1)
   
   
    (:objects
        robot1 robot2 - robot
        box1 box2 box3 box4 - box
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 - cell
    )
 
    (:init
        (horizontal c1 c2)
        (horizontal c2 c3)
        (horizontal c3 c4)
        (horizontal c4 c5)
        (horizontal c5 c6)
        (horizontal c6 c7)
 
        (horizontal c8 c9)
        (horizontal c9 c10)
        (horizontal c10 c11)
        (horizontal c11 c12)
        (horizontal c12 c13)
        (horizontal c13 c14)
 
        (horizontal c15 c16)
        (horizontal c16 c17)
        (horizontal c17 c18)
        (horizontal c18 c19)
        (horizontal c19 c20)
        (horizontal c20 c21)
 
        (horizontal c22 c23)
        (horizontal c23 c24)
        (horizontal c24 c25)
        (horizontal c25 c26)
        (horizontal c26 c27)
        (horizontal c27 c28)
 
 
        (horizontal c29 c30)
        (horizontal c30 c31)
        (horizontal c31 c32)
        (horizontal c32 c33)
        (horizontal c33 c34)
        (horizontal c34 c35)
 
        (horizontal c36 c37)
        (horizontal c37 c38)
        (horizontal c38 c39)
        (horizontal c39 c40)
        (horizontal c40 c41)
        (horizontal c41 c42)
 
        (horizontal c43 c44)
        (horizontal c44 c45)
        (horizontal c45 c46)
        (horizontal c46 c47)
        (horizontal c47 c48)
        (horizontal c48 c49)
 
 
        (vertical c1 c8)
        (vertical c8 c15)
        (vertical c15 c22)
        (vertical c22 c29)
        (vertical c29 c36)
        (vertical c36 c43)
 
        (vertical c2 c9)
        (vertical c9 c16)
        (vertical c16 c23)
        (vertical c23 c30)
        (vertical c30 c37)
        (vertical c37 c44)
 
        (vertical c3 c10)
        (vertical c10 c17)
        (vertical c17 c24)
        (vertical c24 c31)
        (vertical c31 c38)
        (vertical c38 c45)
 
        (vertical c4 c11)
        (vertical c11 c18)
        (vertical c18 c25)
        (vertical c25 c32)
        (vertical c32 c39)
        (vertical c39 c46)
 
        (vertical c5 c12)
        (vertical c12 c19)
        (vertical c19 c26)
        (vertical c26 c33)
        (vertical c33 c40)
        (vertical c40 c47)
 
        (vertical c6 c13)
        (vertical c13 c20)
        (vertical c20 c27)
        (vertical c27 c34)
        (vertical c34 c41)
        (vertical c41 c48)
 
        (vertical c7 c14)
        (vertical c14 c21)
        (vertical c21 c28)
        (vertical c28 c35)
        (vertical c35 c42)
        (vertical c42 c49)
 
        (robot_at_cell robot1 c3)
        (robot_at_cell robot2 c5)
 
        (box_at_cell box1 c22)
        (box_at_cell box2 c28)
        (box_at_cell box3 c23)
        (box_at_cell box4 c27)


 
        (occupied_by_robot c5)
        (occupied_by_robot c3)


        (occupied_by_obstacle c9)
        (occupied_by_obstacle c10)
        (occupied_by_obstacle c11)
        (occupied_by_obstacle c12)
        (occupied_by_obstacle c13)
        (occupied_by_obstacle c16)
        (occupied_by_obstacle c17)
        (occupied_by_obstacle c18)
        (occupied_by_obstacle c19)
        (occupied_by_obstacle c20)


        (occupied_by_obstacle c30)
        (occupied_by_obstacle c31)
        (occupied_by_obstacle c32)
        (occupied_by_obstacle c33)
        (occupied_by_obstacle c34)
        (occupied_by_obstacle c37)
        (occupied_by_obstacle c38)
        (occupied_by_obstacle c39)
        (occupied_by_obstacle c40)
        (occupied_by_obstacle c41)
        (occupied_by_obstacle c25)
        (occupied_by_obstacle c4)
       
 
        (occupied_by_box c22)
        (occupied_by_box c23)
        (occupied_by_box c27)
        (occupied_by_box c28)
  
    )
 
    (:goal
        (and
            (robot_at_cell robot1 c3)
            (robot_at_cell robot2 c5)
            (box_at_cell box1 c45)
            (arrived_at_dest box1 c45)
            (box_at_cell box2 c47)
            (arrived_at_dest box2 c47)
            (box_at_cell box3 c44)
            (arrived_at_dest box3 c44)
            (box_at_cell box4 c48)
            (arrived_at_dest box4 c48)
        )
    )
)