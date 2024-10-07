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
    !scores_equal? && max_score <= 3
  end

  def tie?
    scores_equal? && score1 <= 2
  end

  def deuce?
    scores_equal? && score1 >= 3
  end

  def advantage?
    max_score >= 4 && score_diff == 1
  end

  def win?
    max_score >= 4 && score_diff >= 2
  end

  def scores_equal?
    score1 == score2
  end

  def max_score
    [score1, score2].max
  end

  def score_diff
    (score1 - score2).abs
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
