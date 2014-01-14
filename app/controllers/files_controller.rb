class FilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_asset,      :only => [:show]
  before_filter :authorize_view!, :only => [:show]

  def show
    send_file @asset.asset.path, :filename     => @asset.asset_file_name,
                                 :content_type => @asset.asset_content_type
  end 

  private
    def authorize_view!
      if !current_user.admin? && cannot?("view".to_sym, @asset.ticket.project)
        flash[:alert] = "The asset you were looking for could not be found"
        redirect_to '/'
      end 
    end 

    def find_asset
      @asset = Asset.find(params[:id])
    end 
end
