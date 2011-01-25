class Mapper < Array
  attr_reader :reference_point1, :reference_point2, :zero_point
  attr_reader :x_factor, :y_factor

  def initialize(reference_point1={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0}, reference_point2={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0})
    @reference_point1 = reference_point1; @reference_point2 = reference_point2
    @x_factor = (reference_point1[:x] - reference_point2[:x]) / (reference_point1[:lon] - reference_point2[:lon]).to_f
    @y_factor = (reference_point1[:y] - reference_point2[:y]) / (reference_point1[:lat] - reference_point2[:lat]).to_f
    @zero_point = {:lon => reference_point1[:lon] - reference_point1[:x] / @x_factor, :x => 0,
                   :lat => reference_point1[:lat] - reference_point1[:y] / @y_factor, :y => 0}
  end
  
  def get_coords( point={:lon=>0.0,:lat=>0.0} )
    point.merge!(:x => (point[:lon] - @zero_point[:lon]) * @x_factor) if point[:lon] && !point[:x]
    point.merge!(:y => (point[:lat] - @zero_point[:lat]) * @y_factor) if point[:lat] && !point[:y]
    point.merge!(:lon => (point[:x] / @x_factor) + @zero_point[:lon]) if point[:x] && !point[:lon]
    point.merge!(:lat => (point[:y] / @y_factor) + @zero_point[:lat]) if point[:y] && !point[:lat]
    point
  end

  def add_point(point)
    self << get_coords(point)
  end
end
