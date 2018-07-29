# Docker containers for tricoteuses application

This repo is an intent to provide docker containers for tricoteuses application. 

Tricoteuses is an application of [parlement ouvert](https://framagit.org/parlement-ouvert) which intends to open the data of the french parlement so it can be easily used by contributors. 

Tricoteuses comes in 3 different softwares interacting through a postgres database. 

Softwares are the following : 
 - [Tricoteuses-daemon](https://framagit.org/parlement-ouvert/tricoteuses-daemon) : An software for automatic feed our database
 - [Tricoteuses-api](https://framagit.org/parlement-ouvert/tricoteuses-api) : A graphQl API for requesting database
 - [Tricoteuses-ui](https://framagit.org/parlement-ouvert/tricoteuses-ui) : Front-end application for exploring data. 

 Docker containers here should allow to build environment running those softwares easily. 

