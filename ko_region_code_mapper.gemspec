# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = "ko_region_code_mapper"
  spec.version     = '0.0.2'
  spec.date        = '2019-03-25'
  spec.summary     = "Korean region code Mapper"
  spec.description = "Serve interfaces converting between multiple region codes"
  spec.authors     = ["Aree Oh"]
  spec.email       = 'christina.ohari@gmail.com'
  spec.files       = [
    "lib/ko_region_code_mapper.rb",
    "lib/data/ko_region_20181231.csv"
  ]
  spec.homepage    = 'https://github.com/aria-grande/KoRegionCodeMapper'
  spec.license     = 'MIT'

  spec.add_dependency "csv"
end
