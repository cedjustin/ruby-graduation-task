class EssentialsController < ApplicationController
    require 'httparty'
    def index
        @patient = User.where(username:'Patient0')
        response = HTTParty.get("http://newsapi.org/v2/everything?q=covid-19&source=bbc&apiKey=ac626a27f47c420b9488255ee0022622");
        object = ActiveSupport::JSON.decode response.body
        @all_news = object["articles"]
    end

    def screening
        @symptoms = Symptom.where(main: true)
        if @symptoms.length == 0
            @no_symptoms_registered = true
        else
            @no_symptoms_registered = false
        end
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

    def patient
        @patient_processed = false
        if request.post?
            patient = User.where(username: params["username"].downcase)
            if params["username"] != ""
                if patient.length == 0
                    patient_hash = { "email"=>"#{params["username"]}@gmail.com", "username"=> params["username"].downcase, "available"=> false,"admin"=> false, "activated"=> false, "isPatient"=> true, "password" => "patient#{params["username"]}", "password_confirmation" => "patient#{params["username"]}"}
                    new_patient = User.new(patient_hash)
                    if new_patient.save
                        @patient_processed = true
                        @registered_patient = User.where(username: params["username"].downcase)
                        @online_doctors = User.where(available: true)
                        session[:user_id] = @registered_patient[0].id
                    else
                        @patient_processed = false
                    end
                else
                    @patient_processed = true
                    @registered_patient = User.where(username: params["username"])
                    @online_doctors = User.where(available: true)
                    session[:user_id] = @registered_patient[0].id
                end
            else
            end
        end
    end

    def readmore_handler(url)
        redirect_to url
    end

    helper_method :readmore_handler
end
