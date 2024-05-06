(define (problem problem_8x8) (:domain domain_8x8)
   
   
    (:objects
        robot1 robot2 robot3 robot4 - robot
        box1 box2 box3 box4 - box
        c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 - cell
    )
 
    (:init
        (horizontal c1 c2)
        (horizontal c2 c3)
        (horizontal c3 c4)
        (horizontal c4 c5)
        (horizontal c5 c6)
        (horizontal c6 c7)
        (horizontal c7 c8)

        (horizontal c9 c10)
        (horizontal c10 c11)
        (horizontal c11 c12)
        (horizontal c12 c13)
        (horizontal c13 c14)
        (horizontal c14 c15)
        (horizontal c15 c16)

        (horizontal c17 c18)
        (horizontal c18 c19)
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
        (horizontal c30 c31)
        (horizontal c31 c32)

        (horizontal c33 c34)
        (horizontal c34 c35)
        (horizontal c35 c36)
        (horizontal c36 c37)
        (horizontal c37 c38)
        (horizontal c38 c39)
        (horizontal c39 c40)

        (horizontal c41 c42)
        (horizontal c42 c43)
        (horizontal c43 c44)
        (horizontal c44 c45)
        (horizontal c45 c46)
        (horizontal c46 c47)
        (horizontal c47 c48)

        (horizontal c49 c50)
        (horizontal c50 c51)
        (horizontal c51 c52)
        (horizontal c52 c53)
        (horizontal c53 c54)
        (horizontal c54 c55)
        (horizontal c55 c56)

        (horizontal c57 c58)
        (horizontal c58 c59)
        (horizontal c59 c60)
        (horizontal c60 c61)
        (horizontal c61 c62)
        (horizontal c62 c63)
        (horizontal c63 c64)

        (vertical c1 c9)
        (vertical c9 c17)
        (vertical c17 c25)
        (vertical c25 c33)
        (vertical c33 c41)
        (vertical c41 c49)
        (vertical c49 c57)

        (vertical c2 c10)
        (vertical c10 c18)
        (vertical c18 c26)
        (vertical c26 c34)
        (vertical c34 c42)
        (vertical c42 c50)
        (vertical c50 c58)

        (vertical c3 c11)
        (vertical c11 c19)
        (vertical c19 c27)
        (vertical c27 c35)
        (vertical c35 c43)
        (vertical c43 c51)
        (vertical c51 c59)

        (vertical c4 c12)
        (vertical c12 c20)
        (vertical c20 c28)
        (vertical c28 c36)
        (vertical c36 c44)
        (vertical c44 c52)
        (vertical c52 c60)

        (vertical c5 c13)
        (vertical c13 c21)
        (vertical c21 c29)
        (vertical c29 c37)
        (vertical c37 c45)
        (vertical c45 c53)
        (vertical c53 c61)

        (vertical c6 c14)
        (vertical c14 c22)
        (vertical c22 c30)
        (vertical c30 c38)
        (vertical c38 c46)
        (vertical c46 c54)
        (vertical c54 c62)

        (vertical c7 c15)
        (vertical c15 c23)
        (vertical c23 c31)
        (vertical c31 c39)
        (vertical c39 c47)
        (vertical c47 c55)
        (vertical c55 c63)

        (vertical c8 c16)
        (vertical c16 c24)
        (vertical c24 c32)
        (vertical c32 c40)
        (vertical c40 c48)
        (vertical c48 c56)
        (vertical c56 c64)
 
        (robot_at_cell robot1 c4)
        (robot_at_cell robot2 c5)
        (robot_at_cell robot3 c60)
        (robot_at_cell robot4 c61)

        (box_at_cell box1 c28)
        (box_at_cell box2 c29)
        (box_at_cell box3 c36)
        (box_at_cell box4 c37)
 
        (occupied_by_robot c4)
        (occupied_by_robot c5)
        (occupied_by_robot c60)
        (occupied_by_robot c61)

        (occupied_by_obstacle c1)
        (occupied_by_obstacle c2)
        (occupied_by_obstacle c3)
        (occupied_by_obstacle c6)
        (occupied_by_obstacle c7)
        (occupied_by_obstacle c8)
        (occupied_by_obstacle c9)
        (occupied_by_obstacle c10)
        (occupied_by_obstacle c11)
        (occupied_by_obstacle c14)
        (occupied_by_obstacle c15)
        (occupied_by_obstacle c16)
        (occupied_by_obstacle c25)
        (occupied_by_obstacle c26)
        (occupied_by_obstacle c27)
        (occupied_by_obstacle c30)
        (occupied_by_obstacle c31)
        (occupied_by_obstacle c32)
        (occupied_by_obstacle c33)
        (occupied_by_obstacle c34)
        (occupied_by_obstacle c35)
        (occupied_by_obstacle c38)
        (occupied_by_obstacle c39)
        (occupied_by_obstacle c40)
        (occupied_by_obstacle c49)
        (occupied_by_obstacle c50)
        (occupied_by_obstacle c51)
        (occupied_by_obstacle c54)
        (occupied_by_obstacle c55)
        (occupied_by_obstacle c56)
        (occupied_by_obstacle c57)
        (occupied_by_obstacle c58)
        (occupied_by_obstacle c59)
        (occupied_by_obstacle c62)
        (occupied_by_obstacle c63)
        (occupied_by_obstacle c64)

        (occupied_by_box c28)
        (occupied_by_box c29)
        (occupied_by_box c36)
        (occupied_by_box c37)
       
    )
 
    (:goal
        (and
            (robot_at_cell robot1 c4)
            (robot_at_cell robot2 c5)
            (robot_at_cell robot3 c60)
            (robot_at_cell robot4 c61)

            (box_at_cell box1 c17)
            (arrived_at_dest box1 c17)
            (box_at_cell box2 c24)
            (arrived_at_dest box2 c24)
            (box_at_cell box3 c41)
            (arrived_at_dest box3 c41)
            (box_at_cell box4 c48)
            (arrived_at_dest box4 c48)
        )
    )
)