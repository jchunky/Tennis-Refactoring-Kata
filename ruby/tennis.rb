class Tennis < Struct.new(:player1, :player2, :points1, :points2)
  def initialize(player1, player2)
    super(player1, player2, 0, 0)
  end

  def won_point(player)
    player == player1 ? self.points1 += 1 : self.points2 += 1
  end

  def score
    if points1 == points2 && points1 <= 2
      "#{call1}-All"
    elsif points1 == points2
      "Deuce"
    elsif [points1, points2].max <= 3
      "#{call1}-#{call2}"
    elsif (points1 - points2).abs == 1
      "Advantage #{leader}"
    else
      "Win for #{leader}"
    end
  end

  private

  def call1
    call(points1)
  end

  def call2
    call(points2)
  end

  def call(points)
    %w[Love Fifteen Thirty Forty][points]
  end

  def leader
    points1 > points2 ? player1 : player2
  end
end

class TennisGame1 < Tennis
end

class TennisGame2 < Tennis
end

class TennisGame3 < Tennis
end
