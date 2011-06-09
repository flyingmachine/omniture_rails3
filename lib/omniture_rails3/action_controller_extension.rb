module OmnitureRails3
  module ActionControllerExtension
    extend ActiveSupport::Concern
    included do
      attr_accessor :omniture_input, :omniture_priority_map
      helper_attr :omniture_input, :omniture_priority_map
      
      before_filter :set_omniture_input
    end
    
    module ClassMethods
    end
    
    module InstanceMethods
      def set_omniture_input
        self.omniture_input = params
      end
    end
  end
end