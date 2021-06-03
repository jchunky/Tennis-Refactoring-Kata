class Tennis < Struct.new(:player1, :player2, :points1, :points2)
  def initialize(player1, player2)
    super(player1, player2, 0, 0)
  end

  def won_point(player)
    player == player1 ? self.points1 += 1 : self.points2 += 1
  end

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
  def score
    result = ""
    tempScore = 0
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
end

class TennisGame2 < Tennis
  def score
    result = ""
    if (points1 == points2) && (points1 < 3)
      result = "Love" if points1 == 0
      result = "Fifteen" if points1 == 1
      result = "Thirty" if points1 == 2
      result += "-All"
    end
    result = "Deuce" if (points1 == points2) && (points1 > 2)
    result = "#{call1}-#{call2}" if (points1 > 0) && (points2 == 0)
    result = "#{call1}-#{call2}" if (points2 > 0) && (points1 == 0)
    result = "#{call1}-#{call2}" if (points1 > points2) && (points1 < 4)
    result = "#{call1}-#{call2}" if (points2 > points1) && (points2 < 4)
    result = "Advantage #{leader}" if (points1 > points2) && (points2 >= 3)
    result = "Advantage #{leader}" if (points2 > points1) && (points1 >= 3)
    result = "Win for #{leader}" if (points1 >= 4) && (points2 >= 0) && ((points1 - points2) >= 2)
    result = "Win for #{leader}" if (points2 >= 4) && (points1 >= 0) && ((points2 - points1) >= 2)
    result
  end
end

class TennisGame3 < Tennis
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
end
