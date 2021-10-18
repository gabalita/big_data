# Nowhere in the code is a file imported or opened. 
# The mrjob library works by reading in a file passed to it in the terminal.


from mrjob.job import MRJob
class Bacon_count(MRJob):

    # Divides up the work
   def mapper(self, _, line):
       for word in line.split():
           if word.lower() == "bacon":
               yield "bacon", 1


    # Notes: 
    # The second parameter (here using an underscore (_), 
    # allows methods to be mapped together. 
    # Since we are not chaining anything together, we use 
    # the Python convention of an underscore to indicate 
    # that we won’t use this parameter. The line parameter 
    # will be the line of text taken from the raw input file.

    # Aggregates the numbers
   def reducer(self, key, values):
       yield key, sum(values)

    # Notes:
    # The values parameter is a list of values created in the
    #  mapper function. We want to sum all of these values. 
    # Recall that from the mapper function the yield was used 
    # to produce multiple outputs. With the reducer we'll 
    # produce the key and sum of all the values assigned with it:


if __name__ == "__main__":
   Bacon_count.run()