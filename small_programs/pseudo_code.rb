=begin
1.)
make a method that takes two integers
- add both numbers to get the sum

def sum(num1, num2)
  num1 + num2
end
/////////////////////////////////

2.)
make a method that takes an a array for strings
- use the join class to concatenate the array of strings together

def concatenate(array)
  array.join
end
////////////////////////////////

3.)
make a method that takes an array of integers, and returns a new array every other element
- set an iterator
- set a new array
- use map class and every odd element even number would be pushed to the new array
=end

def every_other(array)
  first_array = []
  second_array = []
  iteration = 0
  array.each do
    if iteration.even?
      first_array << array[iteration]
    else
      second_array<< array[iteration]
    end
    iteration += 1
  end
      
  p first_array
  p second_array
end
every_other([1,4,7,2,5])