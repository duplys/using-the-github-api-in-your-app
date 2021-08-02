This is an example GitHub App that adds a label to all new issues opened in a repository. You can follow the "[Using the GitHub API in your app](https://developer.github.com/apps/quickstart-guides/using-the-github-api-in-your-app/)" quickstart guide on developer.github.com to learn how to build the app code in `server.rb`.

This project listens for webhook events and uses the Octokit.rb library to make REST API calls. This example project consists of two different servers:
* `template_server.rb` (GitHub App template code)
* `server.rb` (completed project)

To learn how to set up a template GitHub App, follow the "[Setting up your development environment](https://developer.github.com/apps/quickstart-guides/setting-up-your-development-environment/)" quickstart guide on developer.github.com.


## Running the example GitHub App in the Docker container
TBD: need to adjust Makefile to pass the correct Smee URL. 
Run `make` to build the Docker image containing the `smee` client. To start the container, use `make run`. What it does under the surface is to execute the command `docker container run -it --rm -e SMEE_URL='https://smee.io/Ch0Kk0wcNDlwqpn' -p 3000:3000 -v $(CURDIR):/opt/github-app github-app-example`. This command starts the container and passes the value `https://smee.io/Ch0Kk0wcNDlwqpn` in the environment variable `SMEE_URL` and bind mounts the current directory under `/opt/github-app` in the Docker container (which allows us to make changes to the app's source code from the host while running it in the Docker container). 

[Setting up your development environment](https://developer.github.com/apps/quickstart-guides/setting-up-your-development-environment/), you can start the Docker container by issuing `make run` on your host. In the Docker container run:

```shell
root@5fb3ad7073a4:/opt/github-app# smee --url ${SMEE_URL} --path /event_handler --port 3000 &
[1] 501
root@5fb3ad7073a4:/opt/github-app# Forwarding https://smee.io/Ch0Kk0wcNDlwqpn to http://127.0.0.1:3000/event_handler

root@5fb3ad7073a4:/opt/github-app# Connected https://smee.io/Ch0Kk0wcNDlwqpn

root@5fb3ad7073a4:/opt/github-app# bundle exec ruby template_server.rb
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1641: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann.rb:62: warning: The called method `new' is defined here
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/pattern.rb:59: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/regular.rb:22: warning: The called method `initialize' is defined here
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1604: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1621: warning: The called method `compile!' is defined here
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/pattern.rb:59: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/regexp_based.rb:17: warning: The called method `initialize' is defined here
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/ast/compiler.rb:43: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/mustermann-1.0.3/lib/mustermann/ast/compiler.rb:49: warning: The called method `pattern' is defined here
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/options.rb:166: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/options.rb:166: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/options.rb:166: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/options.rb:166: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/options.rb:166: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/faraday-0.15.3/lib/faraday/rack_builder.rb:55: warning: Capturing the given block using Proc.new is deprecated; use `&block` instead
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1348: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1359: warning: The called method `add_filter' is defined here
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1360: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/var/lib/gems/2.7.0/gems/sinatra-2.0.4/lib/sinatra/base.rb:1621: warning: The called method `compile!' is defined here
[2021-07-31 11:32:04] INFO  WEBrick 1.6.0
[2021-07-31 11:32:04] INFO  ruby 2.7.0 (2019-12-25) [x86_64-linux-gnu]
== Sinatra (v2.0.4) has taken the stage on 3000 for development with backup from WEBrick
[2021-07-31 11:32:04] INFO  WEBrick::HTTPServer#start: pid=512 port=3000
```

Continue [reading here](https://docs.github.com/en/developers/apps/guides/using-the-github-api-in-your-app) to see how to setup the correct permissions in the App's section on GitHub in order to access issues.



## Install

To run the code, make sure you have [Bundler](https://bundler.io/) installed; then enter `bundle install` on the command line.

## Set environment variables

1. Create a copy of the `.env-example` file called `.env`.
2. Add your GitHub App's private key, app ID, and webhook secret to the `.env` file.

## Run the server

1. Run `ruby template_server.rb` or `ruby server.rb` on the command line.
1. View the default Sinatra app at `localhost:3000`.

