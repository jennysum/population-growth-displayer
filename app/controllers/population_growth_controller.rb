class PopulationGrowthController < ApplicationController
    def index
    end

    def search
        population_growths = find_population_growth(params[:zipcode])

        unless population_growths
            flash[:alert] = 'Population growth information not found'
            return render action: :index
        end
    end

    private

    def request_api(url)
        response = Excon.get(
          url,
          headers: {
            'X-RapidAPI-Host' => URI.parse(url).host,
            'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
          }
        )
        return nil if response.status != 200
        JSON.parse(response.body)
    end

    def find_population_growth(zipcode)
        request_api("https://secret-sands-06474.herokuapp.com/v1/zipcode/{zipcode}/populationGrowth")
    end
end