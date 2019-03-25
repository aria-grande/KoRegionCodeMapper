## encoding: utf-8
$:.unshift File.dirname(__FILE__)

require 'csv'

class KoRegionCodeMapper
  FILE_NAME = 'data/ko_region_20181231.csv'
  DATA_INDEX = {
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
  }

  def initialize(opts = { filename: FILE_NAME, include_header: true, index_mapping: DATA_INDEX })
    if opts != nil && (opts[:filename].empty? || opts[:include_header].nil? || opts[:index_mapping].empty?)
      raise ArgumentError.new("[ERROR] Check opts parameter. It should include appropriate 'filename', 'include_header', 'index_mapping'.(given: #{opts})")
    end

    if opts[:index_mapping].class != Hash
      raise ArgumentError.new("[ERROR] Check opts[:index_mapping]. It should be hash consist of (key, value) presenting (attribute_name, index of column in table)")
    end

    @index_map = opts[:index_mapping] || DATA_INDEX

    file = CSV.read(File.expand_path(File.dirname(__FILE__) + "/#{opts[:filename] || FILE_NAME}"))
    @headers = file.delete_at(0) if opts[:include_header] || true
    @data = file
  end

  def find_sigungu_code_by_hcode(hcode)
    row = find_by_hcode(hcode).first
    row[@index_map[:hcategory]]&.slice(0..4)
  end

  def find_hcodes_by_sigungu_code(sigungu_code)
    row = find_by_sigungu_code(sigungu_code)
    row.map { |d| d[@index_map[:hcode]] }
  end

  private

  def find_by_hcode(hcode)
    idx = @index_map[:hcode]
    @data.select { |row| row[idx].to_s.eql? hcode.to_s }
  end

  def find_by_sigungu_code(sigungu_code)
    idx = @index_map[:hcategory]
    @data.select{ |row| row[idx].to_s.start_with? sigungu_code }
  end
end
