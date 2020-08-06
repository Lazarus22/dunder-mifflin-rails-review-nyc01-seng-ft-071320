class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        find_employee
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(params_path(:first_name, :last_name, :alias, :title, :office, :image_url, :dog_id))
        redirect_to employees_path(@employee)
    end

    def edit
        find_employee
    end

    def update
        find_employee
        @employee.update(params_path(:first_name, :last_name, :alias, :title, :office, :image_url, :dog_id) )
    end

    def destroy
        instance = find_employee
        instance.destroy

        redirect_to employees_path
    end

    private

    def params_path(*args)
        params.require(:employees).permit(*args)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end
end
