VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissor' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

choice = String.new
loop do
  loop do
    prompt("Choose one: rock, paper, scissors")
    choice = Kernel.gets().chomp().downcase()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = ['rock', 'paper', 'scissors'].sample
  Kernel.puts("You chose: #{choice}. The computer chose: #{computer_choice}")
  display_results(choice, computer_choice)
  prompt("Do you want to play again?(Y/N)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for playing!")
