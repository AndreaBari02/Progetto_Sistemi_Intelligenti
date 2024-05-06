# Progetto_Sistemi_Intelligenti
This repository contains multiple files that allow the user to obtain paths for robots tasked with transporting objects in a warehouse.
In particular, you can find:
Different versions of the grid, namely: 4x4, 5x5, 6x6, and 7x7. For each of them, different problems have been instantiated.
4x4 Grid: the first version of the problem, which includes one robot, one box, and 3 obstacles.
5x5 Grid: grid used for versions 2 and 3. Version 2 includes one robot, 2 boxes, and 6 obstacles, while version 3 features 2 robots, 2 boxes, and 10 obstacles.
6x6 Grid: grid used for versions 4 and 5. Version 4 includes 2 robots, 2 boxes, and 10 obstacles, while version 5 has 3 robots, 3 boxes, and 12 obstacles.
7x7 Grid: grid used for versions 6 and 7. Version 6 includes 2 robots, 4 boxes, and 22 obstacles, while version 7 has 3 robots, 3 boxes, and 24 obstacles.
8x8 Grid: grid used for version 8, which includes 4 robots, 4 boxes, and 36 obstacles.

A GUI containing the necessary files to display the sequence of actions produced as output.

The grid's characterization is carried out in the problem file of each version, while the domain file remains the same and should not be changed. If you want to change the arrangement of elements, you must operate on the problem file.
To view the found program, open the folder with the desired version from the terminal using the cd command. Then type java -jar enhsp.jar -o "domain_name" -f "problem_name" -planner sat-had for a sub-optimal plan, otherwise java -jar enhsp.jar -o "domain_name" -f "problem_name" -planner opt-hmax for an optimal resolution. The planner used is ENHSP, installable from the link https://gitlab.com/enricos83/ENHSP-Public. This must be located in the same folder as the domain file and the problem file.

For the video display of the output, copy the sequence of actions from the file named "Output.txt" into the GUI folder. Then update the paths of the problem file in the "Main" class and the "Grid" class. Run the program.
