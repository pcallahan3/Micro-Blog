#Rails generated migration add on file
class AddDescriptionToArticles < ActiveRecord::Migration
  
  #Change method is how Im going to update the table
  def change
    
    #adding a new column to articles table, with a name of description, and a type of text
    add_column :articles, :description, :text
    
    #adding a new column to articles table, created_at and updated_at which must be written this way, and a type of datetime
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
