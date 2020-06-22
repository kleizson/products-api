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

    def create

        unless (params.has_key?(:name) && params.has_key?(:price) && params.has_key?(:description))
            
            return render json: {
                error:{
                    message: "Erro ao cadastrar produto! falta informações na requisição!"
                }
            },
            status: :bad_request
        
        end

        @product = Product.new(product_params)

        
        if  @product.save

            render json: {
                message: "Produto cadastrado com sucesso!",
                produto: @product
            },
            status: :ok

        else

            render json: {
                error:{
                    message: "Erro ao cadastrar produto!"
                }
            },
            status: :unprocessable_entity

        end
        
        
    end

    def show

        @product = Product.find(params[:id]) if Product.exists?(params[:id])

        if @product

            render json: {
                produto: @product
            },
        status: :ok

        else

            render json: {
                error:{
                    message: "Produto não encontrado!"
                }
            },
            status: :bad_request

        end

    end

    def update

        @product = Product.find(params[:id]) if Product.exists?(params[:id])

        if @product

            @product.update_attributes(product_params)

            render json: {
                message: "Produto Atualizado com sucesso!",
                produto: @product
            },
            status: :ok

        else
            
            render json: {
                error:{
                    message: "Produto não encontrado!"
                }
            },
            status: :bad_request

        end
    
    end


    
    private

    def product_params

       params.permit(:name ,:price ,:description)

    end


end
