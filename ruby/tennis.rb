class TennisGame < Struct.new(:player1, :player2, :score1, :score2)
  def initialize(player1, player2)
    super(player1, player2, 0, 0)
  end

  def won_point(player_name)
    player_name == player1 ? self.score1 += 1 : self.score2 += 1
  end

  def score
    if normal_score?
      "#{describe(score1)}-#{describe(score2)}"
    elsif tied_score?
      "#{describe(score1)}-All"
    elsif deuce?
      "Deuce"
    elsif advantage?
      "Advantage #{leader}"
    elsif win?
      "Win for #{leader}"
    end
  end

  private

  def normal_score?
    !tied? && max_score <= 3
  end

  def tied_score?
    tied? && score1 <= 2
  end

  def deuce?
    tied? && score1 >= 3
  end

  def advantage?
    max_score >= 4 && score_difference == 1
  end

  def win?
    max_score >= 4 && score_difference >= 2
  end

  def describe(score)
    %w[Love Fifteen Thirty Forty][score]
  end

  def leader
    score1 > score2 ? player1 : player2
  end

  def tied?
    score1 == score2
  end

  def max_score
    [score1, score2].max
  end

  def score_difference
    (score1 - score2).abs
  end
end

class TennisGame1 < TennisGame; end
class TennisGame2 < TennisGame; end
class TennisGame3 < TennisGame; end
