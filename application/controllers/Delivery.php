<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Delivery extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->library('form_validation');
		$this->load->model('Delivery_model');
		$this->load->helper('security');
	}

	public function index()
	{
		redirect('delivery/all_deliveries','refresh');
	}

	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_deliveries()
	{
		$crud = new grocery_CRUD();
		$crud->set_table('delivery');
		$crud->set_subject('مندوب توصيل');

		$crud->set_theme('datatables');

		$crud->display_as('delivery_name', 'الاسم');
		$crud->display_as('delivery_mobile', 'رقم الموبايل');
		$crud->display_as('delivery_mobile2', 'رقم الموبايل 2');

		$crud->display_as('delivery_total', 'اجمالي حساب التوصيل');
		$crud->display_as('orders_price', 'اجمالي حساب الأوردرات');
		$crud->display_as('orders_total_price', 'اجمالي الحساب');

		$crud->display_as('not_collected_delivery_total', 'المتبقي من حساب التوصيل');
		$crud->display_as('not_collected_orders_price', 'المتبقي من حساب الأوردرات');
		$crud->display_as('not_collected_orders_total_price', 'المتبقي من الحساب');

		$crud->display_as('collected_cash_difference', 'فرق التحصيل');

		$crud->columns('delivery_name','delivery_mobile','delivery_mobile2','delivery_total','orders_price','orders_total_price','not_collected_delivery_total','not_collected_orders_price','not_collected_orders_total_price','collected_cash_difference');
		$crud->set_rules('delivery_mobile', 'رقم الموبايل', 'required|xss_clean|numeric|min_length[11]|max_length[11]');

		$crud->callback_column('delivery_total',array($this,'_get_delivery_total'));
		$crud->callback_column('orders_price',array($this,'_get_orders_price'));
		$crud->callback_column('orders_total_price',array($this,'_get_orders_total_price'));

		$crud->callback_column('not_collected_delivery_total',array($this,'_get_not_collected_delivery'));
		$crud->callback_column('not_collected_orders_price',array($this,'_get_not_collected_orders_price'));
		$crud->callback_column('not_collected_orders_total_price',array($this,'_get_not_collected_orders_total_price'));

		$crud->callback_column('collected_cash_difference',array($this,'_get_collected_cash_difference'));

		if( $crud->getState() == 'add' || $crud->getState() == 'edit') {
			$crud->set_css('assets/grocery_crud/css/ui/simple/'.grocery_CRUD::JQUERY_UI_CSS);
			$crud->set_js('assets/grocery_crud/js/jquery_plugins/config/jquery.datepicker.config.js');
		}


		$crud->add_action('الاوردرات', '', 'delivery/index','ui-icon-clock',array($this,'delivery_orders'));

		$crud->unset_delete();
		$crud->unset_edit();
		
		$data['page_title'] = "التوصيل";
		$data['crud_output'] = $crud->render();

		$this->admin_view_ar('crud_output.php', $data);

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


	public function delivery_orders($primary_key )
	{
		return base_url().'order/delivery_orders/'.$primary_key;
	}



	function _get_delivery_total($value, $row){

		$return = $this->Delivery_model->get_delivery_total($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}

	function _get_orders_price($value, $row){

		$return = $this->Delivery_model->get_orders_total($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}
	function _get_orders_total_price($value, $row){

		$return = $this->Delivery_model->get_orders_total_price($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}


	function _get_not_collected_delivery($value, $row){

		$return = $this->Delivery_model->get_not_collected_delivery($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}

	function _get_not_collected_orders_price($value, $row){

		$return = $this->Delivery_model->get_not_collected_orders_total($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}
	function _get_not_collected_orders_total_price($value, $row){

		$return = $this->Delivery_model->get_not_collected_orders_total_price($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}

	function _get_collected_cash_difference($value, $row){

		$return = $this->Delivery_model->get_collected_cash_difference($row->id);

		if ($return == ''){
			$return = 0;
		}

		return $return;
	}




}
