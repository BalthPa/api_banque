<?php

    switch ($_SERVER["REQUEST_METHOD"]) {
        case 'GET':
            if (key_exists("id", $_GET)) {
                if (intval($_GET["id"])) {
                    $class->getOne($_GET["id"]);
                } else {
                    $app->sendData("Merci de rentrer un id valide");
                }
            } else {
                $class->getAll();
            }
            break;

        case 'POST':
            $class->save($_POST);
            break;

        case 'DELETE':
            if (intval($_GET["id"])) {
                $class->delete($_GET["id"]);
            } else {
                $app->sendData("Merci de rentrer un id valide");
            }
            break;

        case 'PUT':
            $class->put($_GET["id"], file_get_contents("php://input"));
            break;
        default:
            $app->sendData("Erreur de méthode de requête");
            break;
}
