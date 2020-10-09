<?php

require 'app.php';
$app = new App();

if (key_exists("page", $_GET)) {
    $page = ucfirst($_GET["page"]);

    require $page.".php";
    $class = new $page();

    require 'router.php';

} else {
    $app->sendData("Erreur de choix de table");
}
