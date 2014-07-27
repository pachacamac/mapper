**Mapper - A tiny geo coordinate converter - basically for plotting latitude/longitude pairs to an image**
[![Gem Version](https://badge.fury.io/rb/mapper.svg)](http://badge.fury.io/rb/mapper) ![Installs](http://img.shields.io/gem/dt/mapper.svg)

Installation
------------
* gem install mapper

Usage
-----
    require 'mapper'
    #just initialize it with two known reference points on your map and you are ready to go!
    mapper = Mapper.new({:lat=>48.13,:lon=>11.57,:x=>278,:y=>503}, {:lat=>53.55,:lon=>9.99,:x=>206,:y=>114})
    #you can either add lat/lon and it will fill up the point with corresponding x/y
    mapper.add_point(:lat=>52.52, :lon=>13.41)
    #or add x/y and it will fill up the point with corresponding lat/lon
    mapper.add_point(:x=>136, :y=>410)
    #when you are done just work with the points (thinking about including a graphic gem for actual plotting)
    mapper.each{|point| p point}
    ->  {:lat=>52.52, :lon=>13.41, :x=>361.848101265823, :y=>187.924354243542}
    ->  {:lat=>49.4257840616967, :lon=>8.45388888888889, :x=>136, :y=>410}

Notes
-----
* Mapper assumes your map is in the mercator projection! (http://en.wikipedia.org/wiki/Mercator_projection)
* Luckily a lot of maps are: GoogleMaps, OpenStreetMap, ... :)
* Mapper is NOT a high precision tool! But in most cases it should be just okay enough. 

