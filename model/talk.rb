class Talk
  attr_reader :title, :duration_time

  LIGHTNING_DURATION = 5

  def initialize(title, duration_time)
    @title = title
    @duration_time = duration_time
  end

  def to_print
    "#{@title}"
  end
end
