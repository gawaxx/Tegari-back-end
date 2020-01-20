class ReportsController < ApplicationController

    def index
        reports = Report.all
        render json: reports
    end 

    def show 
        report = Report.find_by(id: params[:id])
        render json: report
    end

end
