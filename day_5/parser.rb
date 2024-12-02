class Parser
  class InputFormatError < StandardError; end

  Result = Struct.new(:page_pairing_orders, :manuals)

  INPUT_FORMAT_REG = /\A(?:\d+\|\d+\n)+(?:\n\d+(?:,\d+)+)+\Z/m
  INT_PAIRING_REG = /^(\d+)\|(\d+)+$/

  def initialize(input)
    self.input = input
  end

  def parse!
    raise InputFormatError unless input.match?(INPUT_FORMAT_REG)

    page_pairing_orders_txt, manuals_txt = input.split("\n\n")

    Result.new(
      page_pairing_orders: build_page_pairing_orders(page_pairing_orders_txt),
      manuals: build_manuals(manuals_txt)
    )
  end

  private

  attr_accessor :input

  def build_page_pairing_orders(page_pairing_orders_txt)
    page_pairing_orders_txt.scan(INT_PAIRING_REG).map do |(before_page_number, after_page_number)|
      [
        build_page(before_page_number),
        build_page(after_page_number)
      ]
    end
  end

  def build_manuals(manuals_txt)
    manuals_txt.split.map do |page_numbers|
      Manual.new(
        page_numbers.split(',').map { |page_number| build_page(page_number) }
      )
    end
  end

  def build_page(page_number)
    Page.new(page_number.to_i)
  end
end
