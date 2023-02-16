# ft_server
> Common core project at School 42 - Paris
>
> This project is an introduction to Docker

## Introduction
This project is about creating a web server capable of running a wordpress, a phpmyadmin, and a database. This server will run in a Docker container, under Debian Buster.

## General guidelines
1. You must set up a web server with Nginx, in only one docker container. The container OS must be debian buster.
2. Your web server must be able to run several services at the same time. The services will be a WordPress website, phpMyAdmin and MySQL.
3. Your server should be able to use the SSL protocol.
4. You will also need to make sure your server is running with an autoindex that must be able to be disabled.

## Content
`Dockerfile` contains instructions for building the web server docker image

`srcs/` contains configuration and bash script files
