class Player
  SCORE_LABELS = %w[Love Fifteen Thirty Forty]

  attr_reader :score, :name

  def initialize(name)
    @name = name
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def score_name = SCORE_LABELS[score]
end

class TennisGame
  attr_reader :player1, :player2

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end

  def won_point(player_name)
    player = player_name == player1.name ? player1 : player2
    player.increment_score
  end

  def score
    case
    when score_diff == 0 && max_score <= 2 then "#{leader.score_name}-All"
    when score_diff == 0 && max_score >= 3 then "Deuce"
    when score_diff == 1 && max_score >= 4 then "Advantage #{leader.name}"
    when score_diff >= 2 && max_score >= 4 then "Win for #{leader.name}"
    when score_diff >= 1 && max_score <= 3 then "#{player1.score_name}-#{player2.score_name}"
    end
  end

  private

  def leader     = [player1, player2].max_by(&:score)
  def max_score  = [player1, player2].map(&:score).max
  def score_diff = [player1, player2].map(&:score).reduce(&:-).abs
end

class TennisGame1 < TennisGame; end
class TennisGame2 < TennisGame; end
class TennisGame3 < TennisGame; end
