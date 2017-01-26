class AddKeywordsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :keywords, :text
  end
end
