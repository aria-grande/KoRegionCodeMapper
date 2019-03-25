require 'minitest/autorun'
require 'ko_region_code_mapper'

class KoRegionCodeMapperTest < Minitest::Test
  def test_reading_csv
    mapper = KoRegionCodeMapper.new
    assert mapper != nil
  end

  def test_converting_hcode
    hcode = '4277025900'
    mapper = KoRegionCodeMapper.new
    sigungu_code = mapper.find_sigungu_code_by_hcode(hcode)
    assert_equal sigungu_code, '32350'
  end
end
