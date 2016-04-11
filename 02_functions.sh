## Show all processes listening on TCP ports
function tcplisten() {
	sudo netstat -tlnp
}

## Show all processes listening on UDP ports
function udplisten() {
	sudo netstat -ulnp
}

## Try to exec a program until get success
function tryrun() {
	local COUNT=0
	until $@  
	do
		let COUNT++
		echo "${COUNT}o. error running $@"
		sleep 2
	done
}

## Create a simple Self Signed Certificate
function new_self_signed_certificate() {
  local NAME="$1"
  ## Create a key
  openssl genrsa -des3 -out "$NAME".key 1024
  ## Create a CSR
  openssl req -new -key "$NAME".key -out "$NAME".csr
  ## Removes key's password
  mv "$NAME".key "$NAME".key.org
  openssl rsa -in "$NAME".key.org -out "$NAME".key
  rm -f "$NAME".key.org
  ## Self sign the certificate
  openssl x509 -req -days 365 -in "$NAME".csr -signkey "$NAME".key -out "$NAME".crt
  ## Export from PEM to PFX
  openssl pkcs12 -export -out "$NAME".pfx -in "$NAME".crt -inkey "$NAME".key
}

## Check of a process is running using its name
function is_running() {
	sudo ps -ef | grep --color=auto -v grep | grep --color=auto "$1"
	[ $? -eq 0 ] && echo "Yes, it is running." || echo "No, it is stopped."
}

## Create a set of files to a new OpenVPN Shared Key connection
function create_openvpn_config() {
	[ -z $1 ] && echo "Usage: $0 config-name" && return 1
  local NAME="$1"
  mkdir "${NAME}"
  cd "${NAME}"
  touch "${NAME}-client.conf" "${NAME}-server.conf"
  openvpn --genkey --secret "${NAME}.key"
  
cat >> "${NAME}-client.conf" <<-EOF
remote 200.200.200.200 1234 ## REPLACE HERE
dev tun
ifconfig 172.16.1.2 172.16.1.1 ## REPLACE HERE
secret ${NAME}.key
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
persist-key
daemon
route 0.0.0.0 0.0.0.0
EOF

cat >> "${NAME}-server.conf" <<-EOF
dev tun
port 1234 ## REPLACE HERE
ifconfig 172.16.1.1 172.16.1.2 ## REPLACE HERE
secret ${NAME}.key
comp-lzo
keepalive 10 60
ping-timer-rem
persist-tun
persist-key
user nobody
group nobody
daemon
EOF
}

## Show the lan IP
function my_ip_lan() {
  ip addr list dev "${1:-eth0}" | 
  egrep -o 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | 
  cut -d ' ' -f 2
}

## Show the Internet address
function my_ip_wan() {
  curl -s http://ifconfig.me
}

## Creates a directory and cd to it
function mkdircd() {
	mkdir "$1" && cd "$1"
}

function ruby_htto_server() {
	ruby -run -e httpd . -p 8080
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

function emacs() {
	## Is the emacs server running?
	pgrep -l "^emacs$" > /dev/null
	[ $? -ne 0  ] && emacs --daemon


	## Text or X11?
	[ -z "$DISPLAY"  ] && X11="-t" || X11=""

	## Return a list of all frames on $DISPLAY
	\emacsclient -e "(frames-on-display-list \"$DISPLAY\")" &>/dev/null

	## Open frames detected, so open files in current frame
	# or if  no open frames detected, open new frame
	[ $? -eq 0  ] && \emacsclient --alternate-editor="" -n $X11 "$@" ||
	\emacsclient --alternate-editor="" -n $X11 -c "$@"
}
