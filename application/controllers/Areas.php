<?php

/**
 * Created by PhpStorm.
 * User: Smart PC
 * Date: 5/21/2018
 * Time: 9:42 PM
 */
class Areas extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->load->library('form_validation');
		$this->load->helper('security');
	}

	public function index()
	{
		redirect('areas/all_areas','refresh');
	}

	private function admin_view_ar($view = null, $data = null)
	{
		$this->load->view('includes/header.php');
		$this->load->view($view, $data);
		$this->load->view('includes/footer.php');
	}

	public function all_areas()
	{
		$crud = new grocery_CRUD();
		$crud->set_table('areas');
		$crud->set_subject('منطقة');

		$crud->set_theme('datatables');

		$crud->display_as('area_ar_name', 'اسم المنطقة');

		$crud->set_rules('area_ar_name', 'اسم المنطقة', 'required|xss_clean|callback_regex');

		$crud->unset_delete();
		$crud->unset_edit();

		$data['page_title'] = "المناطق";
		$data['crud_output'] = $crud->render();

		$this->admin_view_ar('crud_output.php', $data);

	}


	public function regex($name,$lang)
	{
		if (preg_match('/^([0-9]|[\p{Arabic}_ ])*$/u', $name)) {
			return true;
		} else {
			$this->form_validation->set_message('regex', 'الاسم يجب ان يتكون من حروف عربية فقط');

			return false;
		}
	}


}
