require 'minitest/autorun'
require 'ko_region_code_mapper'

class KoRegionCodeMapperTest < Minitest::Test
  def test_reading_csv
    mapper = KoRegionCodeMapper.new
    assert mapper != nil
  end

  def test_converting_between_sigungu_code_and_hcode
    hcode = '4277025900'
    sigungu_code = '32350'
    mapper = KoRegionCodeMapper.new

    assert_equal mapper.find_sigungu_code_by_hcode(hcode), sigungu_code

    hcodes = mapper.find_hcodes_by_sigungu_code(sigungu_code)
    hcodes.each do |code|
      assert code.start_with? '42770'
    end
  end
end
