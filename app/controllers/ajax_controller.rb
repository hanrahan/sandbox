class AjaxController < ApplicationController
  def card_tabs
    respond_to do |format|
      format.json
    end
  end
end
