class EssentialsController < ApplicationController
    require 'httparty'
    def index
        response = HTTParty.get("http://newsapi.org/v2/everything?q=covid-19&source=bbc&apiKey=ac626a27f47c420b9488255ee0022622");
        object = ActiveSupport::JSON.decode response.body
        @news = object["articles"]
    end
end
