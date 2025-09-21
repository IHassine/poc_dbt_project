
FROM python:3.13
WORKDIR /dbt_project_poc
RUN pip3 install dbt-bigquery
COPY . .