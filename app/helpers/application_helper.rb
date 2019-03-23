module ApplicationHelper

  def minutes_ago
    @minutes_ago = @seconds_ago / 60
  end

  def within_1hours?
    if minutes_ago < 60
      return true
    end
  end

  def hours_ago
    @hours_ago = @seconds_ago / (60 * 60)
  end

  def within_1days?
    if hours_ago < 24
      return true
    end
  end

  def days_ago
    @days_ago = @seconds_ago / (60 * 60 * 24)
  end

  def within_1weeks?
    if @seconds_ago < (60 * 60 * 24 * 8)
      return true
    end
  end
end
