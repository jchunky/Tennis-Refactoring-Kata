class TennisGame1
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

  def score
    if p1 == p2 && p1 <= 2
      score_for(p1) + "-All"
    elsif p1 == p2
      "Deuce"
    elsif [p1, p2].max <= 3
      score_for(p1) + "-" + score_for(p2)
    elsif (p1 - p2).abs == 1
      "Advantage " + leader
    else
      "Win for " + leader
    end
  end

  private

  def score_for(points)
    %w[Love Fifteen Thirty Forty][points]
  end

  def leader
    p1 > p2 ? name1 : name2
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score
    else
      p2Score
    end
  end

  def score
    result = ""
    if (@p1points == @p2points) && (@p1points < 3)
      result = "Love" if @p1points == 0
      result = "Fifteen" if @p1points == 1
      result = "Thirty" if @p1points == 2
      result += "-All"
    end
    result = "Deuce" if (@p1points == @p2points) && (@p1points > 2)

    p1res = ""
    p2res = ""
    if (@p1points > 0) && (@p2points == 0)
      p1res = "Fifteen" if @p1points == 1
      p1res = "Thirty" if @p1points == 2
      p1res = "Forty" if @p1points == 3
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0) && (@p1points == 0)
      p2res = "Fifteen" if @p2points == 1
      p2res = "Thirty" if @p2points == 2
      p2res = "Forty" if @p2points == 3

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points > @p2points) && (@p1points < 4)
      p1res = "Thirty" if @p1points == 2
      p1res = "Forty" if @p1points == 3
      p2res = "Fifteen" if @p2points == 1
      p2res = "Thirty" if @p2points == 2
      result = p1res + "-" + p2res
    end
    if (@p2points > @p1points) && (@p2points < 4)
      p2res = "Thirty" if @p2points == 2
      p2res = "Forty" if @p2points == 3
      p1res = "Fifteen" if @p1points == 1
      p1res = "Thirty" if @p1points == 2
      result = p1res + "-" + p2res
    end
    result = "Advantage " + @player1Name if (@p1points > @p2points) && (@p2points >= 3)
    result = "Advantage " + @player2Name if (@p2points > @p1points) && (@p1points >= 3)
    result = "Win for " + @player1Name if (@p1points >= 4) && (@p2points >= 0) && ((@p1points - @p2points) >= 2)
    result = "Win for " + @player2Name if (@p2points >= 4) && (@p1points >= 0) && ((@p2points - @p1points) >= 2)
    result
  end

  def setp1Score(number)
    (0..number).each do |_i|
      p1Score
    end
  end

  def setp2Score(number)
    (0..number).each do |_i|
      p2Score
    end
  end

  def p1Score
    @p1points += 1
  end

  def p2Score
    @p2points += 1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if ((@p1 < 4) && (@p2 < 4)) && (@p1 + @p2 < 6)
      p = %w[Love Fifteen Thirty Forty]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if @p1 == @p2
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1 - @p2) * (@p1 - @p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
