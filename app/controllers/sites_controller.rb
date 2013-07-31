
class SitesController < ApplicationController

    def index

    end

    def show
        @site = Site.find(params[:id])
        @site_id = params[:id]

        sql = "SELECT * FROM pages WHERE site_id ='" + @site_id + "'"    
        @pages__ = Site.connection.execute(sql)

        @pages = Page.where(:site_id => params[:id])
        @invoices = Invoice.where(:site_id => params[:id])
        @staff = Staff.where(:site_id => params[:id])
        @doctors = Physician.where(:site_id => params[:id])

        

        respond_to do |format|
            format.html # show.html.erb
        end
    end


end
