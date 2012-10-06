# Encoding:UTF-8
class Exercise < ActiveRecord::Base
  belongs_to :expression

  LANGUAGES = ["Portuguese", "English"]
  
  before_save :correct_question?
  
  def question
    if language_answer == "Portuguese"
      expression.english
    else
      expression.portuguese
    end
  end

  def the_correct_answer
    if language_answer == "Portuguese"
      expression.portuguese
    else
      expression.english
    end
  end
  
  def humanize_correct_answer
    correct_answer ? 'Yes' : 'No'
  end
   
private
  THIS_CALLBACK_NEEDS_TO_RETURN_TRUE_OTHERWISE_WILL_FAIL = true
  
  def correct_question?
    if language_answer == "Portuguese"
      self.correct_answer = compare_sentences self.answer, self.expression.portuguese
    else
      self.correct_answer = compare_sentences self.answer, self.expression.english
    end

    THIS_CALLBACK_NEEDS_TO_RETURN_TRUE_OTHERWISE_WILL_FAIL
  end
  
  def compare_sentences first_sentence, second_sentence
    remove_unmeaning_chars(first_sentence) == remove_unmeaning_chars(second_sentence)  
  end
  
  def remove_unmeaning_chars sentence
    sentence.split(" ").join.upcase.gsub(".", "")    
  end
  
end