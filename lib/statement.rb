# = Usage:
#
# == Populate
# statements = {}
# Invoice.all.each do |invocie|
#   (statements[invoice.customer_id] ||= Statement.new).page.add(InvoiceItem.new(...))
# end
#
# == Add footer
# statements.keys.each do |customer_id|
#   statements[customer_id].footer = aging[customer_id]
# end
#
# == View
# statement.pages.each do |page|
#   page.items.each do |item|
#     ...
#   end
# end
#
class Statement

  class Page < Struct.new(:items, :header)

    def initialize
      self.items = []
    end

    def add(item)
      items << item
    end

  end

  attr_accessor :pages, :per_page

  def initialize(per = 21)
    @per_page = per
    @pages = [Page.new]
  end

  def page(per = per_page)
    if pages[-1].items.length >= per
      pages[-1].items[-1] << '</tbody></table>'.html_safe
      new_page = Page.new
      new_page.add '<table class="table plain"><tbody>'
      pages << new_page
    end
    pages[-1]
  end

  def last_page?(my_page)
    pages.last == my_page
  end

  def room_on_page?(my_page)
    my_page.items.length < per_page
  end

  def header=(head)
    @header = page(per_page - 3).header = head
  end

  def header
    @header
  end

end