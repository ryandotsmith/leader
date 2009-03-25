require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImportFilesController do

  def mock_import_file(stubs={})
    @mock_import_file ||= mock_model(ImportFile, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all import_files as @import_files" do
      ImportFile.should_receive(:find).with(:all).and_return([mock_import_file])
      get :index
      assigns[:import_files].should == [mock_import_file]
    end

    describe "with mime type of xml" do
  
      it "should render all import_files as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ImportFile.should_receive(:find).with(:all).and_return(import_files = mock("Array of ImportFiles"))
        import_files.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested import_file as @import_file" do
      ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
      get :show, :id => "37"
      assigns[:import_file].should equal(mock_import_file)
    end
    
    describe "with mime type of xml" do

      it "should render the requested import_file as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
        mock_import_file.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new import_file as @import_file" do
      ImportFile.should_receive(:new).and_return(mock_import_file)
      get :new
      assigns[:import_file].should equal(mock_import_file)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested import_file as @import_file" do
      ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
      get :edit, :id => "37"
      assigns[:import_file].should equal(mock_import_file)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created import_file as @import_file" do
        ImportFile.should_receive(:new).with({'these' => 'params'}).and_return(mock_import_file(:save => true))
        post :create, :import_file => {:these => 'params'}
        assigns(:import_file).should equal(mock_import_file)
      end

      it "should redirect to the created import_file" do
        ImportFile.stub!(:new).and_return(mock_import_file(:save => true))
        post :create, :import_file => {}
        response.should redirect_to(import_file_url(mock_import_file))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved import_file as @import_file" do
        ImportFile.stub!(:new).with({'these' => 'params'}).and_return(mock_import_file(:save => false))
        post :create, :import_file => {:these => 'params'}
        assigns(:import_file).should equal(mock_import_file)
      end

      it "should re-render the 'new' template" do
        ImportFile.stub!(:new).and_return(mock_import_file(:save => false))
        post :create, :import_file => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested import_file" do
        ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
        mock_import_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :import_file => {:these => 'params'}
      end

      it "should expose the requested import_file as @import_file" do
        ImportFile.stub!(:find).and_return(mock_import_file(:update_attributes => true))
        put :update, :id => "1"
        assigns(:import_file).should equal(mock_import_file)
      end

      it "should redirect to the import_file" do
        ImportFile.stub!(:find).and_return(mock_import_file(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(import_file_url(mock_import_file))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested import_file" do
        ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
        mock_import_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :import_file => {:these => 'params'}
      end

      it "should expose the import_file as @import_file" do
        ImportFile.stub!(:find).and_return(mock_import_file(:update_attributes => false))
        put :update, :id => "1"
        assigns(:import_file).should equal(mock_import_file)
      end

      it "should re-render the 'edit' template" do
        ImportFile.stub!(:find).and_return(mock_import_file(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested import_file" do
      ImportFile.should_receive(:find).with("37").and_return(mock_import_file)
      mock_import_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the import_files list" do
      ImportFile.stub!(:find).and_return(mock_import_file(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(import_files_url)
    end

  end

end
