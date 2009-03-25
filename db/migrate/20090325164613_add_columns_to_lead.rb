class AddColumnsToLead < ActiveRecord::Migration
  def self.up
    add_column :leads, :import_file_id, :integer
  end

  def self.down
  end
end
