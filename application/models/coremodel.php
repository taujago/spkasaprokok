<?php
class coremodel extends CI_Model {
        function __construct() {
                parent::__construct();
        }
     
function add_arr_head($arr,$index,$str) {
  $res[$index] = $str;
  foreach($arr as $x => $y) : 
  $res[$x] = $y;
  endforeach;
  return $res;
}

function arr_dropdown($vTable, $vINDEX, $vVALUE, $vORDERBY){
                $this->db->order_by($vORDERBY);
                $res  = $this->db->get($vTable);
                $ret = array();
                foreach($res->result_array() as $row) : 
                        $ret[$row[$vINDEX]] = $row[$vVALUE];
                endforeach;
                return $ret;

 }


 function arr_dropdown_gejala(){

$this->db->_protect_identifiers = FALSE;
$this->db->order_by("cast(substring(kode,2,3) as SIGNED )",true);
    $res = $this->db->get("gejala");
    $arr = array();
    foreach($res->result() as $row) : 
        $arr[$row->id] = $row->kode." ".$row->gejala;
    endforeach;
    return $arr;
 }

function arr_dropdown_penyakit(){
    $this->db->order_by("kode");
    $res = $this->db->get("penyakit");
    $arr = array();
    foreach($res->result() as $row) : 
        $arr[$row->id] = $row->kode." ".$row->penyakit;
    endforeach;
    return $arr;
 }

 function arr_dropdown_gejalax(){
    $this->db->order_by("kode");
    $res = $this->db->get("gejala");
    $arr = array();
    foreach($res->result() as $row) : 
        $arr[$row->id] = $row->kode." ".$row->gejala;
    endforeach;
    return $arr;
 }

}
?>
