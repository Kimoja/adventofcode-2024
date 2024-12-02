class Manual
  class MaximumCorrectionAttemptExceeded < StandardError; end

  def initialize(pages)
    self.pages = pages
  end

  def respect_page_pairing_orders?(page_pairing_orders)
    pages[..-2].each_with_index.all? do |page, page_index|
      pages[(page_index + 1)..].all? do |next_page|
        page.respect_pairing_order?(page_pairing_orders, next_page)
      end
    end
  end

  def corrects_order!(page_pairing_orders)
    self.pages = corrects_order_rec(page_pairing_orders, pages.dup, 1)
  end

  def middle_page
    pages[pages.size / 2]
  end

  private

  attr_accessor :pages

  def corrects_order_rec(page_pairing_orders, pages, attempt)
    pages[..-2].each_with_index.all? do |page, page_index|
      pages[(page_index + 1)..].all? do |next_page|
        next true if page.respect_pairing_order?(page_pairing_orders, next_page)

        raise MaximumCorrectionAttemptExceeded if max_attempts == attempt

        corrected_pages = pages.dup

        corrected_pages.delete(page)
        corrected_pages.delete(next_page)

        corrected_pages.insert(page_index, next_page)
        corrected_pages.insert(page_index + 1, page)

        return corrects_order_rec(page_pairing_orders, corrected_pages, attempt + 1)
      end
    end

    pages
  end

  def max_attempts
    @max_attempts = (1..pages.size).inject(:*)
  end
end


