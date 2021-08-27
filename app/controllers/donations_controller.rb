class DonationsController < ApplicationController
    def show

    end

    def create
        @order = current_cart.build_order(params[:order])
        @order.ip_address = request.remote_ip
        if @order.save d
          if @order.purchase
            render :action => "success"
          else
            render :action => "failure"
          end
        else
          render :action => 'new'
        end
    end
end