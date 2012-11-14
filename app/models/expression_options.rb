# Encoding:UTF-8
class ExpressionOptions
  
  PORTUGUESE = "Portuguese"
  ENGLISH = "English"
  LANGUAGES = [PORTUGUESE, ENGLISH]

  def self.books
    Expression.uniq.pluck(:book).sort
  end
  
  def self.lessons
    Expression.uniq.pluck(:lesson).sort
  end
  
end