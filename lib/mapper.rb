class Mapper
  attr_reader :rp1, :rp2, :zp
  attr_reader :x_factor, :y_factor
  attr_reader :points

  def initialize(rp1={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0}, rp2={:lat=>0.0,:lon=>0.0,:x=>0,:y=>0})
    @rp1 = rp1; @rp2 = rp2
    @x_factor = (rp1[:x] - rp2[:x]) / (rp1[:lon] - rp2[:lon]).to_f
    @y_factor = (rp1[:y] - rp2[:y]) / (rp1[:lat] - rp2[:lat]).to_f
    @zp = {:lon => rp1[:lon] - rp1[:x] / @x_factor, :x => 0,
           :lat => rp1[:lat] - rp1[:y] / @y_factor, :y => 0}
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
      point.merge!({:x=>(point[:lon] - @zp[:lon]) * @x_factor,
                    :y=>(point[:lat] - @zp[:lat]) * @y_factor})
    elsif point[:x] && point[:y] #calculate lat/lon
      point.merge!({:lon=>(point[:x] / @x_factor) + @zp[:lon],
                    :lat=>(point[:y] / @y_factor) + @zp[:lat]})
    end
    point
  end

  def each_point
    @points.each{|point| yield point}
  end
  
end
