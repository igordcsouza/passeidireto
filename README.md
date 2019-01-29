# Passei Direto
#### Projeto - Vaga Infra / Devops

## O Desafio

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

## Pré-requisitos

* Ansible
* Terraform
* Docker
* docker-compose
* Make
* Python Requests lib (Para utilizar o inventario dinamico da Digital Ocean)

Caso voce esteja utilizando um sistema operacional MacOS, para instalar o Ansible, Terraform e a lib `requests` do python basta executar o seguinte comando:

```make
make setup-localenv
```

## Dependencias

Crie um bucket na aws! No meu caso criei o com nome `passeidireto-challenge`. Depois altere no arquivo [backend.tf](./terraform/backend.tf)
Voce vai precisar adicionar o seu token da digital ocean a 2 variaveis diferentes, pois o `terraform` busca em uma e o arquivo de inventario dinamico em outra. Infelizmente :/ 

* DIGITALOCEAN_TOKEN
* DO_API_TOKEN
* AWS_ACCESS_KEY_ID (Precisa ter acesso de escrita no S3)
* AWS_SECRET_ACCESS_KEY (Precisa ter acesso de escrita no S3)

## Desenvolvimento

Nosso ambiente de desenvolvimento esta sendo montado pelo [docker-compose](./docker-compose.yml) inclusive todas as variaveis estao nesse arquivo para melhor entendimento de novos membros do time.

Para executar a **criacao** do ambiente e acessar a aplicacao, execute o seguinte comando:

```make
make startup-dev
```
Esse comando pode levar algum tempo, principalmente se for a primeira vez que e executado, ja que ele precisa fazer download de algumas imagens docker.


Caso queira **desligar** o ambiente, simplesmente execut:

```make
make shutdown-dev
```

## Producao

Para configurar nosso ambiente de producao, estamos utilizando o `terraform` para criar toda a infraestrutura necessaria e o `ansible` para fazer a configuracao:

Configuradas as variaveis de ambientes necessarias, para **criar** o ambiente simplesmente execute:

```make
make setup-prod
```

Para **deletar** o ambiente execute:

```make
make shutdown-prod
```

## Ansible Vault

Ao executar o ansible vai ser pedido uma senha do `ansible-vault` e essa é `passeidireto`.

## Problemas conhecidos (Melhorias futuras)

* Existe um bug que algumas vezes ao executar pela primeira vez a role de docker ela trava na instalação. Necessitando que seja executada novamente.