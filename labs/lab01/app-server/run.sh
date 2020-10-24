if [ ! -d "swap" ]; then
    git clone https://github.com/Hackathonners/swap.git && cd swap
else
    cd swap && git pull
fi

rm .env.example && mv ../app-server/.env .env

composer install && npm install

php artisan key:generate && php artisan serve --host=0.0.0.0
