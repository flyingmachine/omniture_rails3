module OmnitureRails3
  class Engine < Rails::Engine
    initializer 'omniture_rails_3.helper' do |app|
      ActionView::Base.send :include, OmnitureRails3::ViewHelper
      ActionController::Base.send :include, OmnitureRails3::ActionControllerExtension
      
      OmnitureRails3.config.set(File.join(Rails.root, "config", "omniture.yml"))
      # Parse Higml trees and store them so we don't have to do this every request
      
      OmnitureRails3::TREES = Dir[File.join(OmnitureRails3.config.higml_directory, '*.higml')].inject({}) do |hash, filename|
        puts filename
        hash[File.basename(filename, ".higml").to_sym] = Higml::Parser.new(File.read(filename)).to_tree
        hash
      end
      
    end
  end
end