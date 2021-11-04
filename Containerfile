FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN lp_endpoints create-db
RUN lp_endpoints populate-db
RUN lp_endpoints add-user -u admin -p admin
EXPOSE 5000
CMD ["lp_endpoints", "run"]
