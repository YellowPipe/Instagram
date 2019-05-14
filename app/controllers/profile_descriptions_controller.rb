class ProfileDescriptionsController < ApplicationController
  before_action :set_profile_description, only: [:update]
  before_action :find_profile_description, only: [:edit]

  # GET /profile_descriptions/new
  def new
    @profile_description = ProfileDescription.new
  end

  # GET /profile_descriptions/1/edit
  def edit
  end

  # POST /profile_descriptions
  # POST /profile_descriptions.json
  def create
    @profile_description = current_user.build_profile_description(profile_description_params)

    respond_to do |format|
      if @profile_description.save
        format.html { redirect_to current_user, notice: 'Profile description was successfully created.' }
        format.json { render :show, status: :created, location: @profile_description }
      else
        format.html { render :new }
        format.json { render json: @profile_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_descriptions/1
  # PATCH/PUT /profile_descriptions/1.json
  def update
    respond_to do |format|
      if @profile_description.update(profile_description_params)
        format.html { redirect_to current_user, notice: 'Profile description was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_description }
      else
        format.html { render :edit }
        format.json { render json: @profile_description.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_description
      @profile_description = ProfileDescription.find(params[:id])
    end

    def find_profile_description
      @profile_description = ProfileDescription.find_by(user_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_description_params
      params.require(:profile_description).permit(:name, :body)
    end
end
