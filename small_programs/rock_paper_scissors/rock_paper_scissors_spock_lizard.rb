VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=>#{message}"
end

def choice_input(input)
  word = case input
         when 'r'
           'Rock'
         when 'p'
           'Paper'
         when 's'
           'Scissors'
         when 'sp'
           'Spock'
         when 'l'
           'Lizard'
         end
  word
end

def win?(first, second)
  ((first == 'Rock' || first == 'Spock') && second == 'Scissors') ||
    ((first == 'Scissors' || first == 'Lizard') && second == 'Paper') ||
    ((first == 'Paper' || first == 'Spock') && second == 'Rock') ||
    ((first == 'Lizard' || first == 'Paper') && second == 'Spock') ||
    ((first == 'Rock' || first == 'Scissors') && second == 'Lizard')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("Player WON!")
  elsif win?(computer, player)
    prompt("Computer WON!")
  else
    prompt("It's TIE!")
  end
end
name = String.new

loop do
  prompt("Enter name:")
  name = Kernel.gets().chomp()
  if name.empty?
    prompt("Invalid!")
  else
    break
  end
end

prompt("Welcome to Rock-Paper-Scissors+! #{name}")
instructions = <<-MSG
  How to play:
    Scissors cuts Paper         (Scissors Wins!)
    Scissors decapitates Lizard (Scissors Wins!)
    ---------------------------------------------
    Paper covers Rock           (Paper Wins!)
    Paper disproves Spock       (Paper Wins!)
    ---------------------------------------------
    Rock crushes Lizard         (Rock Wins!)
    Rock crushes Scissors       (Rock Wins!)
    ---------------------------------------------
    Lizard poisons Spock        (Lizard Win!)
    Lizard eats Paper           (Lizard Wins!)
    ---------------------------------------------
    Spock smashes Scissors      (Spock Wins!)
    Spock vaporizes Rock        (Spock Wins!)
MSG
prompt(instructions)

loop do
  choice = String.new
  player_score = 0
  computer_score = 0
  loop do
    loop do
      choice_prompt = <<-MSG
        Pick one of the following:
          'r' Rock
          'p' Paper
          's' Scissors
          'sp' Spock
          'l' Lizard
      MSG
      prompt(choice_prompt)
      choice = Kernel.gets().chomp().downcase()
      if %w(r p s sp l).include?(choice)
        break
      else
        prompt("Invalid choice")
      end
    end
    computer_choice = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard'].sample
    prompt("You picked: #{choice_input(choice)}")
    prompt("The Computer picked: #{computer_choice}")
    display_results(choice_input(choice), computer_choice)
    if win?(choice_input(choice), computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice_input(choice))
      computer_score += 1
    end
    prompt("Your score:#{player_score} || Computer's score: #{computer_score}")
    if player_score == 3
      prompt("YOU WON!")
      break
    elsif computer_score == 3
      prompt("COMPUTER WON!")
      break
    end
  end
  prompt("Enter 'Y' if you want to play again.")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.include?('y')
end

prompt("Thank you for playing!")
