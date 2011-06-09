require 'spec_helper'

describe OmnitureRails3::Config do
  FIXTURE_DIRECTORY = File.join(File.dirname(__FILE__), "..", "fixtures")
  
  before :all do
    @config = OmnitureRails3.config.to_hash
  end
  before :each do
    OmnitureRails3.config.higml_directory = FIXTURE_DIRECTORY
    OmnitureRails3.config.prop_map = {}
    OmnitureRails3.config.tracking_account = nil
    OmnitureRails3.config.visitor_namespace = nil
    OmnitureRails3.config.noscript_img_src = nil
  end
  
  after :all do
    OmnitureRails3.config.set(@config)
  end
  
  it "should set the config from a yaml filename" do
    OmnitureRails3.config.set(File.expand_path(File.join(FIXTURE_DIRECTORY, 'config.yml')))
    OmnitureRails3.config.higml_directory.should == "dir"
    OmnitureRails3.config.prop_map.should == {:keywords => :chassis}
    OmnitureRails3.config.tracking_account.should == "dev"
    OmnitureRails3.config.visitor_namespace.should == "namespace"
    OmnitureRails3.config.noscript_img_src.should == "http://127.0.0.1"
  end
  
  it "should set the config from a file" do
    OmnitureRails3.config.set(File.open(File.expand_path(File.join(FIXTURE_DIRECTORY, 'config.yml'))))
    OmnitureRails3.config.higml_directory.should == "dir"
    OmnitureRails3.config.prop_map.should == {:keywords => :chassis}
    OmnitureRails3.config.tracking_account.should == "dev"
    OmnitureRails3.config.visitor_namespace.should == "namespace"
    OmnitureRails3.config.noscript_img_src.should == "http://127.0.0.1"
  end
  
  it "should set the config from a hash" do
    OmnitureRails3.config.set({
      "higml_directory"      => "a",
      "prop_map" => {:k   => :v},
      "tracking_account"  => "b",
      "visitor_namespace" => "c",
      "noscript_img_src"  => "d"
    })
    OmnitureRails3.config.higml_directory.should == "a"
    OmnitureRails3.config.prop_map.should == {:k => :v}
    OmnitureRails3.config.tracking_account.should == "b"
    OmnitureRails3.config.visitor_namespace.should == "c"
    OmnitureRails3.config.noscript_img_src.should == "d"
  end
  
  it "sets Higml's global pairs" do
    
  end
end