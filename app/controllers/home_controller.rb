class HomeController < ApplicationController

  def index
  end
  def landing
  end
  def launch
    @employees = Employee.search(params[:search])
  end
  def questionaire
    @questions = Question.all
  end
  
end
