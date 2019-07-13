# frozen_string_literal: true

class Array

  def mean
    Lite::Statistics::Mean.calculate(self)
  end

  alias average mean

end
