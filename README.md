# simple-docker-flask-mssql
A Simple Build Docker image for Python Flask Apps with MSSQL

Docker
----------------

.. code-block:: text

    docker build -t flaskapp .

.. code-block:: text

    docker run -it -p 5000:5000 --rm --name flaskapp flaskapp
