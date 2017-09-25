require "orderly/version"
require "rspec/expectations"

module Orderly
  RSpec::Matchers.define :appear_before do |later_content|
    match do |earlier_content|
      earlier_index = page.body.index(earlier_content)
      later_index = page.body.index(later_content)
      earlier_index && later_index && earlier_index < later_index
    end
  end
end
