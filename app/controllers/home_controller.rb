class HomeController < ApplicationController

  def index
  end
  def landing
  end
  def launch
    @employees = current_user.employees.search(params[:search]).order('id ASC')
  end
  def questionaire
    @questions = current_user.questions.order('id ASC')
    @current_employee = Employee.find(params[:id])
    if params[:add_answer]
      array = Array.new
      array = array.push(@current_employee.answered_yes)
      array = array.push(params[:add_answer])
      joined = array.join('~')
      @current_employee.update(answered_yes: joined)
    end
    #just button handler while debugging, delete this and button
    #on questionaire later
    if params[:remove_answer]
      #array = Array.new
      #array = @current_employee.answered_yes.split('~')
      #array.delete(params[:remove_answer])
      #joined = array.join('~')
      @current_employee.update(answered_yes: "")
    end
    if params[:commit].present?
      onlyanswers = request.request_parameters
      onlyanswers = onlyanswers.except(:id, :commit, :authenticity_token)
      if onlyanswers.count != @questions.count
        flash.now.notice = "Please answer each question" and return
      end
      values = onlyanswers.values
      values.delete("")
      joined = values.join('~')
      if joined.empty?
        @current_employee.update(signed_in: true)
      else
        @current_employee.update(answered_yes: joined)
        redirect_to "/home/failed" and return
      end
      redirect_to "/home/confirmation" and return
    end
    if @current_employee.signed_in
      @current_employee.update(signed_in: false)
      redirect_to "/home/signoutt" and return    
    end    
  end
  def confirmation
  end
  def signoutt
  end
  def failed
  end

end
