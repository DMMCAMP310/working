module ReviewsHelper
  def score_on_star(score)
    return "★★★★★" if score == 5
    return "★★★★" if score == 4
    return "★★★" if score == 3
    return "★★" if score == 2
    return "★" if score == 1
  end
end
