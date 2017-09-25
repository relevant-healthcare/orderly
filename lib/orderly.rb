require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content|
    match do |earlier_content|
      page.assert_text(earlier_content)
      page.assert_text(later_content)
      page.body.index(earlier_content) < page.body.index(later_content)
    end
  end
end
