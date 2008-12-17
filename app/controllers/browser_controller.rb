class BrowserController < ApplicationController
  def index
    
  end

  def main_menus
    respond_to do |format|
      format.json { render :json => Menu.get_external_menus.to_json }
    end
  end

end
