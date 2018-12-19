<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Attendance extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->library('form_validation');
		$this->load->model('Attendance_model');
		$this->load->helper('security');

	}

	public function index()
	{
		redirect('attendance/all_attendance','refresh');
	}

	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_attendance()
	{
		$crud = new grocery_CRUD();
		$crud->set_table('attendance');
		$crud->set_subject('الحضور والانصراف');

		$crud->set_theme('datatables');

		$crud->display_as('employee_id', 'اسم الموظف');
		$crud->display_as('check_in', 'الحضور');
		$crud->display_as('check_out', 'الانصراف');
		$crud->display_as('date', 'التاريخ');

		$crud->display_as('latency', 'التأخير');
		$crud->display_as('extra_hours', 'الساعات الزائدة');
		$crud->display_as('total_hours', 'صافي عدد الساعات');

		$crud->set_relation('employee_id', 'employees', 'employee_name');

		$crud->columns(array('employee_id','date','check_in','check_out'));
		$crud->add_fields('employee_id');


		$crud->add_action('انصراف', '', 'attendance/signout','ui-icon-power');

		$currentState = $crud->getState();
		if($currentState == 'add' || $currentState == 'insert_validation') {
			$crud->set_rules('employee_id', 'اسم الموظف', 'required|xss_clean|callback_check_attendance['.$this->input->post('employee_id').']');
		}


		if( $currentState == 'add' || $currentState == 'edit' || $currentState == 'list') {
			$crud->set_css('assets/grocery_crud/css/ui/simple/'.grocery_CRUD::JQUERY_UI_CSS);
			$crud->set_js('assets/grocery_crud/js/jquery_plugins/config/jquery.datepicker.config.js');
		}

		$crud->callback_column('check_in', array($this, 'format_time'));
		$crud->callback_column('check_out', array($this, 'format_time'));

		$crud->fields('employee_id','date','check_in','latency','check_out');

		$crud->change_field_type('date','invisible');
		$crud->change_field_type('check_in','invisible');
		$crud->change_field_type('latency','invisible');
		$crud->change_field_type('check_out','invisible');


		$crud->callback_before_insert(array($this,'insert_attend_and_latency'));

		$crud->unset_edit();
		$crud->unset_delete();

		$data['page_title'] = "الحضور والانصراف";
		$data['crud_output'] = $crud->render();

		$this->admin_view_ar('crud_output.php', $data);

	}

	function signout($primary_key){

		$signout = $this->Attendance_model->signout($primary_key);

		if ($signout){
			$this->session->set_flashdata ( 'notification_success' , 'تم تسجيل الانصراف بنجاح');

		}else{
			$this->session->set_flashdata ( 'notification_error' , 'لقد قمت بتسجيل الانصراف من قبل');

		}

		redirect('attendance/all_attendance','refresh');

	}


	function insert_attend_and_latency($post_array){

		$post_array['check_in'] = date('Y-m-d H:i:s');

		$post_array['date'] = date('Y-m-d');
		$day_of_week =   date("N", strtotime($post_array['date']));
		$check_in = strtotime($post_array['check_in']);

		$get_shift_start = $this->Attendance_model->get_shift_start($post_array['employee_id'], $day_of_week);
		$shift_start = strtotime($get_shift_start);

		$totalSeconds = $check_in - $shift_start;
		$hours        = ($totalSeconds/(60*60))%24;
		$minutes      = ($totalSeconds/60)%60;
		$seconds      = $totalSeconds % 60;


		$latency = $hours.":".$minutes.":".$seconds;

		$parts = explode(':', $latency);
		$latency_time = round($parts[0] + floor(($parts[1]/60)*100) / 100,2);

		$post_array['latency'] = $latency_time;

		return $post_array;
	}



	function check_attendance($employee_id){


		$date = date('Y-m-d');

		$check_attendance_exist = $this->Attendance_model->check_employee_and_date($employee_id, $date);

		if ($check_attendance_exist){

			$this->form_validation->set_message('check_attendance', 'لا يمكن اضافة حضور لنفس الموظف مرة أخرى');
			return false;

		}else{

			$day_of_week =   date("N", strtotime($date));
			$is_holiday = $this->Attendance_model->is_holiday($employee_id, $day_of_week);

			if ($is_holiday){
				$this->form_validation->set_message('check_attendance', 'هذا اليوم مسجل كأجازة في جدول المواعيد');
				return false;
			}else{

				$get_shift_start = $this->Attendance_model->get_shift_start($employee_id, $day_of_week);
				
				if ($get_shift_start){
					return true;
				}else{
					$this->form_validation->set_message('check_attendance', 'لا يوجد مواعيد مسجلة لهذا اليوم في جدول المواعيد');
					return false;
				}


			}
		}

	}


	function format_time($value, $row)
	{
		if ($value == null){
			return '';
		}else{
			return date("Y-m-d H:i",strtotime($value) );
		}

	}



}
