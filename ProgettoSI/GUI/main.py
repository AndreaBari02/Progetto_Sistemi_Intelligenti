import griglia
import text
 
 
 
def main():
   
    problem_text_split = text.Lettore.split_text("griglia8x8/problem_8x8.pddl")
    problem_text_dynamic_split = text.Lettore.split_text("GUI/Output.txt")
    substring_init = text.Lettore.get_substring(problem_text_split, "robot_at_cell", "(:goal")  
    substring_dynamic = text.Lettore.get_substring(problem_text_dynamic_split, "Found", "Metric")
    num_robots = text.Lettore.get_number(problem_text_split, "robot", "(:objects", "box" )
    surface = griglia.Grid.initialize()  
    griglia.Grid.loop(surface, substring_init, substring_dynamic, num_robots)
 
main()