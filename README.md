# EasyConsultas
Webapp criado usando Rails 6 com MongoDB para ajudar consultórios médicos na organizacão de consultas:

Techs:
* Ruby 2.6.5
* Mongo 4.4 (mongoid: 7.1)
* Node 12.18.3
* Yarn 1.22.4
* Bootstrap 4.5.2
* admin-lte 3.0.5

* Configuration
  Para rodar a aplicacão basta instalar o ruby na versão correta e a gem (bundler), após isso entre na pasta do projeto e rode o comando `bundle install`

* Database creation
  Como o banco utilizado é o Mongo não é necessário rodar comandos para criar e migrar o banco.
  
* Database initialization
  No arquivo `config/mongoid.yml` é possível mudar as configuracões do banco, como: nome, usuario, porta, sharding, etc
