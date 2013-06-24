module Availability
  def availability
    super ? super.map(&:presence).compact : []
  end
end
