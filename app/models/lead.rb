class Lead < ActiveRecord::Base
  def to_label
      "#{company_name} "
    end

end
