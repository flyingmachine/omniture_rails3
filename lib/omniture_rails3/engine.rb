module OmnitureRails3
  class Engine < Rails::Engine
    initializer 'omniture_rails_3.helper' do |app|
      ActionView::Base.send :include, OmnitureRails3::ViewHelper
    end
  end
end