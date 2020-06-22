class ProductsController < ApplicationController

    def index
        
        @products = Product.order('created_at');

        if @products.empty?
            render json: {
                message: "Lista de produtos vazia!!"
            },
            status: :ok
        else
            render json: {
                produtos: @products
            },
            status: :ok
        end

    end

end
