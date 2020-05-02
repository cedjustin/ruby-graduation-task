class SymptomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_symptom, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @symptom = Symptom.new
    end

    def create
        @symptom = Symptom.new(symptom_params)
        if @symptom.save
            redirect_to users_path
        else
            render :new, notice: "symptom not saved"
        end
    end

    def show
        @users = User.all
    end

    def destroy
        if @symptom.destroy
            redirect_to users_path
        end
    end

    private

    def set_symptom
        @symptom = Symptom.find(params[:id])
    end

    def symptom_params
        params.require(:symptom).permit(:title, :content, :main, :user_id)
    end
end
