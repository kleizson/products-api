# products-api

  

Esta api tem o objetivo de gerenciar produtos, Ela é somente um CRUD básico.

## Desenvolvimento

Para iniciar o desenvolvimento, é necessário clonar o projeto do GitHub num diretório de sua preferência:

```shell
cd "diretorio de sua preferencia"
git clone https://github.com/kleizson/products-api.git
```
### Construção

Para instalar todas as depedências necessárias, e iniciar o servidor, executar o comando abaixo:

```shell

bundle install
rails db:create
rails db:migrate
rails server

```

## Testes

Para executar os testes execute este comando abaixo:

```shell

bundle exec rspec

```

# Endpoints

Retorna todos os produtos cadastrados.

__GET__ ```http://localhost:3000/products```


```
// GET http://localhost:3000/products

{
  "produtos": [
    {
      "id": 1,
      "name": "Iphone 20",
      "price": 3999.99,
      "description": "Iphone 20 com 64GB de memoria",
      "created_at": "2020-06-22T13:54:31.062Z",
      "updated_at": "2020-06-22T22:47:32.697Z"
    },
    {
      "id": 3,
      "name": "Iphone 50",
      "price": 29.9,
      "description": "Iphone 50 com 64GB de memoria",
      "created_at": "2020-06-22T21:28:07.032Z",
      "updated_at": "2020-06-22T22:53:01.739Z"
    },
    {
      "id": 4,
      "name": "Iphone 60",
      "price": 6999.99,
      "description": "Iphone 60 com 64GB de memoria",
      "created_at": "2020-06-22T21:29:11.932Z",
      "updated_at": "2020-06-22T21:29:11.932Z"
    }
    ...
  ]
}

```
---
Cadastra um produto no banco de dados.

```
body = {
    name: "Iphone 60",
    price: 6999.99,
    description: "Iphone 60 com 64GB de memoria"
}

```


__POST__ ```http://localhost:3000/products```


```
// POST http://localhost:3000/products

{
  "message": "Produto cadastrado com sucesso!",
  "produto": {
    "id": 4,
    "name": "Iphone 60",
    "price": 6999.99,
    "description": "Iphone 60 com 64GB de memoria",
    "created_at": "2020-06-22T21:29:11.932Z",
    "updated_at": "2020-06-22T21:29:11.932Z"
    }
}

```
---
Retorna um produto com id especificado.

__GET__ ```http://localhost:3000/products/id```


```
// GET http://localhost:3000/products/1

{
  "produto": {
    "id": 1,
    "name": "Iphone teste",
    "price": 3999.99,
    "description": "Iphone 90 com 64GB de memoria",
    "created_at": "2020-06-22T13:54:31.062Z",
    "updated_at": "2020-06-22T22:47:32.697Z"
  }
}

```
---
Atualiza um produto.

```
body = {
    "price": 29.90
}

```


__PUT__ ```http://localhost:3000/products/id```


```
// PUT http://localhost:3000/products/3

{
  "message": "Produto Atualizado com sucesso!",
  "produto": {
    "id": 3,
    "price": 29.9,
    "name": "Iphone 50",
    "description": "Iphone 50 com 64GB de memoria",
    "created_at": "2020-06-22T21:28:07.032Z",
    "updated_at": "2020-06-22T22:53:01.739Z"
  }
}

```
---
Deleta um produto.

__DELETE__ ```http://localhost:3000/products/id```


```
// DELETE http://localhost:3000/products/4

{
  "message": "Produto Deletado com sucesso!"
}

```
---





  

