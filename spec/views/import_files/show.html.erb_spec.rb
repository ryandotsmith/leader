require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/import_files/show.html.erb" do
  include ImportFilesHelper
  
  before(:each) do
    assigns[:import_file] = @import_file = stub_model(ImportFile,
      :title => "value for title",
      :comment => "value for comment"
    )
  end

  it "should render attributes in <p>" do
    render "/import_files/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ comment/)
  end
end

