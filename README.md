# Passei Direto
#### Projeto - Vaga Infra / Devops

O seu projeto consiste em preparar o provisionamento do ambiente para rodar uma aplicação. A aplicação é uma **API** implementada com ​**Node.js​ + ​MySQL​**. É uma API para criação e
consulta de anotações. O código fonte está na pasta `codigo-fonte`.

Você deve:

* Montar uma estrutura com ​Docker​ que consista de
  * 1 container rodando a aplicação em ​Node.js
  * 1 container rodando um banco de dados ​MySQL
  * 1 container rodando um servidor ​nginx

* Rodar a aplicação na porta 8080 e colocar o ​nginx ​como reverse proxy da aplicação, servindo a API na porta 80 do host

* Preparar o banco de dados para ser usado pela aplicação

* Fornecer comandos para criação e inicialização do ambiente de forma automatizada
  * Usar ​Ansible​,​ Terraform ​ou ​Salt 5. Criar um repositório no ​Github ​com
  * Código fonte da aplicação
  * Todos os scripts criados para a solução
  * Pré-requisitos e instruções para rodar a solução localmente

No final, avalie o funcionamento do ambiente, testando as operações de:

* Criar Anotação
* Listar Anotações
* Remover Anotação da API.

Ao terminar enviar por email o link do ​Github ​do projeto. 

Boa sorte, e nos vemos em breve.