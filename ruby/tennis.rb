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

  def leader
    p1 > p2 ? player1 : player2
  end

  def description(points)
    %w[Love Fifteen Thirty Forty][points]
  end
end

class TennisGame1 < Tennis
end

class TennisGame2 < Tennis
end

class TennisGame3 < Tennis
end
