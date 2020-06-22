require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "Tem que retornar todos os produtos" do
      get "/products"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /products" do
    context "Com body correto" do
      it "Tem que cadastrar o produto no Bando de dados" do
        post "/products", :params => { 
          :name => "Produto Teste", 
          :price => 1999.99, 
          :description => "Produto teste com 64GB" 
        }

        expect(response).to have_http_status(:created)
        expect(response.body).to include("Produto cadastrado com sucesso!")
      end
    end

    context "Com body faltando informações" do
      it "Tem que retornar status de erro e uma mensagem de erro" do
        post "/products", :params => { 
          :name => "Produto Teste", 
          :price => 1999.99 
        }

        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("Erro ao cadastrar produto! falta informações na requisição!")
     
      end
    end

  end

  describe "GET /products/id" do
    context "Com Id valido" do
      it "Tem que retornar o produto com o id especificado" do
        
        produto = Product.create({
          :name => "Produto Teste", 
          :price => 1999.99, 
          :description => "Produto teste com 64GB"
        })

        get "/products/#{produto[:id]}"
        
        expect(response).to have_http_status(:ok)
      
      end
    end

    context "Com Id invalido" do
      it "Tem que retornar status de erro e uma mensagem de erro" do

        get "/products/idinvalido"
        
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("Produto não encontrado!")
      
      end
    end

  end

  describe "PUT /products/id" do

    context "Com body correto" do
      it "Tem que atualizar o produto com o id especificado" do

        produto = Product.create({
           :name => "Produto Teste", 
           :price => 1999.99, 
           :description => "Produto teste com 64GB"
        })

        put "/products/#{produto[:id]}", :params => { 
           :name => "Produto Teste Update" 
        }

        expect(response).to have_http_status(:ok)
        expect(response.body).to include("Produto Atualizado com sucesso!")
      end
    end

    context "Com body sem nenhuma informação" do
      it "Tem que retornar status de OK porém, uma mensagem de aviso" do

        produto = Product.create({
           :name => "Produto Teste", 
           :price => 1999.99, 
           :description => "Produto teste com 64GB"
        })

        put "/products/#{produto[:id]}"

        expect(response).to have_http_status(:ok)
        expect(response.body).to include("O produto não foi alterado, não foi passado nenhum valor para alteração.")
     
      end
    end

    context "Com Id invalido" do
      it "Tem que retornar status de erro e uma mensagem de erro" do

        put "/products/idinvalido", :params => { 
          :name => "Produto Teste Update" 
       }

        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("Produto não encontrado!")
     
      end
    end

  end

  describe "DELETE /products/id" do
    it "Tem que deletar o produto com o id especificado" do

    produto = Product.create({
        :name => "Produto Teste", 
        :price => 1999.99, 
        :description => "Produto teste com 64GB"
    })

    delete "/products/#{produto[:id]}"

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Produto Deletado com sucesso!")
    end

    context "Com Id invalido" do

      it "Tem que retornar status de erro e uma mensagem de erro" do

        delete "/products/idinvalido"
    
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include("Produto não encontrado!")
        end

    end

  end
end
