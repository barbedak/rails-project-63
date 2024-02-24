# frozen_string_literal: true

class FormRender # rubocop:disable Style/Documentation
  attr_accessor :builded_form, :user

  def initialize(user, builded_form)
    @user = user
    @builded_form = builded_form
  end

  def render_html # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    body = @builded_form.form_body
    result = "<form action=\"#{@builded_form.url}\" method=\"post\">"
    @builded_form.inputs.each do |field|
      rows = field.fetch(:rows, 40)
      cols = field.fetch(:cols, 20)
      user_name = @user.public_send(field[:name].to_sym)
      result << if field.key?(:as)
                  "<textarea name=\"#{field[:name]}\" cols=\"#{cols}\" rows=\"#{rows}\">#{user_name}</textarea>"
                elsif field.key?(:class)
                  "<label for=\"#{field[:name]}\">#{field[:name].capitalize}</label><input name=\"#{field[:name]}\" type=\"text\" value=\"#{user_name}\" class=\"#{field[:class]}\">" # rubocop:disable Layout/LineLength
                else
                  "<input name=\"#{field[:name]}\" type=\"text\" value=\"#{user_name}\">"
                end
    end
    result << "<input type=\"submit\" value=\"#{body[:submit]}\">" if body.key?(:submit)
    result << "</form>"
  end
end
