# frozen_string_literal: true

module ApplicationHelper
  include BetterHtml::Helpers

  def format_money(number, currency: nil)
    currency ||= Money.current_currency

    number_to_currency(number, unit: currency.symbol, delimiter: currency.decimal_mark)
  end

  def tab_link_to(name = nil, path = nil)
    classes = [ "tab" ]

    classes << "tab-active" if current_page?(path)

    link_to name, path, role: :tab, class: classes
  end
end
