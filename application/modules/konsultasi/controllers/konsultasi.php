<?php
class konsultasi extends master_controller {
	function __construct(){
		parent::__construct();
		$this->load->model("coremodel","cm");
		 
		$this->controller = get_class($this);

    $this->method = null; 

	}

	function index(){
		// echo "fuckkk.."; exit;
		$data_array = array();

		$this->db->order_by("kode");

		$data_array['record'] = $this->db->get("gejala");



		 
		 
		$content = $this->load->view($this->controller."_view_form",$data_array,true);

		$this->set_title("MASUKKAN GEJALA YANG ANDA RASAKAN PADA KOLOM DIBAWAH INI:");
		$this->set_content($content);
		$this->render();
	}



function index2(){
$post = $this->input->post();
// show_array($post); exit;

$arr = array("tanggal"=>date("Y-m-d"),
			 "user_id"=>$_SESSION['userdata'][0]['id'] 

			 );

$this->db->insert("pemeriksaan",$arr);
$pemeriksaan_id = $this->db->insert_id();

foreach($post['gejala_id'] as $gejala_id): 
	$tmp['pemeriksaan_id'] = $pemeriksaan_id;
	$tmp['gejala_id'] = $gejala_id;
	$this->db->insert("pemeriksaan_detail",$tmp);
endforeach;

redirect("$this->controller/review/$pemeriksaan_id");



}

function review($id){
// $post = $this->input->post();
// show_array($post);
/// get gejala dan buat dalam bentuk array dengan format contoh sbb : 
// Array
// (
//     [gejala_id] => Array
//         (
//             [0] => 139
//             [1] => 122
//             [2] => 143
//             [3] => 125
//         )

// )	
$this->db->where("pemeriksaan_id",$id);
$rs = $this->db->get("pemeriksaan_detail");
foreach($rs->result() as $r): 
	$post['gejala_id'][] = $r->gejala_id;

endforeach;


$data_array['post'] = $post;


// buat referensi array gejala 
$res = $this->db->get("gejala");
$ref_gejala = array();
foreach($res->result() as $rg): 
	$ref_gejala[$rg->id] = $rg->bobot;
  
  $data_gejala[$rg->id] = array("kode"=>$rg->kode,"bobot"=>$rg->bobot);
endforeach;

 
$data_array['data_gejala'] = $data_gejala;
 
	 // redirect("konsultasi/detail/$id_pemeriksaan");

// ambil data referensi pasien lama 
  $this->db->select("r.*, p.penyakit, p.pengobatan, p.keterangan")
  ->from('referensi r')
  ->join('referensi_detail rd','rd.referensi_id = r.id')
  ->join('penyakit p','p.id = r.penyakit_id')
  ->group_by("r.id");
  $res = $this->db->get();

  if($res->num_rows() == 0 ) {
    echo "data referensi penyakit lama belum ada. silahkan diinputkan " ; exit;
  }

  $arr_ref = array();

  $arr_hasil = array();
  foreach($res->result() as $row): 
  		$arr_ref[$row->id] = array(
  			"nama" => $row->nama,
  			"umur" => $row->umur,
  			"jk"   => $row->jk,
  			"penyakit_id" => $row->penyakit_id,
  			"penyakit" => $row->penyakit,
        "pengobatan" => $row->pengobatan,
        "pencegahan" => $row->keterangan
  		);

  		$this->db->where("referensi_id",$row->id);
  		$rs_ref = $this->db->get("referensi_detail");
  		foreach($rs_ref->result() as $rf ) : 
  			$arr_ref[$row->id]['gejala'][] = $rf->gejala_id ;
  		endforeach;
  		$total_bobot = 0;
  		$tmp =0;
  		foreach($ref_gejala as $gejala_id => $bobot): 


       

  			 $x = (in_array($gejala_id,$arr_ref[$row->id]['gejala']))?1:0;
  			 $y = (in_array($gejala_id,$post['gejala_id']))?1:0; 
         $arr_ref[$row->id]['kemiripan'][$gejala_id] = !($x xor $y);
        // }

  			 
        
  			 
  			 $tmp += $arr_ref[$row->id]['kemiripan'][$gejala_id] * $bobot;

        $arr_ref[$row->id]['jumlah'][$gejala_id] =  $arr_ref[$row->id]['kemiripan'][$gejala_id] * $bobot;
  			 $total_bobot += $bobot;
  		endforeach;
  		$arr_ref[$row->id]['score'] = $tmp / $total_bobot;

  		$arr_hasil[$row->id] = $arr_ref[$row->id]['score']; 
      // break;
  endforeach;

arsort($arr_hasil);

 
$data_array['ref_gejala'] = $ref_gejala;

$data_array['arr_ref'] = $arr_ref;
$data_array['arr_hasil'] = $arr_hasil;

// show_array($ref_gejala);
// show_array($post);
// show_array($arr_ref);    exit;

// show_array($arr_hasil);  exit;

// get data pasien 
$this->db->select("u.*, p.tanggal")
->from("pengguna u")
->join("pemeriksaan p","u.id = p.user_id")
->where("p.id",$id);

$data_array['userdata'] = $this->db->get()->row_array();


// get data gejala yang dialami 
$this->db->select("g.*")
->from("gejala g")
->join("pemeriksaan_detail pd","pd.gejala_id = g.id")
->where("pemeriksaan_id",$id);


$this->db->_protect_identifiers = FALSE;
$this->db->order_by("cast(substring(kode,3,3) as SIGNED )",true);



$data_array['rec_gejala_hasil'] = $this->db->get();
// echo $this->db->last_query();exit;
// ambil data penyakit hasil 
$id_referensi = "";
$skor = "";

$this->db->query("delete from tmp");
foreach($arr_hasil as $xy => $hasil): 
	// $id_referensi = $xy; 
 //  $skor = $hasil;
	// break;
  $this->db->insert("tmp",array("id_penyakit"=>$xy,"skor"=>$hasil));

endforeach;

$sql = "select * from tmp where skor = (select max(skor) from tmp)
";

$res = $this->db->query($sql); 

$data = $res->row();

$id_referensi = $data->id_penyakit;

// echo "id referensi ". $id_referensi; exit;


// echo "id penyakit ". $id_penyakit; exit;


// echo "id penyakit $id_penyakit"; exit;
$this->db->where("id",$arr_ref[$id_referensi]['penyakit_id']);
$data_array['penyakit'] = $this->db->get("penyakit")->row();

// show_array($data_array['penyakit']); exit;
 
$data_array['penyakit']->skor = $skor;

// terakhir update id penyakit ke data  pemeriksaan 
$this->db->where("id",$id);
$this->db->update("pemeriksaan",array("penyakit_id"=>$arr_ref[$id_referensi]['penyakit_id']));


$_SESSION['data_array'] = $data_array;




$content = $this->load->view($this->controller."_view_result",$data_array,true);

$this->set_title("HASIL DIAGNOSA");
$this->set_content($content);
$this->render();


}

function cetak(){
  $data_array = $_SESSION['data_array'];
//   show_array($data_array);exit;

  // unset($data_array['rec_gejala_hasil']);   show_array($data_array);
  $this->load->view("konsultasi_view_print",$data_array);
}

// function list(){
// 	echo "flow";
// }
function listview(){

$this->method="listview";


$data_array = array();

$this->db->select('p.*,u.nama,u.umur,u.jk,u.alamat')
->from('pemeriksaan p')
->join('pengguna u','p.user_id = u.id');
$this->db->order_by("tanggal","desc");

if($_SESSION['userdata'][0]['level'] == 0 ) {
	$this->db->where("p.user_id",$_SESSION['userdata'][0]['id']);
}

$data_array['rec_pemeriksaan'] = $this->db->get();



$content = $this->load->view($this->controller."_list_view",$data_array,true);

$this->set_title("DATA KONSULTASI PEMERIKSAAN");
$this->set_content($content);
$this->render();

}
 

function laporan(){

  $this->method = "laporan";

$data_array = array();

$content = $this->load->view($this->controller."_laporan_view",$data_array,true);

$this->set_title("LAPORAN JENIS PENYAKIT");
$this->set_content($content);
$this->render();


}

function get_laporan(){
  $post = $this->input->post();
  extract($post);
$sql = " 
SELECT p.*, 
       count(pm.id) as jumlah , 
      sum( if(u.jk='L',1,0)) as L,
      sum( if(u.jk='P',1,0)) as P     
  
    FROM penyakit p 
 join pemeriksaan pm on p.id = pm.penyakit_id
 join pengguna u on u.id = pm.user_id 
 where year(tanggal) = '$tahun'
 and month(tanggal) = '$bulan'
  group by p.id 
   
";

$data_array['record'] = $this->db->query($sql);
$this->load->view($this->controller."_laporan_table_view",$data_array);


}



}

?>
