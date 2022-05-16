class Tennis
  attr_reader :player1, :player2, :p1, :p2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1 = 0
    @p2 = 0
  end

  def won_point(name)
    name == player1 ? @p1 += 1 : @p2 += 1
  end

  def leader
    p1 > p2 ? player1 : player2
  end

  def description(points)
    %w[Love Fifteen Thirty Forty][points]
  end
end

class TennisGame1 < Tennis
  attr_reader :player1, :player2, :p1, :p2

  def score
    if p1 == p2 && p1 <= 2
      "#{description(p1)}-All"
    elsif p1 == p2
      "Deuce"
    elsif [p1, p2].max <= 3
      "#{description(p1)}-#{description(p2)}"
    elsif (p1 - p2).abs == 1
      "Advantage #{leader}"
    else
      "Win for #{leader}"
    end
  end
end

class TennisGame2 < Tennis
  def score
    result = ""
    if (@p1 == @p2) && (@p1 < 3)
      result = "Love" if @p1 == 0
      result = "Fifteen" if @p1 == 1
      result = "Thirty" if @p1 == 2
      result += "-All"
    end
    result = "Deuce" if (@p1 == @p2) && (@p1 > 2)
    result = "#{description(p1)}-#{description(p2)}" if (@p1 > 0) && (@p2 == 0)
    result = "#{description(p1)}-#{description(p2)}" if (@p2 > 0) && (@p1 == 0)
    result = "#{description(p1)}-#{description(p2)}" if (@p1 > @p2) && (@p1 < 4)
    result = "#{description(p1)}-#{description(p2)}" if (@p2 > @p1) && (@p2 < 4)
    result = "Advantage #{@player1}" if (@p1 > @p2) && (@p2 >= 3)
    result = "Advantage #{@player2}" if (@p2 > @p1) && (@p1 >= 3)
    result = "Win for #{@player1}" if (@p1 >= 4) && (@p2 >= 0) && ((@p1 - @p2) >= 2)
    result = "Win for #{@player2}" if (@p2 >= 4) && (@p1 >= 0) && ((@p2 - @p1) >= 2)
    result
  end
end

class TennisGame3 < Tennis
  def score
    if p1 == p2 && p1 <= 2
      "#{description(p1)}-All"
    elsif p1 == p2
      "Deuce"
    elsif [p1, p2].max <= 3
      "#{description(p1)}-#{description(p2)}"
    elsif (p1 - p2).abs == 1
      "Advantage #{leader}"
    else
      "Win for #{leader}"
    end
  end
end
