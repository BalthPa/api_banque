<?php

require "database.php";

class General {

    public $db;
    protected $table;

    public function __construct()
    {
        $this->db = new Database();
        // $this->table = strtolower($this->table);
    }
    /**
     * Get all informations
     *
     */
    public function getAll()
    {
        $this->db->query("SELECT * FROM $this->table");
    }

    /**
     * Get one line of information
     *
     * @param int $id
     */
    public function getOne($id)
    {
        $this->db->query("SELECT * FROM $this->table WHERE id=$id", true);
    }

    /**
     * Save informations in Db
     *
     * @param array $param
     */
    public function save($param)
    {
        $statement = "INSERT INTO $this->table (";
        $values = " VALUES (";
        foreach ($param as $key => $value) {
            $statement .= $key. ", ";
            $values .= ":".$key. ", ";
        }
        $statement = substr($statement, 0, -2) . ") ";
        $values = substr($values, 0, -2) . ")";

        $statement .= $values;

        $data = array();
        foreach ($param as $key => $value) {
            $data[$key] = htmlspecialchars($value);
        }

        $this->db->prepare($statement, "save", $data);
    }

    /**
     * delete one line in categorie
     *
     * @param int $id
     */
    public function delete($id)
    {
        $statement = "DELETE FROM $this->table WHERE id=$id";
        $this->db->prepare($statement, "delete");
    }

    /**
     * Modify data in categorie
     *
     * @param int $id
     * @param string $param
     */
    public function put($id, $param){
        $put = explode(",", $param);
        $data= array();

        foreach ($put as $value) {
            $elmt = explode(":", $value);
            $data[$elmt[0]] = $elmt[1];
        }

        $statement = "UPDATE $this->table SET ";
        foreach ($data as $key => $value) {
            $statement .= $key."=".$value.", ";
        }
        $statement = substr($statement, 0,-2);
        $statement .= " WHERE id=$id";
        $this->db->prepare($statement, "put", $data);
    }
}
