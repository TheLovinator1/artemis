<?php

function adminer_object() {

    class MyDbLocalAdminer extends Adminer\Adminer {

        function loginForm() {
            echo Adminer\input_hidden('auth[driver]', $_ENV['ADMINER_DRIVER']);
            echo Adminer\input_hidden('auth[server]', $_ENV['ADMINER_SERVER']);
            echo Adminer\input_hidden('auth[username]', $_ENV['ADMINER_USERNAME']);
            echo Adminer\input_hidden('auth[password]', $_ENV['ADMINER_PASSWORD']);
            echo Adminer\input_hidden('auth[db]', $_ENV['ADMINER_DATABASE']);
            echo Adminer\script("document.querySelector('form').submit();");

        }
    }

    return new MyDbLocalAdminer;
}

include '/var/www/html/adminer.php';