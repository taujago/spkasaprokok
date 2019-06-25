<form id="frmcari">
<div class="row">

<div class="col-md-3">
	<div class="form-group">
		<label>Bulan </label>
		<?php
			$ar = array(1=>"JANUARI","FEBRUARI","MARET","APRIL","MEI",
						"JUNI","JULI","AGUSTUS","SEPTEMBER","NOVEMBER","DESEMBER");
			echo form_dropdown("bulan",$ar,date("m"),'id="bulan" class="form-control"');

		 ?>
	</div>
</div>

<div class="col-md-3">
	<div class="form-group">
		<label>Tahun </label>
		 <input value="<?php echo date('Y'); ?>" type="text" name="tahun" id="tahun" class="form-control" />
	</div>
</div>

<div class="col-md-3">
	<div class="form-group">
		<label>&nbsp; </label>
		 <button id="btntampil" type="button" class="btn btn-block btn-primary"><i class="fa fa-list"></i> TAMPILKAN</button>
	</div>
</div>
	
</div>
</form>


<div class="row">
	<div class="col-md-12" id="hasil">
		
	</div>
</div>

<script type="text/javascript">
	
$(document).ready(function(){
	$("#btntampil").click(function(e){
		e.preventDefault();
		$.ajax({
			url : '<?php echo site_url("$this->controller/get_laporan") ?>',
			data : $("#frmcari").serialize(),
			type : 'post',
			success : function(htmldata) {
				$("#hasil").html(htmldata);
			}
		});
	});
});

</script>


