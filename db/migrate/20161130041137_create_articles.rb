#CreateArticles generated migration file
class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      
      #Adding atrriubutes to the table
      t.string :title
     
    end
  end
end
