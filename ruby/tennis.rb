class Tennis
  attr_reader :name1, :name2, :p1, :p2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @p1 = 0
    @p2 = 0
  end

  def won_point(name)
    name == name1 ? @p1 += 1 : @p2 += 1
  end

  def leader
    p1 > p2 ? name1 : name2
  end

  def description(points)
    %w[Love Fifteen Thirty Forty][points]
  end
end

class TennisGame1 < Tennis
  def score
    if p1 == p2 && p1 <= 2
      "#{description(p1)}-All"
    elsif p1 == p2
      "Deuce"
    elsif [p1, p2].max <= 3
      "#{description(p1)}-#{description(p2)}"
    elsif (p1 - p2).abs == 1
      minusResult = p1 - p2
      "Advantage #{leader}"
    else
      minusResult = p1 - p2
      "Win for #{leader}"
    end
  end
end

class TennisGame2 < Tennis
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
end

class TennisGame3 < Tennis
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
end
