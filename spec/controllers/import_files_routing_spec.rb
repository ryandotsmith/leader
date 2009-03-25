require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImportFilesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "import_files", :action => "index").should == "/import_files"
    end
  
    it "should map #new" do
      route_for(:controller => "import_files", :action => "new").should == "/import_files/new"
    end
  
    it "should map #show" do
      route_for(:controller => "import_files", :action => "show", :id => 1).should == "/import_files/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "import_files", :action => "edit", :id => 1).should == "/import_files/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "import_files", :action => "update", :id => 1).should == "/import_files/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "import_files", :action => "destroy", :id => 1).should == "/import_files/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/import_files").should == {:controller => "import_files", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/import_files/new").should == {:controller => "import_files", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/import_files").should == {:controller => "import_files", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/import_files/1").should == {:controller => "import_files", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/import_files/1/edit").should == {:controller => "import_files", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/import_files/1").should == {:controller => "import_files", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/import_files/1").should == {:controller => "import_files", :action => "destroy", :id => "1"}
    end
  end
end
