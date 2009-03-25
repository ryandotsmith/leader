class CreateImportFiles < ActiveRecord::Migration
  def self.up
    create_table :import_files do |t|
      t.string    :comment
      t.boolean   :consumed
      t.string    :lead_data_file_name
      t.string    :lead_data_content_type
      t.integer   :lead_data_file_size
      t.datetime  :lead_data_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :import_files
  end
end
