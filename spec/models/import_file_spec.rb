require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
TEST_CSV = File.expand_path(File.dirname(__FILE__) + '/../fixtures/test.csv')
MIN_TEST_CSV= File.expand_path(File.dirname(__FILE__) + '/../fixtures/min_test.csv')
BAD_TEST_CSV= File.expand_path(File.dirname(__FILE__) + '/../fixtures/bad_test.csv')

describe ImportFile do
  before(:each) do
    @valid_attributes = {
      :comment => "value for comment"
    }
  end

  it "should create a new instance given valid attributes" do
    ImportFile.create!(@valid_attributes)
  end
end

describe "generating Leads from import file" do

  before(:each) do
    def get_fake_csv_headers
      [  "company_name",
                "contact",
                "address",
                "city",
                "state",
                "zip",
                "country",
                "phone",
                "email",
                "fax",
                "notes",
                "operations",
                "commodities",
                "url" 
              ]
    end
    def get_fake_csv_body
       [  "GS Enterprises Inc.", 
                "Jim Arbuckle",
                "2540 S. 88th St.",
                "Kansas City",
                "KS",
                "66111",
                "USA",
                "877-631-1254",
                "jarbuckle@gsenterprises.com",
                "913-543-7625",
                "no notes",
                "all operations",
                "tons of commodities",
                "http://www.gsenterprises.com"]
    end
    @csv_string = FasterCSV.generate do |csv|
        csv << get_fake_csv_headers
        csv << get_fake_csv_body
    end# do
    @import_file = ImportFile.new
    @import_file.lead_data.stub!(:url).and_return( MIN_TEST_CSV )
    @import_file.lead_data.stub!(:path).and_return( MIN_TEST_CSV )

  end# before

  it "should change lead_data file into csv string" do
    hash = {1 => {'company_name'=>'GS Enterprises Inc.','phone' => '877-631-1254'} }
    @import_file.lead_data.url.should eql( MIN_TEST_CSV )
    @import_file.to_indexed_hash.should == hash
  end

  it "should send a hash to Lead#create " do
    @import_file.make_lead.should eql( true )
    @import_file.leads.length.should eql( 1 )
  end
  
  it "should error if csv is malformed" do
    @import_file.lead_data.stub!(:path).and_return( BAD_TEST_CSV )
    @import_file.make_lead.should eql( false )
    @import_file.save
    @import_file.leads.length.should eql( 0 )
  end

end# des