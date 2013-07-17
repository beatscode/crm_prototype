
class SitesController < ApplicationController

    def index

    end

    def show
        @site = Site.find(params[:id])
        @site_id = params[:id]

        sql = "SELECT * FROM pages WHERE site_id ='" + @site_id + "'"    
        @pages = Site.connection.execute(sql)


        @invoices = Invoice.where("site_id like 'params[:id]'")

        respond_to do |format|
            format.html # show.html.erb
        end
    end


end
