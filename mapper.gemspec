Gem::Specification.new do |s|
  s.name        = "mapper"
  s.version     = "1.0"
  s.authors     = ['pachacamac']
  s.email       = ["pachacamac@lavabit.com"]
  s.homepage    = "https://github.com/pachacamac/mapper"
  s.summary     = "A tiny geo coordinate converter"
  s.description = "A tiny geo coordinate converter - basically for plotting latitude/longitude pairs to an image"

  s.files        = Dir["{lib,test}/**/*"]
  s.require_path = "lib"

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.5"
end
