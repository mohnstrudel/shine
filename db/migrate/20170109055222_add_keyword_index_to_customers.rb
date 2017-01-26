class AddKeywordIndexToCustomers < ActiveRecord::Migration
  def up
  	execute %{
  		CREATE INDEX
  			customers_keywords_index ON customers
  		USING
  			gin(to_tsvector('english', keywords));
  	}
  end

  def down
  	remove_index :customers, name: 'customers_keywords_index'
  end
end
