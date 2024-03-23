def center_of(string)
  length = string.length / 2
  
  if string.length.odd?
    string[length]
  else  
    string.slice(length - 1, 2)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
