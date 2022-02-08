## Here you can define useful functions

## Show the Internet address
function my_ip_wan() {
  curl -s http://ifconfig.me
}

## Creates a directory and cd to it
function mkdircd() {
	mkdir "$1" && cd "$1"
}

function ruby_http_server() {
	ruby -run -e httpd . -p 8080
}

function python_http_server() {
	python3 -m http.server 8080 \
	--bind 127.0.0.1 \
	--cgi \
	--directory . 
}

function set_proxy() {
	export http_proxy="http://$1"
	export https_proxy="$http_proxy"
	export ftp_proxy="$http_proxy"
	export HTTP_PROXY="$http_proxy"
	export HTTPS_PROXY="$http_proxy"
	export FTP_PROXY="$http_proxy"
	env | grep -i proxy
}

function unset_proxy() {
	unset http_proxy
	unset https_proxy
	unset ftp_proxy
	unset HTTP_PROXY
	unset HTTPS_PROXY
	unset FTP_PROXY
	env | grep -i proxy
}
