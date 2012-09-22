# encoding: UTF-8
class ExercisesController < ApplicationController  
  
  def index
    respond_with @exercises = Exercise.all
  end

  def show
    respond_with @exercise = Exercise.find(params[:id])
  end

  def new   
    @exercise = Exercise.new
    @exercise.language_answer = 'English'
    #@exercise.language_answer = 'Português'

    respond_with @exercise.expression = get_random_expression    
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    flash[:notice] = "Exercise was successfully created. #{@exercise.expression.id}" if @exercise.save
    respond_with @exercise, location: exercises_path    
  end

private

  def get_random_expression
    begin
      begin
        expressao = Expression.find(rand(Expression.maximum 'id') + 1)
      rescue ActiveRecord::RecordNotFound
        expressao = nil
      end      
    end while expressao == nil
    expressao
  end

end
