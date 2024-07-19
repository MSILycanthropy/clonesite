# frozen_string_literal: true

module ApplicationHelper
  ICON_DATA = JSON.parse(File.read("vendor/icons/heroicons.json")).freeze
  SUFFIXES = ICON_DATA["suffixes"]&.keys.freeze
  DEFAULT_SUFFIX = SUFFIXES&.first.freeze

  def icon(name, suffix: DEFAULT_SUFFIX, **attrs)
    icon_name = name.to_s.dasherize
    icon_name = "#{icon_name}-#{suffix}" if suffix.present?

    icon = ICON_DATA["icons"][icon_name]

    raise "Could not locate icon #{icon_name}" if icon.nil?

    viewbox = read_view_box(icon)

    tag.svg(xlmns: "http://www.w3.org/2000/svg", viewBox: viewbox, **attrs) do
      raw(icon["body"])
    end
  end

  private

  def read_view_box(icon)
    left = icon["left"] || ICON_DATA["left"] || 0
    right = icon["right"] || ICON_DATA["right"] || 0
    width = icon["width"] || ICON_DATA["width"] || 16
    height = icon["height"] || ICON_DATA["height"] || 16

    "#{left} #{right} #{width} #{height}"
  end
end
