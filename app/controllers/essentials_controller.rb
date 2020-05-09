class EssentialsController < ApplicationController
    require 'httparty'
    def index
        @patient = User.where(username:'Patient0')
        response = HTTParty.get("http://newsapi.org/v2/everything?q=covid-19&source=bbc&apiKey=ac626a27f47c420b9488255ee0022622");
        object = ActiveSupport::JSON.decode response.body
        @news = object["articles"]
    end

    def screening
        @symptoms = Symptom.where(main: true)
        @test_done = false
        flash[:success]=""
        if request.post?
            results = params[:symptom]
            fake_results = results.count
            if results.count("true") > 0
                fake_results = results.count - results.count("true")
            end
            percentage = results.count("true").to_f/fake_results.to_f*100
            if percentage >= 50
                flash[:success]="go to a hospital"
            else
                flash[:success]="take care of yourself"
            end
            @test_done = true
        end
    end
end
