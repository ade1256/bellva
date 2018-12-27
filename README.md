# Bellva


## Requirements

* PHP 5.6.4 or higher
* Database (eg: MySQL, PostgreSQL, SQLite)
* Web Server (eg: Apache, Nginx, IIS)
* [Other libraries](https://Bellva.com/docs/requirements)

## Framework

Bellva uses [Laravel](http://laravel.com), the best existing PHP framework, as the foundation framework and [Modules](https://nwidart.com/laravel-modules) package for Apps.

## Installation

  * Install [Composer](https://getcomposer.org/download)
  * Download the repository and unzip into your server
  * Open and point your command line to the directory you unzipped Bellva
  * Run the following command: `composer install`
  * Finally, launch 

## Docker

It is possible to containerise Bellva using the [`docker-compose`](docker-compose.yml) file. Here are a few commands:

```
# Build the app
docker build -t Bellva .

# Run the app
docker-compose up -d

# Make sure you the dependencies are installed
docker-compose exec web composer install

# Stream logs
docker-compose logs -f web

# Access the container
docker-compose exec web /bin/sh

# Stop & Delete everything
docker-compose down -v
```
