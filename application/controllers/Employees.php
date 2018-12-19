<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Employees extends CI_Controller
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
		redirect('employees/all_employees','refresh');
	}

	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_employees()
	{
		$crud = new grocery_CRUD();
		$crud->set_table('employees');
		$crud->set_subject('الموظفين');

		$crud->set_theme('datatables');

		$crud->display_as('employee_name', 'الاسم');
		$crud->display_as('employee_mobile', 'رقم الموبايل');
		$crud->display_as('employee_id_number', 'رقم البطاقة');
		$crud->display_as('working_hours', 'عدد ساعات العمل');
		$crud->display_as('salary', 'المرتب');

		$crud->display_as('current_month_salary', 'مرتب الشهر الحالي');

		$crud->set_rules('employee_mobile', 'رقم الموبايل', 'required|xss_clean|numeric|min_length[11]|max_length[11]');

		$crud->add_action('المواعيد', '', 'schedule/index','ui-icon-clock',array($this,'show_schedule'));

		$crud->columns('employee_name','employee_mobile','employee_id_number','working_hours','salary','current_month_salary');
		$crud->callback_column('current_month_salary', array($this, 'get_current_month_salary'));

		$data['page_title'] = "الموظفين";
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


	public function show_schedule($primary_key , $row)
	{
		return base_url().'schedule/all_schedule/'.$primary_key;
	}


	public function get_current_month_salary($primary_key , $row)

	{
		$get_current_month_salary = $this->Attendance_model->get_current_month_salary($row->id);
		return $get_current_month_salary;
	}


}
