add-apt-repository -y ppa:ondrej/php && apt update

apt install -y php7.4 php7.4-{fpm,zip,mbstring,tokenizer,mysql,gd,xml,bcmath,intl,curl} nodejs composer npm
