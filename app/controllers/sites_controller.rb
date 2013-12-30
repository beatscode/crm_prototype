class SitesController < ApplicationController

    before_filter :authenticate_user 
        
    def index

    end

    def show
        @site = Site.find(params[:id])
        @site_id = params[:id]

        sql = "SELECT * FROM pages WHERE site_id ='" + @site_id + "'"    
        @pages = Site.connection.execute(sql)

        @pages = Page.where(:site_id => params[:id])
        @invoices = Invoice.where(:site_id => params[:id])
        @staff = Staff.where(:site_id => params[:id])
        @doctors = Physician.where(:site_id => params[:id])
        @domain = Domains.where(:site_id => params[:id]).all
        @products = SiteProducts.where(:site_id => params[:id]).joins(:product).select('products.*, site_products.*').all

        respond_to do |format|
            format.html # show.html.erb
        end
    end


end
