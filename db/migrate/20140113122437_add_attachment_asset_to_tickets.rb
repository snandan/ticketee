#include Paperclip::Schema::TableDefinition
require 'paperclip'

class AddAttachmentAssetToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      #t.attachment :asset
      add_column :tickets, :asset_file_name, :string
      add_column :tickets, :asset_content_type, :string
      add_column :tickets, :asset_file_size, :integer
      add_column :tickets, :asset_updated_at, :datetime
    end
  end

  def self.down
    #drop_attached_file :tickets, :asset
    remove_column :tickets, :asset_file_name
    remove_column :tickets, :asset_content_type
    remove_column :tickets, :asset_file_size
    remove_column :tickets, :asset_updated_at
  end
end
