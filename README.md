# README

## Motivation

    Cook book to share and keep your delicious recipes
![My cookbook](https://github.com/rogeriobispo/cookbook/blob/master/public/Captura%20de%20tela%20de%202018-03-05%2012-03-35.png)

## Requiriments
    * Ruby 2.4.0
    * Rails 5.1.4
    * Postgres 9.5

## Optional
    * docker
    * docker-compose

## Setup
    * git clone git@github.com:rogeriobispo/cookbook.git
    * bundle install
    * rails db:create
    * rails db:migrate
    * puma -C config/puma.rb

## Docker Setup
    * docker-compose build
    * docker-compose run --rm website bin/setup
    * docker-compose up

## Server up
    * puma -C config/puma.rb

## Database creation
    * rails db:create

## Database Initialization
    * rails db:create
    * rails db:migrate

## How to run Test Suite
    * rspec -fd
