<?php
class Schedule_model  extends CI_Model  {

	function __construct()
    {
        parent::__construct();
    }
    function check_employee_and_day ($employee_id,$day_id )
    {

    	$check_employee_and_day = $this->db->get_where ('schedule' , array (
    			'employee_id' => $employee_id ,
    			'day_id' => $day_id
    	))->num_rows();

//    	echo $this->db->last_query(); die();

    	if ($check_employee_and_day > 0 )
    	{
    		return false ;
    	}else
    	{
    		return true ;
    	}
    }



}
