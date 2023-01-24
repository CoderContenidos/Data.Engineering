## ----------------------------------------------------------------------
## Welcome to the Coderhouse's Data Engineering example project
## ----------------------------------------------------------------------

help: ## show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

build: ## build the solution
	echo "Building Airflow locally using the LocalExecutor"
	docker-compose -f docker-compose.yml build --progress=plain --no-cache

run: ## run the solution
	echo "Running Airflow locally using the LocalExecutor"
	docker-compose -f docker-compose.yml up -d

stop: ## stop running every container
	echo "Stopping all containers"
	docker-compose -f docker-compose.yml down -v --remove-orphans

enter-warehouse: ## enter the postgres DB with SQL
	docker exec -it coderhouse-final-project-demo_data_warehouse_1 psql -U airflow_dw --dbname dw

get-admin-password: ## get the admin's password
	docker exec -it coderhouse-final-project-demo_webserver_1 cat standalone_admin_password.txt

bash: ## enter the airflow container with bash
	docker exec -it coderhouse-final-project-demo_webserver_1 bash
