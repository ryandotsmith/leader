class Lead < ActiveRecord::Base
  belongs_to :import_file

  validates_presence_of :company_name
  validates_presence_of :phone

  def to_label
      "#{company_name} "
    end

end
