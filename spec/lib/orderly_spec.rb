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
      expect do
        expect(this).to appear_before(that)
      end.to raise_error(Capybara::ExpectationNotMet)
    end

    it "handles for this missing" do
      page.visit "/thatnothis"
      expect do
        expect(this).to appear_before(that)
      end.to raise_error(Capybara::ExpectationNotMet)
    end
  end

end
