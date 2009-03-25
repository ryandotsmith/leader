require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/import_files/index.html.erb" do
  include ImportFilesHelper
  
  before(:each) do
    assigns[:import_files] = [
      stub_model(ImportFile,
        :title => "value for title",
        :comment => "value for comment"
      ),
      stub_model(ImportFile,
        :title => "value for title",
        :comment => "value for comment"
      )
    ]
  end

  it "should render list of import_files" do
    render "/import_files/index.html.erb"
    response.should have_tag("tr>td", "value for title", 2)
    response.should have_tag("tr>td", "value for comment", 2)
  end
end

