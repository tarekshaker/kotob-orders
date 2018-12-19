<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Order extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->library('form_validation');
		$this->load->model('Order_model');
		$this->load->helper('security');
	}

	public function index()
	{
		redirect('order/all_orders','refresh');
	}

	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_orders()
	{
		$crud = new grocery_CRUD();
		$crud->set_table('orders');
		$crud->order_by('order_date','desc');
		$crud->set_subject('أوردر');

		$crud->set_theme('datatables');

		$crud->display_as('id', 'رقم الاوردر');
		$crud->display_as('customer_name', 'اسم العميل');
		$crud->display_as('customer_phone', 'رقم الأرضي');
		$crud->display_as('customer_mobile', 'رقم الموبايل');
		$crud->display_as('customer_address', 'عنوان العميل');
		$crud->display_as('order_type', 'نوع الاوردر');
		$crud->display_as('customer_area', 'المنطقة');
		$crud->display_as('order_details', 'الأوردر بالتفصيل');
		$crud->display_as('order_status', 'حالة الأوردر');
		$crud->display_as('order_taker', 'مستقبل الأوردر');
		$crud->display_as('order_maker', 'منفذ الأوردر');
		$crud->display_as('order_date', 'تاريخ الأوردر');
		$crud->display_as('order_delivered_by', 'مسلم الأوردر');
		$crud->display_as('order_delivered_to', 'التوصيل بواسطة');
		$crud->display_as('order_suggessted_delivery_date', 'ميعاد التسليم للعميل');
		$crud->display_as('order_delivery_date', 'تاريخ التسليم للتوصيل');
		$crud->display_as('order_price', 'سعر الأوردر');
		$crud->display_as('delivery_price', 'سعر التوصيل');
		$crud->display_as('order_total_price', 'اجمالي سعر الأوردر');
		$crud->display_as('cash_collected', 'المبلغ المحصل');
		$crud->display_as('cash_collector', 'المحصل');
		$crud->display_as('collection_date', 'تاريخ التحصيل');

		$crud->display_as('returned_by', 'مرتجع بواسطة');

		$address_required_if = '';
		if ($this->input->post('order_type') == 1){
			$address_required_if = '|required';
		}

		$order_maker_required_if = '';
		if ($this->input->post('order_status') == 2){
			$order_maker_required_if = '|required';
		}

		$order_delivery_required_if = '';

		if ($this->input->post('order_status') == 3){
			$order_delivery_required_if = '|required';

		}

		$collection_required_if = '';
		$cash_collected_if ='';
		if ($this->input->post('order_status') == 4){
			$collection_required_if = '|required';
			$cash_collected_if = '|greater_than[0]|numeric';
		}

		$returned_order_required_if = '';
		if ($this->input->post('order_status') == 5){
			$returned_order_required_if = '|required';
		}



		$crud->set_rules('customer_name', 'اسم العميل', 'required|xss_clean|callback_regex');
		$crud->set_rules('customer_phone', 'رقم الأرضي', 'xss_clean|numeric|min_length[8]|max_length[8]');
		$crud->set_rules('customer_mobile', 'رقم الموبايل', 'required|xss_clean|numeric|min_length[11]|max_length[11]');
		$crud->set_rules('order_taker', 'مستقبل الأوردر', 'required|xss_clean');
		$crud->set_rules('order_type', 'نوع الأوردر',  'required|xss_clean');
		$crud->set_rules('customer_address', 'عنوان العميل',  'trim' . $address_required_if);
		$crud->set_rules('customer_area', 'المنطقة',  'trim' . $address_required_if);
		$crud->set_rules('order_details', 'الأوردر بالتفصيل', 'required|xss_clean');
		$crud->set_rules('order_suggessted_delivery_date', 'ميعاد التسليم للعميل', 'required|xss_clean');
		$crud->set_rules('order_maker', 'منفذ الأوردر', 'trim' . $order_maker_required_if);
		$crud->set_rules('order_delivered_by', 'مسلم الأوردر', 'trim' . $order_delivery_required_if);
		$crud->set_rules('order_delivered_to', 'التوصيل', 'trim' . $order_delivery_required_if);
		$crud->set_rules('order_delivery_date', 'تاريخ التسليم للتوصيل', 'trim' . $order_delivery_required_if);
		$crud->set_rules('order_price', 'سعر الأوردر', 'trim' . $order_delivery_required_if);
		$crud->set_rules('delivery_price', 'سعر التوصيل', 'trim' . $order_delivery_required_if);
		$crud->set_rules('order_total_price', 'اجمالي سعر الأوردر', 'trim' . $order_delivery_required_if);
		$crud->set_rules('cash_collector', 'المحصل', 'trim' . $collection_required_if);
		$crud->set_rules('cash_collected', 'المبلغ المحصل', 'trim' . $collection_required_if.$cash_collected_if);
		$crud->set_rules('collection_date', 'تاريخ التحصيل', 'trim' . $collection_required_if);

		$crud->set_rules('returned_by', 'مرتجع بواسطة', 'trim' . $returned_order_required_if);

		$crud->display_as('cash_difference', 'فرق التحصيل');

		$crud->set_relation('order_delivered_to', 'delivery', 'delivery_name');
		$crud->set_relation('order_status', 'order_status', 'order_status_name');
		$crud->set_relation('order_type', 'order_types', 'order_type_name');
		$crud->set_relation('customer_area', 'areas', 'area_ar_name');
		$crud->set_relation('order_taker', 'employees', 'employee_name');
		$crud->set_relation('order_maker', 'employees', 'employee_name');
		$crud->set_relation('order_delivered_by', 'employees', 'employee_name');
		$crud->set_relation('cash_collector', 'employees', 'employee_name');

		$crud->set_relation('returned_by', 'employees', 'employee_name');


		if( $crud->getState() == 'add' || $crud->getState() == 'edit') {
			$crud->set_css('assets/grocery_crud/css/ui/simple/'.grocery_CRUD::JQUERY_UI_CSS);
			$crud->set_js('assets/grocery_crud/js/jquery_plugins/config/jquery.datepicker.config.js');
		}

		$crud->columns(array('id','customer_name','customer_mobile','customer_area','order_date','order_suggessted_delivery_date','order_type','order_delivered_to','order_delivery_date','order_total_price','collection_date','order_status','cash_collected'));

		$crud->add_fields('customer_name','customer_phone','customer_mobile','order_type','customer_address','customer_area','order_details','order_taker','order_suggessted_delivery_date');
		$crud->edit_fields('customer_name','customer_phone','customer_mobile','order_type','customer_address','customer_area','order_details','order_taker','order_status','order_maker','order_delivered_by','order_delivered_to','order_delivery_date','order_price','delivery_price','order_total_price','cash_collector','cash_collected','cash_difference','collection_date','returned_by');

		$crud->callback_edit_field('collection_date',array($this,'_get_collection_date'));

		$crud->callback_before_update(array($this,'_check_returned_status'));


		$crud->field_type('order_details', 'text');
		$crud->unset_delete();

		$data['page_title'] = "كل الأوردرات";
		$data['crud_output'] = $crud->render();

		
		
		$this->admin_view_ar('crud_output.php', $data);

	}

	public function delivery_orders($id)
	{
		$crud = new grocery_CRUD();

		$crud->where('order_delivered_to',$id);
		$crud->set_table('orders');
		$crud->order_by('order_date','desc');
		$crud->set_subject('أوردر');
		$crud->set_theme('datatables');

		$crud->display_as('id', 'رقم الأوردر');
		$crud->display_as('customer_name', 'اسم العميل');
		$crud->display_as('customer_phone', 'رقم الأرضي');
		$crud->display_as('customer_mobile', 'رقم الموبايل');
		$crud->display_as('customer_address', 'عنوان العميل');
		$crud->display_as('customer_area', 'المنطقة');
		$crud->display_as('order_type', 'نوع الاوردر');
		$crud->display_as('order_details', 'الأوردر بالتفصيل');
		$crud->display_as('order_status', 'حالة الأوردر');
		$crud->display_as('order_taker', 'مستقبل الأوردر');
		$crud->display_as('order_maker', 'منفذ الأوردر');
		$crud->display_as('order_date', 'تاريخ الأوردر');
		$crud->display_as('order_delivered_by', 'مسلم الأوردر');
		$crud->display_as('order_delivered_to', 'مستلم الأوردر');
		$crud->display_as('order_suggessted_delivery_date', 'ميعاد التسليم للعميل');
		$crud->display_as('order_delivery_date', 'تاريخ التسليم');
		$crud->display_as('order_price', 'سعر الأوردر');
		$crud->display_as('delivery_price', 'سعر التوصيل');
		$crud->display_as('order_total_price', 'اجمالي سعر الأوردر');
		$crud->display_as('cash_collector', 'المحصل');
		$crud->display_as('cash_collected', 'المبلغ المحصل');
		$crud->display_as('collection_date', 'تاريخ التحصيل');

		$crud->display_as('cash_difference', 'فرق التحصيل');
		
		$crud->display_as('returned_by', 'مرتجع بواسطة');


		$crud->set_relation('order_status', 'order_status', 'order_status_name');
		$crud->set_relation('customer_area', 'areas', 'area_ar_name');
		$crud->set_relation('order_delivered_to', 'delivery', 'delivery_name');
		$crud->set_relation('order_taker', 'employees', 'employee_name');
		$crud->set_relation('order_maker', 'employees', 'employee_name');
		$crud->set_relation('order_delivered_by', 'employees', 'employee_name');
		$crud->set_relation('cash_collector', 'employees', 'employee_name');
		
		

		$crud->add_action('تعديل', '', 'order/index','ui-icon-clock',array($this,'delivery_orders_edit'));

//		if( $crud->getState() == 'list') {
			$crud->unset_add();
			$crud->unset_edit();
			$crud->unset_delete();
//		}

		$crud->columns(array('id','customer_name','customer_mobile','customer_address','customer_area','order_delivered_by','order_delivery_date','order_status','order_price','delivery_price','order_total_price','cash_collected','cash_difference'));


		$crud->field_type('order_details', 'text');

		$data['page_title'] = "أوردرات";
		$data['crud_output'] = $crud->render();




		$this->admin_view_ar('crud_output.php', $data);

	}

	public function kotob_orders()
	{
		$crud = new grocery_CRUD();

		$crud->where('order_type',2);
		$crud->set_table('orders');
		$crud->order_by('order_date','desc');
		$crud->set_subject('أوردر');
		$crud->set_theme('datatables');

		$crud->display_as('id', 'رقم الأوردر');
		$crud->display_as('customer_name', 'اسم العميل');
		$crud->display_as('customer_phone', 'رقم الأرضي');
		$crud->display_as('customer_mobile', 'رقم الموبايل');
		$crud->display_as('customer_address', 'عنوان العميل');
		$crud->display_as('customer_area', 'المنطقة');
		$crud->display_as('order_details', 'الأوردر بالتفصيل');
		$crud->display_as('order_status', 'حالة الأوردر');
		$crud->display_as('order_taker', 'مستقبل الأوردر');
		$crud->display_as('order_maker', 'منفذ الأوردر');
		$crud->display_as('order_date', 'تاريخ الأوردر');
		$crud->display_as('order_delivered_by', 'مسلم الأوردر');
		$crud->display_as('order_delivered_to', 'مستلم الأوردر');
		$crud->display_as('order_suggessted_delivery_date', 'ميعاد التسليم للعميل');
		$crud->display_as('order_price', 'سعر الأوردر');
		$crud->display_as('order_total_price', 'اجمالي سعر الأوردر');
		$crud->display_as('cash_collector', 'المحصل');
		$crud->display_as('collection_date', 'تاريخ التحصيل');
		$crud->display_as('cash_collected', 'المبلغ المحصل');

		$crud->display_as('cash_difference', 'فرق التحصيل');

		$crud->set_relation('order_status', 'order_status', 'order_status_name');
		$crud->set_relation('customer_area', 'areas', 'area_ar_name');
		$crud->set_relation('order_delivered_to', 'delivery', 'delivery_name');
		$crud->set_relation('order_taker', 'employees', 'employee_name');
		$crud->set_relation('order_maker', 'employees', 'employee_name');
		$crud->set_relation('order_delivered_by', 'employees', 'employee_name');
		$crud->set_relation('cash_collector', 'employees', 'employee_name');


//		if( $crud->getState() == 'list') {
		$crud->unset_add();
		$crud->unset_edit();
		$crud->unset_delete();
//		}

		$crud->add_action('تعديل', '', 'order/index','ui-icon-clock',array($this,'delivery_orders_edit'));

		$crud->columns(array('id','customer_name','customer_mobile','order_date','order_suggessted_delivery_date','order_status','order_total_price','collection_date','cash_collected','cash_difference'));


		$crud->field_type('order_details', 'text');

		$data['page_title'] = "أوردرات المكتبة";
		$data['crud_output'] = $crud->render();


		$this->admin_view_ar('crud_output.php', $data);

	}

	public function delivery_orders_edit($primary_key )
	{
		return base_url().'order/all_orders/edit/'.$primary_key;
	}

	function _add_suggessted_delivery_date(){
		$value = !empty($value) ? $value : date('d/m/Y', strtotime(' + 2 days'));
		$return = '<input type="text" name="order_suggessted_delivery_date" id="order_suggessted_delivery_date" value="'.$value.'" class="datepicker-input" /> ';
		$return .= '<a class="time-input-clear ui-button ui-corner-all ui-widget" tabindex="-1" role="button">مسح</a> (سنة/شهر/يوم)';
		return $return;
	}

	function _get_collection_date(){
		$value = !empty($value) ? $value : date('d/m/Y H:i:s' );
		$return = '<input type="text" name="collection_date" id="collection_date" value="'.$value.'" class="datepicker-input"/> ';
		$return .= '<a class="time-input-clear ui-button ui-corner-all ui-widget" tabindex="-1" role="button">مسح</a> (سنة/شهر/يوم)';
		return $return;
	}


	public function regex($name,$lang)
	{
		if (preg_match('/^([a-zA-Z_ ]|[\p{Arabic}_ ])*$/u', $name)) {
			return true;
		} else {
			$this->form_validation->set_message('regex', 'الاسم يجب ان يتكون من حروف عربية او انجليزية فقط');

			return false;
		}
	}




}
