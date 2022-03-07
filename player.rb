# Pair programming by Paul Bodnar and Jordan Benson


class Player
  attr_accessor :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end
end