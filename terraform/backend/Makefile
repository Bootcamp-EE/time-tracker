export TF_LOG:=WARN
.PHONY: deploy
deploy:
	terraform init -input=false
	terraform plan -input=false
	terraform apply -auto-approve

.PHONY: destroy
destroy:
	terraform destroy -auto-approve

-include User.mk
-include ../User.mk
-include ../../User.mk
-include ~/User.mk
