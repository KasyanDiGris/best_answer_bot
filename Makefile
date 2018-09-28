BOT_NAME ?= best_answer

bot: requirements
	@echo "Build $(BOT_NAME)..."
	@mkdir -p zip
	@cp ./src/*.py zip/
	@cd zip ; zip -q ../$(BOT_NAME) ./* 
	@rm -rf zip
	@echo "#!/usr/bin/env python3" > $(BOT_NAME)
	@cat $(BOT_NAME).zip >> $(BOT_NAME)
	@rm $(BOT_NAME).zip
	@chmod +x $(BOT_NAME)
	@echo "Done"

requirements:
	@echo "Install requirements..."
	@pip3 install -r requirements.txt
	@echo "Done"

clean:
	@echo "Cleanup"
	@if [ -f $(BOT_NAME) ]; then rm $(BOT_NAME); fi
	@echo "Done"
