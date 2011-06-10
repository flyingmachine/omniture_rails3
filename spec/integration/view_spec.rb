require 'spec_helper'

describe OmnitureRails3 do
  include Capybara
  
  describe "handling higml files" do
    context "viewing actions belonging to diffent controllers" do
      it "prints the value 'users' for the channel when viewing an action in the users controller" do
        visit users_path
        page.should have_content(%q{"channel":"users"})
      end
      it "prints the value 'posts' for the channel when viewing an action in the posts controller" do
        visit posts_path
        page.should have_content(%q{"channel":"posts"})
      end
    end
    
    context "viewing actions within the same controller (users)" do
      it "prints the value 'list' for the pageName when viewing the index action" do
        visit users_path
        page.should have_content(%q{"pageName":"list"})
      end
      it "prints the value 'user 3' for the pageName when viewing a user with the ID 3" do
        visit user_path(:id => 3)
        page.should have_content(%q{"pageName":"user 3"})
      end
      it "prints the value 'user 4' for the pageName when value a user with the ID 4" do
        visit user_path(:id => 4)
        page.should have_content(%q{"pageName":"user 4"})
      end
    end
    
    context "sending different params to the same action (searches#new)" do
      it "prints the value 'tomatoes' for sprop 10 when searching for 'tomatoes'" do
        visit new_search_path(:keywords => "tomatoes")
        page.should have_content(%q{"prop10":"tomatoes"})
      end
      it "prints the value 'harry potter' for sprop 10 when searching for 'harry potter'" do
        visit new_search_path(:keywords => "harry potter")
        page.should have_content(%q{"prop10":"harry potter"})
      end
    end
  end
  
  describe "sanitization" do
    it "should sanitize all values" do
      visit new_search_path(:keywords => "harry&potter")
      page.should have_content(%q{"prop10":"harry&amp;potter"})
    end
  end
  
  describe "prop map" do
    it "should translate the internal name for a property to its omniture name" do
      visit new_search_path(:keywords => "tomatoes")
      page.should have_content(%q{"prop10":"tomatoes"})
      page.should_not have_content("keywords")
    end
  end
  
  describe "omniture-specific configuration" do
    #sc_directory prop_map tracking_account visitor_namespace noscript_img_src
    it "prints omniture-specific configuration correctly" do
      visit users_path
      page.should_not have_content(%q{"visitor_namespace":"test_namespace"})
      page.should_not have_content(%q{"noscript_img_src":"http://test/0"})
      page.should_not have_content(%q{"tracking_account":"ignore"})
      
      page.body.should include(%Q{src="#{OmnitureRails3.config.noscript_img_src}"})
      page.body.should include(%Q{s.visitorNamespace="#{OmnitureRails3.config.visitor_namespace}"})
      page.body.should include(%Q{var s_account="#{OmnitureRails3.config.tracking_account}";})
    end
  end
end
