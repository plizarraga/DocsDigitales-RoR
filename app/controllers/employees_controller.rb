class EmployeesController < ApplicationController

  before_action :require_login

  def index
    @empleados = User.find(session[:user_id]).employees
  end

  def new
    @empleado = Employee.new
  end

  def create
    @empleado = Employee.new(employee_params)
      
    if @empleado.save
      redirect_to @empleado
    else
      render 'new'
    end
  end

  def show
    @empleado = Employee.find(params[:id])
  end

  def edit
    @empleado = Employee.find(params[:id])
  end

  def update
    @empleado = Employee.find(params[:id])

    if @empleado.update(employee_params)
      redirect_to @empleado
    else
      render 'edit'
    end
  end

  def destroy
    @empleado = Employee.find(params[:id])
    @empleado.destroy

    redirect_to empleados_path
  end

    def EmployeeByNombre 
    employee = User.find(session[:user_id]).employees.find_by_nombre(params[:employee_nombre])
    if employee
      render json: {"valid" => 'false'}
    else
      render json: {"valid" => 'true'}
    end
  end

  def EmployeeByRFC 
    employee = User.find(session[:user_id]).employees.find_by_rfc(params[:employee_rfc])
    if employee
      render json: {"valid" => 'false'}
    else
      render json: {"valid" => 'true'}
    end
  end  

  private
  def employee_params
    params.require(:employee).permit(:nombre, :rfc, :puesto, :store_id)
  end
end
