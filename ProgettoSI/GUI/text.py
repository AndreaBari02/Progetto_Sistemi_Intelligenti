class Lettore():

    #reads and splits a text passed as argument
    def split_text(text_file):
        text = open(text_file, 'r')
        text_read = text.read()
        text_split = text_read.split()
        return(text_split)
    
    #returns a substring of an initial text, given the first and the last word of the desired substring
    def get_substring(text, first, last):
        substring = []
        save = 0
        for t in (text):
            if last in t:
                return substring
            if first in t:
                save = 1
            if save == 1:
                substring.append(t)

    #returns the number of words in a text passed as argument
    def get_number(text, word, first, last):
        substring = Lettore.get_substring(text, first, last)
        words_occurences = 0
        for value in substring:
            if word in value:
                words_occurences += 1
        return words_occurences - 1
