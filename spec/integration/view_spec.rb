require 'spec_helper'

describe OmnitureRails3 do
  include Capybara
  
  describe "handling higml files" do
    context "viewing actions belonging to diffent controllers" do
      it "prints the value 'users' for the channel when viewing an action in the users controller" do
        visit users_path
        page.should have_content("channel: 'users'")
      end
      it "prints the value 'posts' for the channel when viewing an action in the posts controller"
    end
    
    context "viewing actions within the same controller" do
      it "prints the value 'list' for the pageName when viewing the index action"
      it "prints the value 'user 3' for the pageName when viewing a user with the ID 3"
      it "prints the value 'user 4' for the pageName when value a user with the ID 4"
    end
    
    context "sending different params to the same action" do
      it "prints the value 'tomatoes' for sprop 10 when searching for 'tomatoes'"
      it "prints the value 'harry potter' for sprop 10 when searching for 'harry potter'"
    end
  end
  
  describe "omniture-specific configuration" do
    #sc_directory prop_map tracking_account visitor_namespace noscript_img_src
    it "prints omniture-specific configuration correctly"
  end
end
