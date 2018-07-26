class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def show
    render :show
  end

  def new
    @meal = Meal.new
    @person = Person.new
    render :new
  end

  def create
    @meal = Meal.new(set_params)
    
    if @meal.save
      # flash[:notif] "Meal Made!"
      redirect_to person_path(@meal.person.id)
    else
      render :new
    end
  end

  def edit

  end

  def destroy

  end

  private

  def set_params
    params.require(:meal).permit(:name, :healthy, :person_id)
  end

  def set_meal
    @meal = Meals.find(params[:id])
  end

end
