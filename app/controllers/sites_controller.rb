
class SitesController < ApplicationController

    def index

    end

    def show
        @site = Site.find(param[:id])
        respond_to do |format|
            format.html # show.html.erb
            format.xml { render :xml => @site}
            format.json { render :json => @site}
        end
    end


end
