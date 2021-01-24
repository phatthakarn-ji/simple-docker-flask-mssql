# simple-docker-flask-mssql
A Simple Build Docker image for Python Flask Apps with MSSQL

Docker
----------------

build image

    docker build -t flaskapp .

run

    docker run -it -p 5000:5000 --rm --name flaskapp flaskapp
