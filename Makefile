setup-localenv:
	brew install ansible && \
	pip install -r requirements.txt --user && \
	brew install terraform

shutdown-prod:
	cd terraform && terraform destroy && cd ..

startup-prod:
	cd terraform && terraform apply && cd ..

setup-prod:
	cd ansible && \
	ansible-galaxy install -r requirements.yml -p roles && \
	ansible-playbook -i inventory/digital_ocean.py playbook.yml && \
	cd ..

startup-dev:
	docker-compose up -d 

shutdown-dev:
	docker-compose down