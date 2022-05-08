banner:
	@echo "#########################################################################"
	@echo "##                                                                     ##"
	@echo "##      ::: ::::::::::: :::    ::: :::::::::: ::::    :::     :::      ##" 
	@echo "##    :+: :+:   :+:     :+:    :+: :+:        :+:+:   :+:   :+: :+:    ##" 
	@echo "##   +:+   +:+  +:+     +:+    +:+ +:+        :+:+:+  +:+  +:+   +:+   ##" 
	@echo "##  +#++:++#++: +#+     +#++:++#++ +#++:++#   +#+ +:+ +#+ +#++:++#++:  ##" 
	@echo "##  +#+     +#+ +#+     +#+    +#+ +#+        +#+  +#+#+# +#+     +#+  ##" 
	@echo "##  #+#     #+# #+#     #+#    #+# #+#        #+#   #+#+# #+#     #+#  ##" 
	@echo "##  ###     ### ###     ###    ### ########## ###    #### ###     ###  ##" 
	@echo "##                                                                     ##"
	@echo "#########################################################################"
	@echo "                                                                          "

vault: banner
	@echo "[vault] Getting configuration and secrets from Vault"
	@./bin/vault.sh

terraform: banner vault
	@echo "[terraform] Creating cluster infrastructure with terraform"
	@./bin/terraform.sh

kubespray: banner vault
	@echo "[kubespray] Configuring cluster infrastructure with kubespray"
	@./bin/kubespray.sh

deploy: banner terraform kubespray
	@echo "[deploy] Finished bootstrapping cloud"
