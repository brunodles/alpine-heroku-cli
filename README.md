# Alpine Heroku CLI

This image packages the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) inside an Alpine Linux based Docker container. The version will track that of the Heroku CLI.

## Usage

The easiest way to use this would be to use your Heroku [API key](https://dashboard.heroku.com/account) or an [OAuth authorization token](https://github.com/heroku/heroku-cli-oauth#authorizations) set as the `HEROKU_API_KEY` environment variable.

Another method would be to mount your `~/.netrc` as a volume on the docker container. This would use your local Heroku login credentials for authentication.

```bash
docker run wingrunr21/alpine-heroku-cli version
# heroku-cli/5.6.12-c892d56 (linux-amd64) go1.6.3

# API key/OAuth token method
docker run --rm -e HEROKU_API_KEY="abc-123123123" wingrunr21/alpine-heroku-cli list
# == Collaborated Apps
# app1
# app2
# ...
docker run --rm -v ~/.netrc:/root/.netrc:ro wingrunr21/alpine-heroku-cli list
# == Collaborated Apps
# app1
# app2
# ...
```

### Alias
Another option is to create an alias on `~/.bashrc` or `~/.zshrc` to map to heroku inside docker.

```bash
alias heroku="touch ~/.netrc && docker run --rm -it -v ~/.netrc:/root/.netrc -v $(pwd):/app -w /app brunodles/alpine-heroku-cli"
```

This alias have one "setup step" to make everything work fine.
* Create a `.netrc` file inside user home
* Run docker command

This docker command will:
* Remove itself on the end
* Make a link between host and guest `.netrc` files. (it's a volume)
* Make a volume with local folder and `app` folder inside container

This will ensure you can run Heroku CLI as usual.
