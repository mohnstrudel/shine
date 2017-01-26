class AddIndexToCustomers < ActiveRecord::Migration
  def change
  	add_index :customers, :keywords
  end
end
