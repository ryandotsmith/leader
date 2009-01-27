class AddColumnsToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :updated_by, :string
  end

  def self.down
  end
end
