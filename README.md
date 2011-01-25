**Mapper 1.0 - A tiny geo coordinate converter - basically for plotting latitude/longitude pairs to an image**

Installation
------------
* sudo gem install mapper

Usage
-----
* `require 'mapper'`
* `# now just initialize it with two known points on your map and you are ready to go!`
* `mapper = Mapper.new({:lat=>48.13,:lon=>11.57,:x=>278,:y=>503}, {:lat=>53.55,:lon=>9.99,:x=>206,:y=>114})`
* `mapper.add_point(:lat=>52.52, :lon=>13.41)`
* `mapper.add_point(:x=>136, :y=>410)`
* `mapper.each_point{|point| p point}`
* `->  {:lat=>52.52, :lon=>13.41, :x=>361.848101265823, :y=>187.924354243542}`
* `->  {:lat=>49.4257840616967, :lon=>8.45388888888889, :x=>136, :y=>410}`

Notes
-----
* Mapper assumes your map is in the mercator projection! (http://en.wikipedia.org/wiki/Mercator_projection)
* Luckily a lot of maps are: GoogleMaps, OpenStreetMap, ... :)
* Mapper is NOT a high precision tool! But in most cases it should be just okay enough. 

