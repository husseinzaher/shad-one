<?php
class ModelModuleSizechart extends Model {

	private $data = array();
	
	/* createSizechartColumn function start */
	public function createSizechartColumn(){
        $this->db->query(" ALTER TABLE `".DB_PREFIX ."product_description` ADD `size_chart` LONGTEXT NOT NULL AFTER `description` "); 		
	}
    /* createSizechartColumn function end */

	/* dropSizechartColumn function start */	
	public function dropSizechartColumn(){
		$this->db->query("ALTER TABLE `".DB_PREFIX ."product_description` DROP `size_chart`");	
	}
	/* dropSizechartColumn function end */
}
?>
