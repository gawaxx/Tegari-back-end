class ReportsController < ApplicationController

    def index
        reports = Report.all
        render json: reports
    end 

    def show 
        report = Report.find_by(id: params[:id])
        render json: report
    end

    def create
        report = Report.create(user_reported_id: params[:user_reported_id], user_reporting_id: params[:user_reporting_id], reason_reporting: params[:reason_reporting], post_id_reported: params[:post_id_reported])
        render json: report
    end 

end
