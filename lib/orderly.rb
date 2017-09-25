require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content|
    match do |earlier_content|
      begin
        page.assert_text(earlier_content)
      rescue Capybara::ExpectationNotMet
        raise "Could not locate earlier content on page: #{earlier_content}"
      end

      begin
        page.assert_text(later_content)
      rescue Capybara::ExpectationNotMet
        raise "Could not locate later content on page: #{later_content}"
      end

      page.body.index(earlier_content) < page.body.index(later_content)
    end
  end
end
