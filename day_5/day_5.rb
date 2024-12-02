class Day5
  def initialize(manuals, page_pairing_orders)
    self.manuals = manuals
    self.page_pairing_orders = page_pairing_orders
  end

  def sum_middle_page_numbers_for_valid_manuels
    valid_manuals = manuals.select do |manual|
      manual.respect_page_pairing_orders?(page_pairing_orders)
    end

    sum_middle_page_numbers_for(valid_manuals)
  end

  def sum_middle_page_numbers_for_corrected_manuels
    invalid_manuals = manuals.reject do |manual|
      manual.respect_page_pairing_orders?(page_pairing_orders)
    end

    invalid_manuals.each { |manual| manual.corrects_order!(page_pairing_orders) }

    sum_middle_page_numbers_for(invalid_manuals)
  end

  private

  attr_accessor :manuals, :page_pairing_orders

  def sum_middle_page_numbers_for(manuals)
    manuals.sum { |manual| manual.middle_page.number }
  end
end
