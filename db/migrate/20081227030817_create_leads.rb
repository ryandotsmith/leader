class CreateLeads < ActiveRecord::Migration
  def self.up
    create_table :leads do |t|
      t.string :company_name
      t.string :contact
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :email
      t.string :fax
      t.text :notes
      t.text :operations
      t.text :commodities
      t.string :url
      t.text :comments
      
      t.timestamps
    end
  end

  def self.down
    drop_table :leads
  end
end
