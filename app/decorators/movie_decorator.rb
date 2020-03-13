class MovieDecorator < Draper::Decorator
  delegate_all

  def release_year
    IntegerToRoman.call(model.release_year)
  end
end