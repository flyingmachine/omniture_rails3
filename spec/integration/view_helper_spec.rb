require 'spec_helper'

describe OmnitureRails3::ViewHelper do
  include Capybara
  
  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end
end
