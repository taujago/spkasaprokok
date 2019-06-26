<body onload="window.print();">
<center>
	<h3>Sistem Pakar Diagnosa Penyakit yang disebabkan oleh Asap Rokok. <br />Menggunakan Metode CBR ( Case Based Reasoning ) </h3>
</center>
<hr />
<br />
<br />
<center>
	<h3>
		HASIL DIAGNOSA 
	</h3>
	<p align="right">
		Tanggal Konsultasi : 	 <?php echo flipdate($userdata['tanggal']) ?>
	</p>
</center>

<p>
	Berdasarkan hasil perhitungan diagnosa penyakit yang disebabkan oleh asap rokok menggunakan metode CBR (Case Based Reasoning), dengan uraian sebagai berikut : 
<br />
<b>Data Pasien : </b> <Br />

	<table>
		<tr><td width="20%"></td> <td> Kode Pasien </td> <td>: <?php echo "P".$userdata['id']; ?> </td></tr>
		<tr><td></td> <td> Nama Pasien </td> <td>: <?php echo $userdata['nama'] ?> </td></tr>
		<tr><td></td> <td> Jenis Kelamin </td> <td>: <?php echo $userdata['jk'] ?></td></tr>
		<tr><td></td> <td> Usia </td> <td>: <?php echo $userdata['umur'] ?></td></tr>
	</table>


	</p>
<p>
	Menganalisa dengan gejala - gejala yang diderita, sehingga mendapatkan hasil perhitungan dengan rincian sebagai berikut : 
	<table>
		<tr><td width="20%"></td> <td> Kode Penyakit </td> <td>: <?php echo $penyakit->kode; ?> </td></tr>
		<tr><td></td> <td> Nama Penyakit </td> <td>: <?php echo $penyakit->penyakit;  ?> </td></tr>
		<tr><td></td> <td> Nilai Perhitungan CBR </td> <td>: <?php echo $penyakit->skor; ?></td></tr>
 	</table>
<hr />
<?php 
// show_array($penyakit);
$image = (empty($penyakit->gambar))?"noimage.png":$penyakit->gambar;
?>
<img width="30%" src="<?php echo base_url("uploads/$image"); ?>" />

 	<br />
 	<br />
 	<table class="table table-striped">
	<thead>
		<tr>
			<th>No.</th>
			<TH>Penyakit</TH>
			<th>Pencegahan </th>
			<th>Pengobatan</th>
			<!-- <th>Bobot</th> -->
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
				<!-- <td><?php echo number_format($bobot,2); ?></td> -->
				
			</tr>
		<?php endforeach; ?>
	</tbody>
</table>
</p>
</body>