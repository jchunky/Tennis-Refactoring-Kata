class TennisGame < Struct.new(:player1, :player2, :score1, :score2)
  def initialize(player1, player2)
    super(player1, player2, 0, 0)
  end

  def won_point(player)
    player == player1 ? self.score1 += 1 : self.score2 += 1
  end

  def score
    case
    when !tied? && max_score <= 3
      "#{score_name(score1)}-#{score_name(score2)}"
    when tied? && score1 <= 2
      "#{score_name(score1)}-All"
    when tied? && score1 >= 3
      "Deuce"
    when max_score >= 4 && score_diff == 1
      "Advantage #{leader}"
    when max_score >= 4 && score_diff >= 2
      "Win for #{leader}"
    end
  end

  private

  def score_diff
    (score1 - score2).abs
  end

  def max_score
    [score1, score2].max
  end

  def tied?
    score1 == score2
  end

  def score_name(score)
    %w[Love Fifteen Thirty Forty][score]
  end

  def leader
    score1 > score2 ? player1 : player2
  end
end

class TennisGame1 < TennisGame; end
class TennisGame2 < TennisGame; end
class TennisGame3 < TennisGame; end
