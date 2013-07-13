class AddReferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reference_code, :string
    add_column :users, :refered_code, :string
  end
end
