FROM python:3.9.1

# Work directory project
WORKDIR /usr/src/app

# OS Debian 10 (optional) for Microsoft SQL SSL Select data
RUN apt-get update -yqq \
    && apt-get install -y --no-install-recommends openssl \ 
    && sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf \
    && sed -i 's,^\(CipherString[ ]*=\).*,\1'DEFAULT@SECLEVEL=1',g' /etc/ssl/openssl.cnf\
    && rm -rf /var/lib/apt/lists/*

# Microsoft SQL Driver and package (required)
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql17 g++ unixodbc-dev

# Time zone
ENV TZ Asia/Bangkok
ENV LANG en_US.UTF-8

# install package python
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# RUN project
COPY . .
CMD ["python", "app.py"]