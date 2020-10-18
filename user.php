<?php

require "general.php";

class User extends General{

    protected $table = "user";

    public function save($param){
        $statement = "INSERT INTO user (nom, prenom, email, password, role)
                        VALUES (:nom, :prenom, :email, :password, :role)";

        $param["nom"]= htmlspecialchars($param["nom"]);
        $param["prenom"]= htmlspecialchars($param["prenom"]);
        $param["password"]= password_hash($param["password"], PASSWORD_DEFAULT);
        $param["role"]= json_encode(["ROLE_USER"]);

        $this->db->prepare($statement, 'save', $param);
    }
}
