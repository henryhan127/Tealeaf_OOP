# player picks one
# computer picks one
# compare
# play again?

def say(message)
  puts "=>" + message
end


class Player

  attr_accessor :choice
  
  def initialize
    @choice
  end

  def pick
    begin  
      say "Pick paper, rock or scissors. (P/R/S)"
      self.choice = gets.chomp.upcase
    end until Paper_Rock_Scissors::CHOICES.keys.include?(choice)
      say "You pick #{Paper_Rock_Scissors::CHOICES[choice]}." 
  end

end

class Computer

  attr_accessor :choice
  
  def initialize
    @choice
  end

  def pick
    self.choice = Paper_Rock_Scissors::CHOICES.keys.sample
    say "Computer picks #{Paper_Rock_Scissors::CHOICES[choice]}."
  end

end


class Paper_Rock_Scissors

  attr_accessor :player, :computer, :play_or_not

  CHOICES = {'P' => 'Paper', 'R' => 'Rock', 'S' => 'Scissors'} 

  def initialize
    @player = Player.new
    @computer = Computer.new
    @play_or_not = "Y"
  end

  def winning_call(winning_choice)
    case winning_choice 
    when "R"
      say "Rock smashes Scissors."
    when "S"
      say "Scissors cut Paper."
    when "P"
      say "Paper wraps Rock."
    end
  end

  def check_win
    if player.choice == computer.choice   
      say "It's a tie."
    elsif ([player.choice, computer.choice] == ["R", "S"]) || ([player.choice, computer.choice] == ["S", "P"]) || ([player.choice, computer.choice] == ["P", "R"])
      winning_call(player.choice)
      say "You win!"
    else
      winning_call(computer.choice)
      say "You lose!"
    end
  end

  def check_play_or_not
    begin
      say "Play again?(Y/N)"
      self.play_or_not = gets.chomp.upcase
    end until ["Y", "N"].include?(play_or_not) 
  end

  def run
    say "Welcome to Paper Rock Scissors!"
    until play_or_not == "N"
      player.pick
      computer.pick
      check_win
      check_play_or_not
    end 
    exit
  end

end

game = Paper_Rock_Scissors.new
game.run