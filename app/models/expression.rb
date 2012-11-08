class Expression < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_associated :user  
  
  def self.random
    begin
      begin
        expression = self.find(rand(self.maximum 'id') + 1)
      rescue ActiveRecord::RecordNotFound
        expression = nil
      end      
    end while expression == nil
    expression
  end

end
