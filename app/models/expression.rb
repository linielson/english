class Expression < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_associated :user  
  
  def self.random(book, lesson) 
    filters = {} 

    if not book.nil? 
      filters[:book] = book
    end
    
    if not lesson.nil?
      filters[:lesson] = lesson
    end
    
    expressions = Expression.all(conditions: filters)
    
    expressions[rand(expressions.count)]
  end

end
