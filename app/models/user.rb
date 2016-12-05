#User class for users table
class User < ActiveRecord::Base
  #Validating username for presence, min/max length, and uniqueness and ignore case sensitivity
  validates :username, presence: true, 
             length: {minimum: 3, maximum: 25}, 
             uniqueness: {case_sensitive: false}
             
  #Regular expression variable for email   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Validating email for presence, max length, and uniqueness and ignore case sensitivity, and valid email format
  validates :email, presence: true, 
             length: {maximum: 105}, 
             uniqueness: {case_sensitive: false},
             format: {with: VALID_EMAIL_REGEX}
  
end