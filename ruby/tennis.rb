class Tennis
  attr_reader :player1, :player2, :p1, :p2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1 = 0
    @p2 = 0
  end

  def score
    case
    when normal_score? then "#{description(p1)}-#{description(p2)}"
    when tie_game? then "#{description(p1)}-All"
    when deuce? then "Deuce"
    when advantage? then "Advantage #{leader}"
    when win? then "Win for #{leader}"
    end
  end

  def won_point(player)
    player == player1 ? @p1 += 1 : @p2 += 1
  end

  private

  def normal_score?
    p1 != p2 && [p1, p2].max <= 3
  end

  def tie_game?
    p1 == p2 && p1 <= 2
  end

  def deuce?
    p1 == p2 && p1 >= 3
  end

  def advantage?
    [p1, p2].max >= 4 && (p1 - p2).abs == 1
  end

  def win?
    [p1, p2].max >= 4 && (p1 - p2).abs >= 2
  end

  def leader
    p1 > p2 ? player1 : player2
  end

  def description(points)
    %w[Love Fifteen Thirty Forty][points]
  end
end

class TennisGame1 < Tennis; end
class TennisGame2 < Tennis; end
class TennisGame3 < Tennis; end
