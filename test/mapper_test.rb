require File.join(File.expand_path(File.join(File.dirname(__FILE__))), '..', 'lib', 'mapper')
require 'test/unit'

class MapperTest < Test::Unit::TestCase
  MUNICH   = {:lat => 48.13, :lon => 11.57, :x => 278, :y => 503}
	BERLIN   = {:lat => 52.52, :lon => 13.41, :x => 361, :y => 191}
	HAMBURG  = {:lat => 53.55, :lon => 9.99,  :x => 206, :y => 114}
	MANNHEIM = {:lat => 49.48, :lon => 8.46,  :x => 136, :y => 410}
  
  def test_initialize
    mapper = Mapper.new(MUNICH, HAMBURG)
    assert (45.52 .. 45.62).include?(mapper.x_factor), 'wrong x_factor' # ~ 45.57
    assert (-71.82 .. -71.72).include?(mapper.y_factor), 'wrong x_factor' # ~ -71.77
    assert (55.09 .. 55.19).include?(mapper.zp[:lat]), 'wrong zp[:lat]' # ~ 55.14
    assert (5.42 .. 5.52).include?(mapper.zp[:lon]), 'wrong zp[:lon]' # ~ 5.47
  end
  
  def test_add_new_geo_coordinate
    mapper = Mapper.new(MUNICH, HAMBURG)
    mapper.add_point(:lat=>BERLIN[:lat], :lon=>BERLIN[:lon])
    assert (BERLIN[:x]-5 .. BERLIN[:x]+5).include? mapper.points.first[:x]
    assert (BERLIN[:y]-5 .. BERLIN[:y]+5).include? mapper.points.first[:y]
  end
  
  def test_add_new_map_coordinate
    mapper = Mapper.new(MUNICH, HAMBURG)
    mapper.add_point(:x=>BERLIN[:x], :y=>BERLIN[:y])
    assert (BERLIN[:lat]-0.1 .. BERLIN[:lat]+0.1).include? mapper.points.first[:lat]
    assert (BERLIN[:lon]-0.1 .. BERLIN[:lon]+0.1).include? mapper.points.first[:lon]
  end
  
end
