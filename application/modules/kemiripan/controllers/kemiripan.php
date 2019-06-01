<?php
class kemiripan extends master_controller {
	function __construct(){
		parent::__construct();
		$this->load->model("coremodel","cm");
		 
		$this->controller = get_class($this);

	}

	function index(){
		// echo "fuckkk.."; exit;
		$data_array = array();


		$this->db->select('k.id, g1.gejala as gejala1, g1.id as gejala_id_1,
			g2.gejala as gejala2, g2.id as gejala_id_2, k.bobot')
		->from('gejala g1')
		->join("kemiripan k","k.gejala_id_1 = g1.id")
		->join("gejala g2","k.gejala_id_2 = g2.id");


		$res = $this->db->get();
		$data_array['record'] = $res; 
		 
		$content = $this->load->view($this->controller."_view",$data_array,true);

		$this->set_title("DATA  KEMIRIPAN GEJALA PENYAKIT");
		$this->set_content($content);
		$this->render();
	}

	function save(){


		$post = $this->input->post();
		// show_array($post); exit;

		$this->load->library('form_validation');
 		$this->form_validation->set_rules('gejala_id_1','Gejala 1','required|number');
 		$this->form_validation->set_rules('gejala_id_2','Gejala 2','required|number');
 		
		 
		$this->form_validation->set_message('required', ' %s Harus diisi ');
		
 		$this->form_validation->set_error_delimiters('', '<br>');

 		if($this->form_validation->run() == TRUE ) { 
 			unset($post['id']);

 			 
 			$res = $this->db->insert("kemiripan",$post);


 			if($res){

 				 

 				$ret = array("error"=>false,"message"=>"Data kemiripan gejala berhasil disimpan");
 			}
 			else {
 				$ret = array("error"=>true,"message"=>"Data kemiripan gejala gagal disimpan".mysql_error());
 			}
 		}
 		else {
 			$ret = array("error"=>true,"message"=>validation_errors());
 		}

 		echo json_encode($ret);
	}
 


 function update(){


		$post = $this->input->post();
		// show_array($post); exit;

		$this->load->library('form_validation');
 		$this->form_validation->set_rules('gejala_id_1','Gejala 1','required|number');
 		$this->form_validation->set_rules('gejala_id_2','Gejala 2','required|number');
 		
		 
		$this->form_validation->set_message('required', ' %s Harus diisi ');
		
 		$this->form_validation->set_error_delimiters('', '<br>');

 		if($this->form_validation->run() == TRUE ) { 
 			// unset($post['id']);

 			$this->db->where("id",$post['id']);
 			$res = $this->db->update("kemiripan",$post);


 			if($res){

 				 

 				$ret = array("error"=>false,"message"=>"Data kemiripan gejala berhasil diupdate");
 			}
 			else {
 				$ret = array("error"=>true,"message"=>"Data kemiripan gejala gagal disimpan".mysql_error());
 			}
 		}
 		else {
 			$ret = array("error"=>true,"message"=>validation_errors());
 		}

 		echo json_encode($ret);
	}




function hapus($id) {

	$this->db->where("id",$id);
	$res = $this->db->delete("kemiripan");
	if($res){

		$ret = array("error"=>false,"message"=>"Data kemiripan berhasil dihapus");
	}
	else {
		$ret = array("error"=>true,"message"=>"Data gagal dihapus".mysql_error());

	}
	echo json_encode($ret);
}

 
 
 


}

?>
