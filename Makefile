setup-localenv:
	brew install ansible && \
	pip install -r requirements.txt --user && \
	brew install terraform

shutdown-prod:
	cd terraform && terraform destroy && cd ..

create-prod:
	cd terraform && \
	terraform apply && \
	cd .. && \
	sleep 30

config-prod:
	cd ansible && \
	ansible-galaxy install -r requirements.yml -p roles && \
	ansible-playbook -i inventory/digital_ocean.py playbook.yml --ask-vault-pass && \
	cd ..
	
startup-prod: create-prod config-prod
	
startup-dev:
	docker-compose up -d 

shutdown-dev:
	docker-compose down

release-app:
	cd codigo-fonte/app/ && \
	docker build -t igordcsouza/pdapp && \
	cd ../../

release-nginx:
	cd codigo-fonte/nginx/ && \
	docker build -t igordcsouza/pdnginx && \
	cd ../../