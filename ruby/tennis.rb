class Player
  SCORES = %w[Love Fifteen Thirty Forty]

  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def won_point
    @score += 1
  end

  def score_name
    SCORES[score]
  end
end

class TennisGame
  attr_reader :player1, :player2

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end

  def won_point(player_name)
    player = player_name == player1.name ? player1 : player2
    player.won_point
  end

  def score
    case
    when max_score <= 2 && score_diff == 0 then "#{player1.score_name}-All"
    when max_score >= 3 && score_diff == 0 then "Deuce"
    when max_score <= 3 && score_diff >= 1 then "#{player1.score_name}-#{player2.score_name}"
    when max_score >= 4 && score_diff == 1 then "Advantage #{leader.name}"
    when max_score >= 4 && score_diff >= 2 then "Win for #{leader.name}"
    end
  end

  private

  def max_score
    [player1.score, player2.score].max
  end

  def score_diff
    (player1.score - player2.score).abs
  end

  def leader
    player1.score > player2.score ? player1 : player2
  end
end

class TennisGame1 < TennisGame; end
class TennisGame2 < TennisGame; end
class TennisGame3 < TennisGame; end
