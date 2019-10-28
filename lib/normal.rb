require 'item'

class Normal < Item

  def tick
    @days_remaining -= 1
    return if @quality == 0
    @quality -= 1
    @quality -= 1 if @days_remaining < 0
  end
end