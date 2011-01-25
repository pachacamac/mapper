class Mapper
  attr_reader :reference_point1, :reference_point2, :zero_point
  attr_reader :x_factor, :y_factor
  attr_reader :points

  def initialize(reference_point1={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0}, reference_point2={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0})
    @reference_point1 = reference_point1; @reference_point2 = reference_point2
    @x_factor = (reference_point1[:x] - reference_point2[:x]) / (reference_point1[:lon] - reference_point2[:lon]).to_f
    @y_factor = (reference_point1[:y] - reference_point2[:y]) / (reference_point1[:lat] - reference_point2[:lat]).to_f
    @zero_point = {:lon => reference_point1[:lon] - reference_point1[:x] / @x_factor, :x => 0,
           :lat => reference_point1[:lat] - reference_point1[:y] / @y_factor, :y => 0}
    @points = []
  end

  def add_points(*points)
    points.each{|point| add_point(point)}
  end
  
  def add_point(point)
    @points << get_coords(point)
  end
  
  def clear_points
    @points = []
  end
  
  def get_coords( point={:lon=>0.0,:lat=>0.0} )
    if point[:lat] && point[:lon] #calculate x/y
      point.merge!({:x=>(point[:lon] - @zero_point[:lon]) * @x_factor,
                    :y=>(point[:lat] - @zero_point[:lat]) * @y_factor})
    elsif point[:x] && point[:y] #calculate lat/lon
      point.merge!({:lon=>(point[:x] / @x_factor) + @zero_point[:lon],
                    :lat=>(point[:y] / @y_factor) + @zero_point[:lat]})
    end
    point
  end

  def each_point
    @points.each{|point| yield point}
  end
  
end
