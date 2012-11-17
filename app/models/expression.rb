class Expression < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_associated :user  
  
  def self.random(book, lesson) 
    filters = {} 

    filters[:book] = book if not book == 'all'
    
    filters[:lesson] = lesson if not lesson == 'all'
      
    expressions = Expression.all(conditions: filters)
    
    expressions[rand(expressions.count)]
  end

end
