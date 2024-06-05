<?php


require_once realpath(__DIR__ . '/vendor/autoload.php');

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv -> load();

$uri = parse_url($_SERVER["REQUEST_URI"])["path"];

$routes = [
    "/" => "controllers/index.php",
    "/sendEmail" => "controllers/sendMail.php",
];

if (array_key_exists($uri, $routes)) {
    require $routes[$uri];
}