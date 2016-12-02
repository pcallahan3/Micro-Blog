#Model class for articles table
class Article < ActiveRecord::Base
  
  #Valdating title and description, checking for presence and adding min max length
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  
  
end