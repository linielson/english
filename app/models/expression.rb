class Expression < ActiveRecord::Base

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
