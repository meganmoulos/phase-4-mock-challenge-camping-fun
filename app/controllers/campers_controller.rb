class CampersController < ApplicationController

    before_action :find_camper, except: [:index, :create]
    
    def index
        render json: Camper.all, status: :ok
    end

    def show
        render json: @camper, serializer: CamperActivitiesSerializer
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private 

    def find_camper
        @camper = Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end
end
