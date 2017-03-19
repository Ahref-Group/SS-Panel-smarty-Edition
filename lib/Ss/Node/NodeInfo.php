<?php


namespace Ss\Node;


class NodeInfo extends \Ss\Etc\Db {

    private $table = "ss_node";

    function NodeArray(){
        $datas = $this->db->select($this->table,"*",[
            "id" => $this->id,
            "LIMIT" => "1"
        ]);
        return $datas['0'];
    }

    function Server(){
        return $this->NodeArray()['node_server'];
    }

    function Method(){
        return $this->NodeArray()['node_method'];
    }
	
	function protocol(){
        return $this->NodeArray()['protocol'];
    }
	
	function obfs(){
        return $this->NodeArray()['obfs'];
    }
	
	function parameter(){
        return $this->NodeArray()['parameter'];
    }

    function Del(){
        $this->db->delete($this->table,[
            "id" => $this->id
        ]);
    }

    function Update($node_name,$node_type,$node_server,$node_method,$node_info,$node_status,$node_order,$protocol,$obfs,$parameter){
        $this->db->update("ss_node", [
            "node_name" => $node_name,
            "node_type" => $node_type,
            "node_server" => $node_server,
            "node_method" => $node_method,
            "node_info" => $node_info,
            "node_status" => $node_status,
            "node_order" =>  $node_order,
			"protocol" =>  $protocol,
			"obfs" =>  $obfs,
			"parameter" =>  $parameter
        ],[
            "id[=]"  => $this->id
        ]);
        return 1;
    }
}
