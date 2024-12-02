class Page
  def initialize(number)
    self.number = number
  end

  attr_reader :number

  def respect_pairing_order?(page_pairing_orders, next_page)
    page_pairing_orders.none? do |(before_page, after_page)|
      next false unless next_page.number == before_page.number
      next true if number == after_page.number

      false
    end
  end

  private

  attr_writer :number
end
