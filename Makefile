build:
	docker build . -t github-app-example

run:
	docker container run -it --rm -e SMEE_URL='https://smee.io/Ch0Kk0wcNDlwqpn' -p 3000:3000 -v $(CURDIR):/opt/github-app github-app-example

	