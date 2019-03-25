require '../lib/korean_region_code_mapper'

mapper = KoreanRegionCodeMapper.new(filename: '../data/ko_region_201812311.csv', include_header: true, index_mapping: {
  :sido => 0,
  :sigungu => 1,
  :hname => 2,
  :hdong => 3,
  :bdong => 4,
  :hcategory => 5,
  :hcode => 6,
  :hcreated_at => 7,
  :bcode => 8,
  :hname_en => 9
})

hcode = '4277025900'
puts "sigungu code for hcode(#{hcode}) is '#{mapper.find_sigungu_code_by_hcode(hcode)}'"
