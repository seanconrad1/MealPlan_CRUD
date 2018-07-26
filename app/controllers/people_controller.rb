class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
    render :index
  end

  def show
    render :show
  end

  def new
    @person = Person.new
    render :new
  end

  def create
    @person = Person.new(set_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @person.update(set_params)
      redirect_to person_path
    else
      render :edit
    end
  end

  def destroy
    @person.meals.destroy_all
    @person.destroy
    flash[:notice] = "Person deleted!"
    redirect_to people_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_params
    params.require(:person).permit(:name)
  end



end
