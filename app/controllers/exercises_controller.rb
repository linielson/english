# encoding: UTF-8
class ExercisesController < ApplicationController  

  def index
    respond_with @exercises = Exercise.all
  end

  def show
    @book = params[:book]
    @lesson = params[:lesson]       
    respond_with @exercise = Exercise.find(params[:id])
  end

  def new   
    @exercise = Exercise.new
    
    @book = params[:book]
    @lesson = params[:lesson]    
    @exercise.language_answer = params[:language]
    
    respond_with @exercise.expression = Expression.random(@book, @lesson)    
  end
  
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.user = current_user
    @exercise.save
    @book = params[:book]
    @lesson = params[:lesson]       
     
    if @exercise.save
      redirect_to action: 'show', id: @exercise.id, book: @book, lesson: @lesson 
    else
      render action: "new"
    end  
  end

end
