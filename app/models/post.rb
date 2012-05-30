class Post < ActiveRecord::Base
  validates_presence_of :title, :message => "Your name is necesary."
  validates_presence_of :content, :message => "You need to add a comment first."
end
