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
    @exercise.language_answer = params[:language]    
    respond_with @exercise.expression = Expression.random    
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.save
    respond_with @exercise
  end

end
