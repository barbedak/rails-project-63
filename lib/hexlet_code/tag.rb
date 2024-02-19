# frozen_string_literal: true

module Tag # rubocop:disable Style/Documentation
  def build(name, options = {}) # rubocop:disable Metrics/MethodLength
    case name
    when "br"
      "<br>"
    when "div"
      "<div></div>"
    when "img"
      path = options.fetch(:src, false)
      "<img src=\"#{path}\""
    when "input"
      type = options.fetch(:type, false)
      value = options.fetch(:value, false)
      "<input type=\"#{type}\" value=\"#{value}\""
    when "label"
      fr = options.fetch(:for, false)
      if fr
        "<label for=\"#{fr}\">#{yield}</label>"
      else
        "<label>#{yield}</label>"
      end
    end
  end
end
