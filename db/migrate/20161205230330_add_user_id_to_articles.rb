#Adding user_id to articles table migration file
class AddUserIdToArticles < ActiveRecord::Migration
  def change
    #Adding column for articles,user_id,and foreign key
    add_column :articles, :user_id, :integer
  end
end
