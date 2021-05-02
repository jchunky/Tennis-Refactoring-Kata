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

  private

  def leader
    p1 > p2 ? name1 : name2
  end

  def call1
    call(p1)
  end

  def call2
    call(p2)
  end

  def call(points)
    %w[Love Fifteen Thirty Forty][points]
  end
end

class TennisGame1 < Tennis
  def score
    if [p1, p2].max >= 4 && (p1 - p2).abs >= 2
      "Win for #{leader}"
    elsif [p1, p2].max >= 4 && (p1 - p2).abs == 1
      "Advantage #{leader}"
    elsif p1 == p2 && p1 >= 3
      "Deuce"
    elsif p1 == p2
      "#{call1}-All"
    else
      "#{call1}-#{call2}"
    end
  end
end

class TennisGame2 < Tennis
  def score
    if [p1, p2].max <= 3 && p1 != p2
      "#{call1}-#{call2}"
    elsif (p1 - p2).abs >= 2
      "Win for #{leader}"
    elsif (p1 - p2).abs >= 1
      "Advantage #{leader}"
    elsif p1 >= 3
      "Deuce"
    else
      "#{call1}-All"
    end
  end
end

class TennisGame3 < Tennis
  def score
    if p1 == p2 && p1 <= 2
      "#{call1}-All"
    elsif p1 == p2
      "Deuce"
    elsif [p1, p2].max <= 3
      "#{call1}-#{call2}"
    elsif (p1 - p2).abs == 1
      "Advantage #{leader}"
    else
      "Win for #{leader}"
    end
  end
end
