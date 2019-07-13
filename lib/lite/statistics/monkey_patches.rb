# frozen_string_literal: true

module Enumerable

  {
    mean: Lite::Statistics::Mean,
    median: Lite::Statistics::Median,
    mode: Lite::Statistics::Mode
  }.each do |name, klass|
    define_method(name) { klass.calculate(self) }
  end

  alias average mean

end
