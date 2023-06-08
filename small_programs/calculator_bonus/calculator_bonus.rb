
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=>#{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  word = case op
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
              'Multiplying'
           when '4'
              'Dividing'
          end
  
  x = "Random line of code"
  
  word
end

prompt(MESSAGES['welcome'])
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")
number1 = ''
number2 = ''
loop do
  loop do
    prompt("Enter the first number")
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt("Invalid number")
    end
  end
  loop do
    prompt("Enter the second number")
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt("Invalid number")
    end
  end
  operator_prompt = <<-MSG
    What operation would you like?
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("You must choose: 1, 2, 3, or 4")
    end
  end
  prompt("#{operation_to_message(operator)} the two numbers..")  
  result = case operator
             when '1'
                number1.to_i() + number2.to_i()
             when '2'
                number1.to_i() - number2.to_i()
             when '3'
                number1.to_i() * number2.to_i()
             when '4'
                number1.to_f() / number2.to_f()
           end
  prompt("The result it #{result}")
  prompt("Enter 'Y' if you want to go over again")
  answer = Kernel.gets().chomp().downcase()
  break until answer.start_with?('y')
end