# simple-docker-flask-mssql
A Simple Build Docker image for Python Flask Apps with MSSQL

Docker
----------------

.. code-block:: docker

    docker build -t flaskapp .

.. code-block:: docker

    docker run -it -p 5000:5000 --rm --name flaskapp flaskapp