require 'spec_helper'
require 'capybara'

describe Orderly do
  let(:this) { "One piece of content" }
  let(:that) { "Another piece of content" }

  let(:page) do
    Capybara::Session.new(:rack_test, TestApp)
  end

  describe "appear_before" do
    it "asserts this is before that" do
      page.visit "/thisthenthat"
      expect(this).to appear_before(that)
    end

    it "asserts this is not before that" do
      page.visit "/thatthenthis"
      expect(this).not_to appear_before(that)
    end

    it "handles for this missing" do
      page.visit "/thisnothat"
      error_text = "Could not locate later content on page: #{that}"
      expect { expect(this).to appear_before(that) }.to raise_error error_text
      expect { expect(this).not_to appear_before(that) }.to raise_error error_text
    end

    it "handles for this missing" do
      page.visit "/thatnothis"
      error_text = "Could not locate earlier content on page: #{this}"
      expect { expect(this).to appear_before(that) }.to raise_error error_text
      expect { expect(this).not_to appear_before(that) }.to raise_error error_text
    end
  end

end
