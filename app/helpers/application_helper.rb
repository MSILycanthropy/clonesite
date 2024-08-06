# frozen_string_literal: true

module ApplicationHelper
  include BetterHtml::Helpers

  def format_money(number, currency: nil)
    currency ||= Money.current_currency

    number_to_currency(number, unit: currency.symbol, delimiter: currency.decimal_mark)
  end

  def tab_link_to(name = nil, path = nil)
    classes = [ "tab" ]

    classes << "tab-active" if path_from_controller?(path)

    link_to name, path, role: :tab, class: classes
  end

  def interval_select_options
    options = [ :months, :years, :days ].map { |i| [ t("interval_types.#{i}"), i ] }

    options_for_select(options)
  end

  private

  def path_from_controller?(path = nil)
    path_controller = Rails.application.routes.recognize_path(path)[:controller]

    controller_name == path_controller
  end
end
