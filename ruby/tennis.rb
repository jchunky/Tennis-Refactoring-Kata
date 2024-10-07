class TennisGame
  attr_reader :player1, :player2, :score1, :score2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @score1 = 0
    @score2 = 0
  end

  def won_point(player_name)
    player_name == player1 ? @score1 += 1 : @score2 += 1
  end

  def score
    case
    when normal_score? then "#{score_name(score1)}-#{score_name(score2)}"
    when tie? then "#{score_name(score1)}-All"
    when deuce? then "Deuce"
    when advantage? then "Advantage #{leader}"
    when win? then "Win for #{leader}"
    end
  end

  private

  def normal_score?
    score1 != score2 && [score1, score2].max <= 3
  end

  def tie?
    score1 == score2 && score1 <= 2
  end

  def deuce?
    score1 == score2 && score1 >= 3
  end

  def advantage?
    [score1, score2].max >= 4 && (score1 - score2).abs == 1
  end

  def win?
    [score1, score2].max >= 4 && (score1 - score2).abs >= 2
  end

  def leader
    score1 > score2 ? player1 : player2
  end

  def score_name(score)
    %w[Love Fifteen Thirty Forty][score]
  end
end

class TennisGame1 < TennisGame; end
class TennisGame2 < TennisGame; end
class TennisGame3 < TennisGame; end
