<?php
class ModelExtensionOcmodeditsuite extends Model {

  public function getOcmod($modification_id){
    $sql = "SELECT * FROM " . DB_PREFIX . "modification WHERE modification_id = '" . $modification_id . "'";
    $query = $this->db->query($sql);
    return $query->row;
  }

  public function saveOcmod($data){
    $xml = html_entity_decode($data['xml']);
    $xml = $this->db->escape($xml);
    $sql = "UPDATE " . DB_PREFIX . "modification SET code = '" . $data['code'] . "', version = '" . $data['version'] . "', status = '" . $data['status'] . "', name = '" . $data['name'] . "', author = '" . $data['author'] . "', link = '" . $data['link'] . "', xml = '" . $xml . "' WHERE modification_id = '" . (int)$data['modification_id'] . "'";
    $result = $this->db->query($sql);
    return $result;
  }

  public function createOcmod($data){
    $xml = html_entity_decode($data['xml']);
    $xml = $this->db->escape($xml);
    $sql = "INSERT INTO " . DB_PREFIX . "modification (code,version,status,name,author,link,xml,date_added) VALUES ('".$data['code']."','".$data['version']."','".$data['status']."','".$data['name']."','".$data['author']."','".$data['link']."','".$xml."', NOW() )";
  
    if( $this->db->query($sql) ){
      $result = $this->db->query("SELECT modification_id FROM " . DB_PREFIX . "modification ORDER BY date_added DESC");
      return $result->row['modification_id'];
    }

    return false;

  }

}