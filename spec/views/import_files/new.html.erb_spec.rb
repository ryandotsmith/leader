require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/import_files/new.html.erb" do
  include ImportFilesHelper
  
  before(:each) do
    assigns[:import_file] = stub_model(ImportFile,
      :new_record? => true,
      :title => "value for title",
      :comment => "value for comment"
    )
  end

  it "should render new form" do
    render "/import_files/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", import_files_path) do
      with_tag("input#import_file_title[name=?]", "import_file[title]")
      with_tag("input#import_file_comment[name=?]", "import_file[comment]")
    end
  end
end


