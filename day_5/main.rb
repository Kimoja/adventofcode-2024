# https://adventofcode.com/2024/day/5

require 'pry'
require './page'
require './manual'
require './parser'
require './day_5'

parser = Parser.new(File.read('input'))
parser_result = parser.parse!

day_5 = Day5.new(parser_result.manuals, parser_result.page_pairing_orders)

puts 'Sum of middle page numbers for valid manuels: ' \
     "#{day_5.sum_middle_page_numbers_for_valid_manuels}"

puts 'Sum of middle page numbers for corrected manuels: ' \
     "#{day_5.sum_middle_page_numbers_for_corrected_manuels}"
