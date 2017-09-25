require 'spec_helper'
require 'capybara'

describe Orderly do
  let(:this) { "<p>One piece of content</p>" }
  let(:that) { "<p>Another piece of content</p>" }

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
      expect(this).not_to appear_before(that)
    end

    it "handles for this missing" do
      page.visit "/thatnothis"
      expect(this).not_to appear_before(that)
    end
  end

end
