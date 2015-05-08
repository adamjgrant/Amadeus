build:
	@echo Running DocToc in github mode
	@doctoc ./README.md --github

setup:
	@echo "Installing doctoc"
	@npm install -g doctoc
	@make build
