class PopulationGrowthController < ApplicationController
    def index
    end

    def search
        zipcode = params[:zipcode]

        response = HTTParty.get("https://secret-sands-06474.herokuapp.com/v1/zipcode/60660/populationGrowth")

        @population_growth = response

        puts @population_growth

        unless @population_growth
            flash[:alert] = 'Population growth information not found'
            return render action: :index
        end
    end
end