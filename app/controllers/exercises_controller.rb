# encoding: UTF-8
class ExercisesController < ApplicationController
  
  def index
    @exercises = Exercise.all

    respond_to do |format|
      format.html 
      format.json { render json: @exercises }
    end
  end

  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @exercise }
    end
  end

  def new
    @exercise = Exercise.new
    @exercise.language_answer = 'English'
    #@exercise.language_answer = 'Português'
    @exercise.expression = Expression.first 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  def create
    @exercise = Exercise.new(params[:exercise])

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render json: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

end
