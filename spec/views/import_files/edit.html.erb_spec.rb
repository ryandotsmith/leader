require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/import_files/edit.html.erb" do
  include ImportFilesHelper
  
  before(:each) do
    assigns[:import_file] = @import_file = stub_model(ImportFile,
      :new_record? => false,
      :title => "value for title",
      :comment => "value for comment"
    )
  end

  it "should render edit form" do
    render "/import_files/edit.html.erb"
    
    response.should have_tag("form[action=#{import_file_path(@import_file)}][method=post]") do
      with_tag('input#import_file_title[name=?]', "import_file[title]")
      with_tag('input#import_file_comment[name=?]', "import_file[comment]")
    end
  end
end


