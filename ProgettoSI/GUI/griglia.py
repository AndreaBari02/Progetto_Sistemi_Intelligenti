import sys
import pygame
import matplotlib.image as mpimg  # type: ignore
from text import Lettore
import colors
clock = pygame.time.Clock()

 
 
CELL_SIZE = 80
NUM_ROWS = int ((Lettore.get_number(Lettore.split_text("griglia8x8/problem_8x8.pddl"), "c", "(:objects", "(:init") **0.5 )+ 0.5) #numero celle per lato
NUM_COLUMNS = int ((Lettore.get_number(Lettore.split_text("griglia8x8/problem_8x8.pddl"), "c", "(:objects", "(:init") **0.5 )+ 0.5)
GRID_LENGHT = NUM_ROWS * CELL_SIZE
TOTAL_CELLS = NUM_ROWS * NUM_COLUMNS
 
class Grid:
 
 
    #initializes the grid with dimensions and lines
    def initialize():
        pygame.init()
        surface = pygame.display.set_mode((GRID_LENGHT, GRID_LENGHT))
        pygame.display.set_caption("Griglia")
        surface.fill(colors.BLACK)
        for x in range(0, GRID_LENGHT, CELL_SIZE): 
            pygame.draw.line(surface, colors.WHITE, (x, 0), (x, GRID_LENGHT))
        for y in range(0, GRID_LENGHT, CELL_SIZE):
            pygame.draw.line(surface, colors.WHITE, (0, y), (GRID_LENGHT, y))
        return surface
   
 
 
    #draws vertical and horizontal lines of the grid
    def draw_lines(surface):  
        for x in range(0, GRID_LENGHT, CELL_SIZE):
            pygame.draw.line(surface, colors.WHITE, (x, 0), (x, GRID_LENGHT))
        for y in range(0, GRID_LENGHT, CELL_SIZE):
            pygame.draw.line(surface, colors.WHITE, (0, y), (GRID_LENGHT, y))
 
 
    #returns the column of a cell passed as an argument    
    def return_column (unknown_cell):
        current_cell = 1
        for i in range(int(NUM_ROWS)):
            for j in range (int(NUM_COLUMNS)):
                if ("c"+ str(current_cell) +")" == str(unknown_cell)) or ("c"+ str(current_cell) == str(unknown_cell)):
                    return j
                current_cell = current_cell +1
 
 
 
    #returns the row of a cell passed as an argument
    def return_row (unknown_cell):
        current_cell = 1
        for i in range(int(NUM_COLUMNS)):
            for j in range (int(NUM_ROWS)):
                if ("c"+ str(current_cell) +")" == str(unknown_cell)) or ("c"+ str(current_cell) == str(unknown_cell)) :
                    return i
                current_cell = current_cell + 1
 
 
 
    #sets the color of a cell of the grid passed as an argument
    def update_grid (color , cell, surface):
        i = Grid.return_row(cell)
        j = Grid.return_column(cell)
        my_rect = pygame.Rect(j*CELL_SIZE, i*CELL_SIZE, CELL_SIZE, CELL_SIZE)
        pygame.draw.rect(surface, color, my_rect)
 
 
 
    #sets the elements of the initial grid by reading from the file passed as an argument. In this case it is the problem file
    def initial_grid (text_file, surface):
        count = 0
     
        for index, value in enumerate(text_file):
            if ("robot_at_cell" in value):
                cell = text_file[count +2]
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\robot_free.png", cell, surface)
 
            elif ("box_at_cell" in value):
                cell = text_file[count +2]
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\box.png", cell, surface)
 
            elif ("occupied_by_obstacle" in value):
                cell = text_file[count +1]
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\x.png", cell, surface)
 
            count = count +1
        clock.tick(1.5)
        pygame.display.update()
        pygame.display.set_caption("Starting the execution in 3...")
        clock.tick(1.5)
        pygame.display.update()
        pygame.display.set_caption("Starting the execution in 2...")
        clock.tick(1.5)
        pygame.display.update()
        pygame.display.set_caption("Starting the execution in 1...")
        clock.tick(1.5)
        pygame.display.update()
         
 
   
    #changes the elements of the grid according to the file passed as an argument. In this case it is the problem file
    def dynamic_grid (text_file, surface, tot_robots):
        count = 0
        array_drop = [0 for int in range(tot_robots)] #array con zeri per tener conto dei drop
       
 
        for value in (text_file):    
            if ("(move_vertical_robot_free"  in value) or ("(move_horizontal_robot_free" in value):
                robot = text_file [count + 1]
                old_cell = text_file[count + 2] 
                new_cell = text_file [count + 3][:-1]
                current_robot_num = int (robot[-1])
                Grid.update_grid(colors.BLACK, old_cell, surface)
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\robot_free.png", new_cell, surface)
                pygame.display.set_caption("moving " + str(robot) + " from " + str(old_cell) + " to " + str(new_cell))
                if (array_drop[current_robot_num -1] == 1):
                    Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\box.png", old_cell, surface)
                    Grid.draw_lines(surface)
                    clock.tick(1.8)
                    pygame.display.update()
                    array_drop[current_robot_num -1] = 0
                Grid.draw_lines(surface)
                clock.tick(1.8)
                pygame.display.update()
               
           
            if "(grab" in value :
                robot = text_file[count + 1]
                box = text_file[count + 2]
                current_cell = text_file[count + 3][:-1] 
                Grid.update_grid(colors.BLACK ,current_cell, surface)
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\robot_with_box.png", current_cell, surface)
                pygame.display.set_caption( str(robot) + " is grabbing " + str(box) + " at cell " + str(current_cell))
                Grid.draw_lines(surface)
                clock.tick(1.8)
                pygame.display.update()
           
 
            if ("(move_vertical_robot_with_box"  in value) or ("(move_horizontal_robot_with_box" in value):
                robot = text_file [count + 1]
                box = text_file [count + 2]
                old_cell = text_file[count + 3] 
                new_cell = text_file [count + 4][:-1]
                Grid.update_grid(colors.BLACK, old_cell, surface)
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\robot_with_box.png", new_cell, surface)
                pygame.display.set_caption("moving " + str(robot) + " from " + str(old_cell) + " to " + str(new_cell) + " with " + str(box))
                Grid.draw_lines(surface)
                clock.tick(1.8)
                pygame.display.update()
               
 
            if "(drop" in value :
                robot = text_file[count + 1]
                box = text_file[count + 2]
                current_cell = text_file[count + 3][:-1] 
                Grid.update_grid(colors.BLACK, current_cell, surface)
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\box.png", current_cell, surface)
                Grid.draw_image(r"C:\Users\user\OneDrive\Documenti\ProgettoSI\GUI\images\robot_free.png", current_cell, surface)
                pygame.display.set_caption( str(robot) + " is dropping " + str(box) + " at cell " + str(current_cell))
                current_robot_num =  int(robot[-1])
                array_drop[current_robot_num -1] = 1
                Grid.draw_lines(surface)        
                clock.tick(1.8)
                pygame.display.update()
 
            count = count + 1 
        pygame.display.set_caption("Execution done")
        pygame.display.update()  
 
   
    #allows to create, update and exit the grid
    def loop(surface, text_init, text_dynamic, total_robot):
        first_grid = 0
 
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    sys.exit()
                if event.type == pygame.KEYDOWN:
                    pygame.quit()
                    sys.exit()
 
                if (first_grid == 0):
                    Grid.initial_grid(text_init,surface)
                    first_grid=1
           
                if (first_grid == 1):
                    Grid.dynamic_grid (text_dynamic, surface, total_robot)
                    first_grid =2
               
            pygame.display.update()
 
    def draw_image(image_path, cell, surface):
        i = Grid.return_row(cell)
        j = Grid.return_column(cell)
        img = mpimg.imread(image_path)
        img = pygame.image.load(image_path)
        img = pygame.transform.scale(img, (CELL_SIZE, CELL_SIZE))
        surface.blit(img, (j * CELL_SIZE, i * CELL_SIZE))
