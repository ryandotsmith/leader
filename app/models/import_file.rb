class ImportFile < ActiveRecord::Base
  has_many :leads
  has_attached_file :lead_data
  attr_accessor :update_hook_param
  
  ####################
  #make_csv
  def to_indexed_hash
    i = 0
    data = Hash.new
    FasterCSV.foreach("#{ self.lead_data.path }",:headers => true) do |row|
      i += 1
      data[i] = row.to_hash
    end #end do
    data
  end#make_csv
  
  ####################
  #make_lead
  def make_lead
    errors,self.consumed = 0,false
    self.to_indexed_hash.each do |key,params|
      lead = Lead.new( params )
      self.leads << lead if lead.valid?
      errors += 1 unless lead.valid?
      self.consumed = true if errors == 0
    end
    return self.consumed
  end#make_lead

end