class ImportsController < ApplicationController
  def create
    begin
      import = User.import params[:file]
      if import
        flash[:success] = t "view.import.import_success"
      else
        flash[:success] = t "view.import.import_fail"
      end
    rescue => error
      flash[:warning] =  error.to_s
    end
    redirect_to :back
  end
end
