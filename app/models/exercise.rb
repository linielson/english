# Encoding:UTF-8
class Exercise < ActiveRecord::Base
  belongs_to :expression
  
  before_save :correct_question  
  
  def question
    if language_answer == "Português"
      expression.english
    else
      expression.portuguese
    end
  end
  
private

  def correct_question    
    if language_answer == "Português"
      self.correct_answer = compare_sentences self.answer, self.expression.portuguese
    else
      self.correct_answer = compare_sentences self.answer, self.expression.english
    end

    true # Ficamos por corrigir essa questão. Quando retorna false no
         # before_save ele não continua. Visto que só queriamos carregar o
         # campo "correct_answer".
  end
  
  def compare_sentences first_sentence, second_sentence
    remove_unmeaning_chars(first_sentence) == remove_unmeaning_chars(second_sentence)  
  end
  
  def remove_unmeaning_chars sentence
    sentence.split(" ").join.upcase.gsub(".", "")    
  end
  
end