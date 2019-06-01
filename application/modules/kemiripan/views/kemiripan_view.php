<div class="row mb-3">
	<div class="col-md-3">
		<a href="#!" onclick="tambahbaru();" class="btn btn-success" ><i class="fa fa-plus"></i> TAMBAH BARU </a>
	</div>

</div>



<div class="table-responsive">
	<table id="tabel" class="table card-table table-vcenter text-nowrap">
		<thead >
			<tr>
				<th width="5%">NO </th>
				 
				<th width="50%">GEJALA 1  </th>
				<th width="50%">GEJALA 2</th>
				<th width="50%">BOBOT</th>
				<th width="10%">PROSES</th>
				 
			</tr>
		</thead>
		<tbody>
<?php 
$n=0;
foreach($record->result() as $row) : 
	$n++;
?>
			<tr>
				<th scope="row"><?php echo $n ?></th>
				<td><?php echo $row->gejala1; ?></td>
				<td><?php echo $row->gejala2; ?></td>
				<td><?php echo $row->bobot; ?></td>
				 
				<td>
					<a href="#!"  onclick="edit('<?php echo $row->id; ?>','<?php echo $row->gejala_id_1; ?>','<?php echo $row->gejala_id_2; ?>','<?php echo $row->bobot; ?>');"  class="btn btn-warning text-light"><i class="fa fa-pencil"></i> Edit</a>
					<a href="#!" onclick="hapus('<?php echo $row->id; ?>');"  class="btn btn-danger text-light"><i class="fa fa-trash"></i> Hapus</a>
</td>
			</tr>
<?php endforeach; ?> 
		</tbody>
	</table>
</div>
<!-- table-responsive -->


<div class="modal fade" id="formModal" tabindex="-1" role="dialog"  aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="judul">Tambah Data Kemiripan </h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frmkriteria">
					<div class="form-group">
						<label for="gejala_id_1" class="form-control-label">Gejala 1 :</label>
						<?php 
						$arr = $this->cm->arr_dropdown_gejala();
						echo form_dropdown("gejala_id_1",$arr,'','class="form-control" id="gejala_id_1"  ');
						?>
					</div>
					<div class="form-group">
						<label for="gejala_id_2" class="form-control-label">Gejala 2:</label>
						<?php 
						$arr = $this->cm->arr_dropdown_gejala();
						echo form_dropdown("gejala_id_2",$arr,'','  id="gejala_id_2"  class="form-control" ');
						?>

					</div>

					<div class="form-group">
						<label for="bobot" class="form-control-label">Bobot :</label>
						<input type="number" name="bobot" id="bobot" min="0" step="0.1" class="form-control" />

					</div>

					 

					 

<input type="hidden" name="id" id="id">

				</form>
			</div>
			<div class="modal-footer">
				
				<button id="btnsimpan" type="button" class="btn btn-primary"><i class="fa fa fa-paper-plane"></i> SIMPAN</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<?php 
$this->load->view($this->controller."_view_js");
?>