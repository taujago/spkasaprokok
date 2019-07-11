
<style type="text/css">
	.merah {
		
		background-color: blue;
	}
	.kuning {
		background-color: green;
	}
</style>

<div class="card">
<div class="card-header">
	<h3 class="card-title">HASIL DIAGNOSA </h3>
</div>
<div class="card-body">



<table class="table">
	<tr><td width="20%">Tanggal Konsultasi </td>
		<td> : <?php echo flipdate($userdata['tanggal']); ?> </td>
	</tr>
	<tr>
		<td>Gejala yang dialami
		</td>
		<td>
			<ol>
			<?php 
			foreach($rec_gejala_hasil->result() as $row ) : 
			?>

			<li>
				<?php echo $row->kode." ".$row->gejala;  ?>
			</li>
			
		<?php endforeach; ?>
		</ol>
		</td>
	</tr>
</table>








<table class="table table-striped">
	<thead>
		<tr>
			<th>No.</th>
			<TH>Penyakit</TH>
			<th>Pencegahan </th>
			<th>Pengobatan</th>
			<th>Nilai CBR</th>
		</tr>
	</thead>
	<tbody>
		<?php $n=0; 
		foreach($arr_hasil as $id => $bobot ) : 
		$n++; 
		if($n==2) break;
		?>
			<tr>
				<td><?php echo $n; ?> </td>
				<td><?php echo $arr_ref[$id]['penyakit']; ?></td>
				<!-- <td><?php echo $arr_ref[$id]['nama']; ?></td> -->
				
				<td><?php echo $arr_ref[$id]['pencegahan']; ?></td>
				<td><?php echo $arr_ref[$id]['pengobatan']; ?></td>
				<td><?php echo number_format($bobot,2); ?></td>
				
			</tr>
		<?php endforeach; ?>
	</tbody>
</table>


 


<h3>RINCIAN PERHITUNGAN</h3>
<div class="table-responsive">
<br /> <br />
	<table id="tabel" class="table table-bordered card-table table-vcenter text-nowrap">

<thead >
		
		<tr>
			<th rowspan="3" >NO. </th>
			<th rowspan="3" > ALTERNATIF </th>
			<th colspan="<?php echo count($data_gejala); ?>" > GEJALA DAN BOBOT </th>
			<th rowspan="3" > SKOR DAN BOBOT </th>
		</tr>
		<tr>
			<?php 
				foreach($data_gejala as $idg => $dg) : 

				$class = in_array($idg, $post['gejala_id'])?"merah":"";

			?>
				<th class="<?php echo $class; ?>"><?php echo $dg['kode'] ?></th>
			<?php endforeach; ?>
		</tr>

		<tr>
			<?php 
			$total_bobot = 0; 
				foreach($data_gejala as $dg) : 
				$total_bobot += $dg['bobot']; 
			?>
				<th><?php echo $dg['bobot'] ?></th>
			<?php endforeach; ?>
		</tr>
		 
</thead>
<TBODY>
	<?php 
	$n=0;
	foreach($arr_ref as $id => $row):
		$n++;
	?>
	<tr>
		<td>
			<?php echo $n; ?>
		</td>
		<td>
			<?php echo $row['nama']; ?>
		</td>
		<?php 
		// $total_bobot = 0;
		$total_jumlah = 0; 
		foreach($row['kemiripan'] as $id_gejala => $bobot ) :  
			// $total_bobot += empty($bobot)?"0":$bobot;
			$total_jumlah += $arr_ref[$id]['jumlah'][$id_gejala];

			$class = (in_array($id_gejala,$arr_ref[$id]['gejala']))?"kuning":"";


			?>
			<td class="<?php echo $class;  ?>"><?php //echo empty($bobot)?"0":$bobot; ?> 
				<?php echo  $arr_ref[$id]['jumlah'][$id_gejala]; ?>
			 </td>
		<?php endforeach; ?>
		<TD>
			<?php echo $total_jumlah."/".$total_bobot."=". ($total_jumlah/$total_bobot); ?>
		</TD>
	</tr>
	<?php endforeach; ?>
	
</TBODY>

<tbody>
 

		</tbody>
	</table>

</div>


<div class="row">
	
	<div class="col-md-3">
		
		<a target="blank" href="<?php echo site_url("konsultasi/cetak"); ?>" class="btn btn-primary"><i class="fa fa-print"></i>  CETAK </a>

	</div>

</div>
 