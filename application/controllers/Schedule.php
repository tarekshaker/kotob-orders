<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Schedule extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->library('form_validation');
		$this->load->helper('security');
		$this->load->model('Schedule_model');
	}



	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_schedule($primary_key)
	{
		$crud = new grocery_CRUD();
		$crud->set_table('schedule');
		$crud->where('employee_id',$primary_key);

		$crud->set_subject('جدول مواعيد الموظفين');

		$crud->set_theme('datatables');

		$crud->display_as('day_id', 'اليوم');
		$crud->display_as('shift_start', 'الحضور');
		$crud->display_as('shift_end', 'الانصراف');
		$crud->display_as('is_holiday', 'اجازة');
		$crud->display_as('employee_id', 'اسم الموظف');


		$crud->set_relation('day_id','days','day_ar_name');

		$crud->callback_column('shift_start', array($this, 'format_time'));
		$crud->callback_column('shift_end', array($this, 'format_time'));


		$currentState = $crud->getState();
		if($currentState == 'add' || $currentState == 'insert_validation') {
			$crud->set_rules('day_id', 'اليوم', 'required|xss_clean|callback_check_day');
		}


		if($currentState == 'edit' || $currentState == 'update_validation') {
			$crud->change_field_type('day_id','readonly');
		}

		if($currentState == 'list') {
			$crud->set_relation('employee_id','employees','employee_name');
		}

		if( $currentState == 'add' || $currentState == 'edit' || $currentState == 'list') {
			$crud->set_css('assets/grocery_crud/css/ui/simple/'.grocery_CRUD::JQUERY_UI_CSS);
			$crud->set_js('assets/grocery_crud/js/jquery_plugins/config/jquery.datepicker.config.js');
		}




		$crud->columns('day_id','shift_start','shift_end','is_holiday');
		$crud->add_fields('day_id','employee_id','shift_start','shift_end','is_holiday');
		$crud->edit_fields('day_id','shift_start','shift_end','is_holiday');

		$crud->change_field_type('shift_start','time');
		$crud->change_field_type('shift_end','time');

		$crud->change_field_type('employee_id','invisible');


		$crud->callback_before_insert(array($this,'check_day'));

		$data['page_title'] = "جدول مواعيد الموظفين";
		$data['crud_output'] = $crud->render();

		$this->admin_view_ar('crud_output.php', $data);

	}

	function format_time($value, $row)
	{

		if ($value == null){
			return '';
		}else{
			return date("H:i",strtotime($value) );
		}

	}


	function check_day($post_array)
	{
		$employee_id = $this->uri->segment('3');
		$day_id = $post_array['day_id'];

		$check_day_exist = $this->Schedule_model->check_employee_and_day($employee_id, $day_id);

		if ($check_day_exist){
			$post_array['employee_id'] = $employee_id;
			return $post_array;
		}else{
			$this->form_validation->set_message('check_day', 'لا يمكن اضافة ميعاد لنفس اليوم مرتين، يرجى تعديل اليوم المضاف مسبقاً');
			return false;

		}


	}





}
