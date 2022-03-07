class Game
  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @player_turn = @player1
  end

  def question
    num1 = rand(20)
    num2 = rand(20)
    @sum = num1 + num2
    puts "Player #{@player_turn.name}: What does #{num1} plus #{num2} equal?"
  end

  def answer
    @answer = gets.chomp
  end
  
  def switch_player
    if @player_turn == @player1
        @player_turn = @player2
    else
        @player_turn = @player1
    end
  end

  def take_life(player)
    player.lives -= 1
  end
  
  def confirm
    if @answer.to_i == @sum
        puts "Player #{@player_turn.name}: YES! You are correct."
        switch_player
    else 
        puts "Player #{@player_turn.name}: Seriously? No!"
        take_life(@player_turn)
        switch_player
    end
    if @player1.lives > 0 || @player2.lives > 0
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
  end

  def game_over?
    if @player1.lives == 0
      winner = @player2
    else 
      winner = @player1
    end
    puts "Player #{winner.name} wins with a score of #{winner.lives}/3"
    puts "Good bye!"
  end
  
  def play
    while @player1.lives > 0 && @player2.lives > 0
      question
      answer
      confirm
    end
    game_over?
  end
end
