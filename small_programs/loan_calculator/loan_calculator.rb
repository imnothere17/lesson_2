def prompt(message)
  puts "=> #{message}"
end

def integer?(num)
  num.to_i().to_s() == num
end

answer = ''
loop do
  prompt("Welcome to calculator!")
  prompt("Please enter your name.")
  name = ''
  amount, interest, duration = ''
  loop do
    name = Kernel.gets().chomp()
    name.empty? ? prompt("Invalid") : break
  end
  loop do
    prompt("Enter your loan amount.")
    amount = Kernel.gets().chomp()
    if integer?(amount)
      break
    else
      prompt("Invalid number!")
    end
  end
  loop do
    prompt("Enter your monthly interest rate.")
    prompt("Example: 5 for 5% or 25 for 25%")
    interest = Kernel.gets().chomp()
    if integer?(amount)
      break
    else
      prompt("Invalid number!")
    end
  end
  loop do
    prompt("Enter your loan duration (in years)")
    duration = Kernel.gets().chomp()
    if integer?(duration)
      break
    else
      prompt("Invalid number!")
    end
  end
  interest = interest.to_f() / 100
  monthly_payment = amount.to_i() *
                    (interest.to_f() /
                    (1 - (1 + interest.to_f())**(-duration.to_i())))
  monthly = monthly_payment.round(2)
  prompt("Your monthly payment would be: #{monthly}")
  prompt("Would you like to calculate again? Enter 'Y'")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end
