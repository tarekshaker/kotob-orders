<!-- Footer -->
<footer class="page-footer font-small blue">

	<!-- Copyright -->
	<div class="footer-copyright text-center py-3">© 2019 جميع الحقوق محفوظة Kotob Bookstore
	</div>
	<!-- Copyright -->

</footer>
<!-- Footer -->

</div>


<script type="text/javascript">
	$(document).ready(function () {


		<?php if ($this->uri->segment(1) == 'order'   && $this->uri->segment(3) != 'edit' && $this->uri->segment(3) != 'add' ) { ?>

		var oTable = $('.dataTable').dataTable();

		var allPages = oTable.fnGetNodes();

		$("td:contains('جاهز')",allPages).css('background-color','#8eff90');
		$("td:contains('غير جاهز')",allPages).css('background-color','#ff5156');

		$("td:contains('قيد التوصيل')",allPages).css('background-color','#fffe52');
		$("td:contains('تم التحصيل')",allPages).css('background-color','#4ca64c');

		$("td:contains('توصيل')",allPages).css('background-color','#fffe52');
		$("td:contains('مكتبة')",allPages).css('background-color','#a3c1ff');

		$("td:contains('مرتجع')",allPages).css('background-color','#D3D3D3');

		<?php } ?>




		//Min-Date today for order_suggessted_delivery_date"
		$("#order_suggessted_delivery_date").datepicker("option", "minDate", "d");

		//Collection day minimum today
		$("#collection_date").datepicker("option", "minDate", "d");



		//Order suggessted_delivery date minimum today
		$("#field-order_suggessted_delivery_date").datepicker("option", "minDate", "d");

		//Attendance date  minimum today
		$("#date").datepicker("option", "minDate", "d");

		//Order delivery date minimum today
		$("#field-order_delivery_date").datepicker("option", "minDate", "d");


		//Handling Schedule Editing
		<?php if (($this->uri->segment(1) == 'schedule') && ($this->uri->segment(4) == 'edit')) { ?>

		var is_holiday = $('input:radio[name="is_holiday"]:checked').val();

		if (is_holiday == 1) {
			$('#field-shift_start').val('');
			$('#field-shift_end').val('');
			$('#shift_start_field_box').hide();
			$('#shift_end_field_box').hide();
		}
		<?php } ?>

		$('input:radio[name="is_holiday"]').change(
			function () {
				if ($(this).is(':checked') && $(this).val() == 1) {

					$('#field-shift_start').val('');
					$('#field-shift_end').val('');
					$('#shift_start_field_box').hide();
					$('#shift_end_field_box').hide();
				} else {
					$('#shift_start_field_box').show();
					$('#shift_end_field_box').show();

				}
			});

		$('#field-order_type').change(
			function () {
				var d = new Date();
				var month = d.getMonth() + 1;
				var day = d.getDate();
				var output = '/' + (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();

				//2 is for Kotob
				if ($(this).val() == 2) {
					day = day + 1;
					$('#field-customer_address').val('');
					$('#field-customer_area').val('');
					$('#customer_address_field_box').hide();
					$('#customer_area_field_box').hide();
					$('#field-order_suggessted_delivery_date').val((('' + day).length < 2 ? '0' : '') + day + output);
				} else {
					day = day + 2;
					$('#customer_address_field_box').show();
					$('#customer_area_field_box').show();
					$('#field-order_suggessted_delivery_date').val((('' + day).length < 2 ? '0' : '') + day + output);
				}
			});


		//Handling Workflow
		<?php if (($this->uri->segment(1) == 'order') && ($this->uri->segment(3) == 'edit')) { ?>
		var order_status = $('#field-order_status').val();
		var order_type = $('#field-order_type').val();

		if (order_type == '2') {
			$('#customer_area_field_box').hide();
			$('#customer_address_field_box').hide();
		}
		//Case Not Ready
		if (order_status == '1') {
			$('#order_maker_field_box').hide();
			$('#order_taker_field_box').hide();
			$('#order_delivered_by_field_box').hide();
			$('#order_delivered_to_field_box').hide();
			$('#order_delivery_date_field_box').hide();
			$('#order_price_field_box').hide();
			$('#delivery_price_field_box').hide();
			$('#order_total_price_field_box').hide();
			$('#cash_collector_field_box').hide();
			$('#cash_collected_field_box').hide();
			$('#collection_date').val(null);
			$('#collection_date_field_box').hide();
			$('#cash_difference_field_box').hide();
			$('#returned_by_field_box').hide();
			$('#field-order_status option[value="1"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="2"]').prop('disabled', false).trigger("chosen:updated");
			$('#field-order_status option[value="3"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="4"]').prop('disabled', true).trigger("chosen:updated");

		}
		//Case Ready
		else if (order_status == '2') {
			$('#field-order_delivered_by').val('');
			$('#field-order_delivered_to').val('');
			$('#field-collection_date_field').val(null);
			$('#order_maker_field_box').hide();
			$('#order_delivered_by_field_box').hide();
			$('#order_delivered_to_field_box').hide();
			$('#order_delivery_date_field_box').hide();
			$('#order_taker_field_box').hide();
			$('#order_price_field_box').hide();
			$('#delivery_price_field_box').hide();
			$('#order_total_price_field_box').hide();
			$('#cash_collected_field_box').hide();
			$('#cash_collector_field_box').hide();
			$('#collection_date_field_box').hide();
			$('#returned_by_field_box').hide();
			$('#cash_difference_field_box').hide();
			$('#field-order_status option[value="1"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="2"]').prop('disabled', true).trigger("chosen:updated");

			if (order_type == '2') {
				// $('#customer_name_field_box').hide();
				$('#field-customer_name').prop('readonly', true).trigger("chosen:updated");
				$('#customer_phone_field_box').hide();
				$('#customer_mobile_field_box').hide();
				$('#customer_address_field_box').hide();
				$('#customer_area_field_box').hide();
				$('#order_type_field_box').hide();
				$('#order_details_field_box').hide();
				$('#field-order_status option[value="3"]').prop('disabled', true).trigger("chosen:updated");
				$('#field-order_status option[value="4"]').prop('disabled', false).trigger("chosen:updated");
			} else {
				$('#collection_date').val(null);
				$('#field-order_status option[value="3"]').prop('disabled', false).trigger("chosen:updated");
				$('#field-order_status option[value="4"]').prop('disabled', true).trigger("chosen:updated");
			}
		}
		//Case On Delivery
		else if (order_status == '3') {
			// $('#customer_name_field_box').hide();
			$('#collection_date').val(null);
			$('#field-customer_name').prop('readonly', true).trigger("chosen:updated");
			$('#customer_phone_field_box').hide();
			$('#customer_mobile_field_box').hide();
			$('#customer_address_field_box').hide();
			$('#customer_area_field_box').hide();
			$('#order_type_field_box').hide();
			$('#order_delivered_by_field_box').hide();
			$('#order_delivered_to_field_box').hide();
			$('#order_delivery_date_field_box').hide();
			$('#order_details_field_box').hide();
			$('#order_maker_field_box').hide();
			$('#order_taker_field_box').hide();
			$('#order_price_field_box').hide();
			$('#delivery_price_field_box').hide();
			$('#order_total_price_field_box').hide();
			$('#cash_collector_field_box').hide();
			$('#cash_collected_field_box').hide();
			$('#collection_date_field_box').hide();
			$('#cash_difference_field_box').hide();
			$('#returned_by_field_box').hide();
			$('#field-order_status option[value="1"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="2"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="3"]').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_status option[value="4"]').prop('disabled', false).trigger("chosen:updated");
		}
		//Case Collection
		else if (order_status == '4') {
			$('#field-order_status').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_price').prop('disabled', true).trigger("chosen:updated");
			$('#field-delivery_price').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_total_price').prop('disabled', true).trigger("chosen:updated");
			$('#field-cash_collected').prop('disabled', true).trigger("chosen:updated");
			$('#field-cash_collector').prop('disabled', true).trigger("chosen:updated");
			$('#collection_date').prop('disabled', true).trigger("chosen:updated");
			// $('#customer_name_field_box').hide();
			$('#field-cash_difference').prop('disabled', true).trigger("chosen:updated");
			$('#field-customer_name').prop('readonly', true).trigger("chosen:updated");
			$('#customer_phone_field_box').hide();
			$('#customer_mobile_field_box').hide();
			$('#customer_address_field_box').hide();
			$('#customer_area_field_box').hide();
			$('#order_type_field_box').hide();
			$('#order_delivered_by_field_box').hide();
			$('#order_delivered_to_field_box').hide();
			$('#order_delivery_date_field_box').hide();
			$('#order_details_field_box').hide();
			$('#order_maker_field_box').hide();
			$('#order_taker_field_box').hide();
			$('#returned_by_field_box').hide();


		}
		//Case Returned
		else if (order_status == '5') {
			$('#field-order_status').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_price').prop('disabled', true).trigger("chosen:updated");
			$('#field-delivery_price').prop('disabled', true).trigger("chosen:updated");
			$('#field-order_total_price').prop('disabled', true).trigger("chosen:updated");

			$('#field-customer_name').prop('readonly', true).trigger("chosen:updated");

			$('#field-returned_by').prop('disabled', true).trigger("chosen:updated");

			$('#customer_phone_field_box').hide();
			$('#customer_mobile_field_box').hide();
			$('#customer_address_field_box').hide();
			$('#customer_area_field_box').hide();
			$('#order_type_field_box').hide();
			$('#order_delivered_by_field_box').hide();
			$('#order_delivered_to_field_box').hide();
			$('#order_delivery_date_field_box').hide();
			$('#order_details_field_box').hide();
			$('#order_maker_field_box').hide();
			$('#order_taker_field_box').hide();
			$('#cash_collector_field_box').hide();
			$('#cash_collected_field_box').hide();
			$('#collection_date_field_box').hide();
			$('#cash_difference_field_box').hide();



		}
		<?php } ?>

		//Handling Change Order Status
		$('#field-order_status').change(
			function () {
				var order_status = $('#field-order_status').val();
				//Case Not Ready
				if (order_status == '1') {
					//Can't be chosen
				}
				//Case Ready
				else if (order_status == '2') {
					$('#order_maker_field_box').show();
				}
				//Case On Delivery
				else if (order_status == '3') {
					$('#order_delivered_by_field_box').show();
					$('#order_delivered_to_field_box').show();
					$('#order_delivery_date_field_box').show();
					$('#order_price_field_box').show();
					$('#delivery_price_field_box').show();
					$('#order_total_price_field_box').show();
					$('#field-order_total_price').prop('readonly', true).trigger("chosen:updated");
				}
				//Case Collection
				else if (order_status == '4') {
					$('#cash_collected_field_box').show();
					$('#cash_collector_field_box').show();
					$('#collection_date_field_box').show();

					$('#order_total_price_field_box').show();
					$('#field-order_total_price').prop('readonly', true).trigger("chosen:updated");
					$('#cash_difference_field_box').show();
					$('#field-cash_difference').prop('readonly', true).trigger("chosen:updated");

				}
				//Case Collection
				else if (order_status == '5') {

					// $('#customer_name_field_box').hide();
					$('#field-customer_name').prop('readonly', true).trigger("chosen:updated");
					$('#customer_phone_field_box').hide();
					$('#customer_mobile_field_box').hide();
					$('#customer_address_field_box').hide();
					$('#customer_area_field_box').hide();
					$('#order_type_field_box').hide();
					$('#order_delivered_by_field_box').hide();
					$('#order_delivered_to_field_box').hide();
					$('#order_delivery_date_field_box').hide();
					$('#order_details_field_box').hide();
					$('#order_maker_field_box').hide();
					$('#order_taker_field_box').hide();
					$('#order_price_field_box').hide();
					$('#delivery_price_field_box').hide();
					$('#order_total_price_field_box').hide();
					$('#cash_collector_field_box').hide();
					$('#cash_collected_field_box').hide();
					$('#collection_date_field_box').hide();
					$('#cash_difference_field_box').hide();
					$('#returned_by_field_box').show();

				}
			});


		$('#field-order_price,#field-delivery_price').on("change keyup paste",
			function () {
				var order_price = parseInt($('#field-order_price').val());
				var delivery_price = parseInt($('#field-delivery_price').val());

				if (isNaN(order_price)){
					order_price = 0;
				}

				if (isNaN(delivery_price)){
					delivery_price = 0;
				}

				if (!isNaN(order_price) && !isNaN(delivery_price)){
					$('#field-order_total_price').val(order_price + delivery_price);
				}

			});


		$('#field-cash_collected').on("change keyup paste",
			function () {
				var total_order_price = parseInt($('#field-order_total_price').val());
				var cash_collected = parseInt($('#field-cash_collected').val());

				if (isNaN(cash_collected)){
					cash_collected = 0;
				}

				if (isNaN(total_order_price)){
					total_order_price = cash_collected;
				}

				$('#field-cash_difference').val(cash_collected - total_order_price);


			});
	});


	$('.edit_button').attr("target", "_blank");

</script>

<script src="<?php echo base_url(); ?>assets/js/noty/jquery.noty.packaged.min.js"></script>

<script>
	function generate(type, text) {
		var n = noty({
			text: text,
			type: type,
			dismissQueue: true,
			layout: 'topCenter',
			theme: 'defaultTheme',
			maxVisible: 10
		});
	}

	$(function () {

		<?php $notifications = array('alert', 'information', 'error', 'warning', 'notification', 'success');
		foreach ($notifications as $note ) {
		if ( $this->session->flashdata('notification_' . $note)){

		?>
		generate('<?php echo $note;?>', "<?php echo $this->session->flashdata('notification_' . $note);?>");
		<?php }}?>


	});
</script>

</body>
</html>
