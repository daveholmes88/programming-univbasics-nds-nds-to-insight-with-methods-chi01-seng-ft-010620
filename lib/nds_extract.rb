$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input
def gross_for_director(director_data)
  director_total = 0
  number = directors_database[director_data]
  inner_len = directors_database[director_data].length
  director_index = 0
  while director_index < inner_len do
    director_total += director_database[number][:movies][director_index][:worldwide_gross]
    inner_index += 1
  end
  director_total
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(nds)
  result = {}
  Director_index = 0
  while director_index < nds.length do
	   director_name = nds[director_index][:name]
	    result[director_name] = 0
	    movie_index = 0
	       while movie_index < director_database[director_index][:movies].length do
		         result[director_name] += director_database[director_index][:movies][movie_index][:worldwide_gross]
		         movie_index += 1
	       end
      director_index += 1
  end
result
end
