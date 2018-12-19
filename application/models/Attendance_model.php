<?php
class Attendance_model  extends CI_Model  {

	function __construct()
    {
        parent::__construct();
    }
    function check_employee_and_date ($employee_id)
    {

		$date = date('Y-m-d');

    	$check_employee_and_date = $this->db->get_where ('attendance' , array (
    			'employee_id' => $employee_id ,
    			'date' => $date
    	));

    	if ($check_employee_and_date->num_rows()> 0 )
    	{
    		return true ;
    	}else
    	{
    		return false ;
    	}
    }


	function signout ($id)
	{
		$get_employee_and_date_row = $this->db->get_where ('attendance' , array (
			'id' => $id
		))->row();

		$check_employee_date = $get_employee_and_date_row ->check_out;
		$latency_in_sign_in = $get_employee_and_date_row ->latency;

		if ($check_employee_date == null){

			$check_out = date('Y-m-d H:i:s');
//			$check_out = '2018-12-15 01:13:00';
			$check_in = $get_employee_and_date_row->check_in;

			$check_in_string = strtotime($check_in);
			$check_out_string = strtotime($check_out);

			$day_of_week =   date("N", strtotime($get_employee_and_date_row ->date));

			$get_shift_row = $this->db->get_where ('schedule' , array (
				'employee_id' => $get_employee_and_date_row->employee_id,
				'day_id' =>$day_of_week
			))->row();

			$shift_end = $get_shift_row->shift_end;
			$shift_end_string = strtotime($get_employee_and_date_row->date.' '.$shift_end);

			$totalSeconds = $check_out_string - $shift_end_string;
			$hours        = $totalSeconds/(60*60)%24;
			$minutes      = $totalSeconds/60%60;
			$seconds      = $totalSeconds % 60;

			$extra = $hours.":".$minutes.":".$seconds;
			$parts = explode(':', $extra);
			$extra_hours_in_sign_out = round($parts[0] + floor(($parts[1]/60)*100) / 100,2);

			$totalWorkingSeconds = $check_out_string - $check_in_string;
			$hours        = $totalWorkingSeconds/(60*60)%24;
			$minutes      = abs($totalWorkingSeconds/60%60);
			$seconds      = abs($totalWorkingSeconds % 60);

			$extra = $hours.":".$minutes.":".$seconds;
			$parts = explode(':', $extra);
			$total_hours = round($parts[0] + floor(($parts[1]/60)*100) / 100,2);


//			echo $check_out;
//			echo "<br>";
//			echo $get_employee_and_date_row->date.' '.$shift_end;
//			echo "<br>";
//			echo "Extra hours in sign-out: ".$extra_hours_in_sign_out;
//			echo "<br>";
//			echo "Latency in sign-in: ".$latency_in_sign_in;


			$get_daily_fare = $this->db->get_where ('employees' , array (
				'id' => $get_employee_and_date_row->employee_id,
			))->row();
			$daily_fare = $get_daily_fare->salary/26;
			$hourly_fare = $daily_fare / $get_daily_fare->working_hours;


			$extra_hours_fare = 0;
			$latency_fare = 0;
			$latency = 0;
			$extra_hours = 0;


			// Sign out Early
			if ($extra_hours_in_sign_out < 0.50){
				// Sign out Early + Sign in Early
				if ($latency_in_sign_in < 0){
					$latency = abs($extra_hours_in_sign_out);
					$extra_hours = abs($latency_in_sign_in);
				}
				// Sign out Early + Sign in Late
				elseif ($latency_in_sign_in > 0.50){
					$latency = abs($extra_hours_in_sign_out) + $latency_in_sign_in;
				}
				// Sign out Early + Sign in on time
				else{
					$latency = abs($extra_hours_in_sign_out);
				}

			}
			//Sign out Late
			elseif ($extra_hours_in_sign_out > 0){
				// Sign out Late + Sign in Early
				if ($latency_in_sign_in < 0){
					$extra_hours = abs($latency_in_sign_in) + $extra_hours_in_sign_out;
				}
				// Sign out Late + Sign in Late
				elseif($latency_in_sign_in > 0.50){
					$latency = $latency_in_sign_in;
					$extra_hours = $extra_hours_in_sign_out;
				}
				// Sign out Late + Sign in on time
				else{
					$latency = abs($extra_hours_in_sign_out);
				}
			}
			//Sign out on time
			else{
				// Sign out on time + Sign in Early
				if ($latency_in_sign_in < 0){
					$extra_hours = abs($latency_in_sign_in);
				}
				// Sign out on time + Sign in Late
				elseif($latency_in_sign_in > 0.50){
					$latency = $latency_in_sign_in;
				}
				// Sign out on time + Sign in on time
				else{
					$latency = 0;
					$extra_hours = 0;
				}
			}





			$latency_fare = $latency * 2 * $hourly_fare;
			$extra_hours_fare = $extra_hours * $hourly_fare;



			$day_fare = round($daily_fare - $latency_fare + $extra_hours_fare,2);
//
//			echo "<br>";
//			echo "Daily_fare:".$daily_fare;
//			echo "<br>";
//			echo "Hourly_fare:".$hourly_fare;
//			echo "<br>";
//			echo "Latency Fare:".$latency_fare;
//			echo "<br>";
//			echo "Extra Hours Fare:".$extra_hours_fare;
//			echo "<br>";
//			echo "Total Hours:".$total_hours;
//			echo "<br>";
//			echo "Day Fare:".$day_fare;
//			die();


			$signout =	$this->db->set(array('check_out'=>$check_out,'extra_hours'=>$extra_hours_in_sign_out,'total_hours'=>$total_hours,'day_fare'=>$day_fare));
						$this->db->where('id',$id);
						$this->db->update('attendance');

			if ($signout){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}




	}



	function get_shift_start ($employee_id,$day)
	{

		$query = $this->db->get_where ('schedule' , array ('employee_id' => $employee_id,'day_id'=>$day));

		$has_shift = $query ->num_rows();

		 if ($has_shift > 0){
		 	return $query->row()->shift_start;
		 }else{
		 	return false;
		 }


	}

	function is_holiday ($employee_id,$day)
	{

		$query = $this->db->get_where ('schedule' , array ('employee_id' => $employee_id,'day_id'=>$day));

		$is_holiday = $query ->num_rows();

		if ($is_holiday > 0){
			$is_holiday = $query ->row()->is_holiday;
			if ($is_holiday == 1){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}






	}



	function get_current_month_salary ($employee_id)
	{

		$date = date('Y-m-d');

		$datestring=$date.' first day of last month';
		$dt=date_create($datestring);
		$date_last_month = $dt->format('Y-m'.'-25');

		$get_current_month_salary = $this->db->query('SELECT sum(day_fare) as current_month_salary FROM attendance WHERE date <= "'.$date.'" and date >= "'.$date_last_month.'" and employee_id = "'.$employee_id.'"')->row();

		return round($get_current_month_salary-> current_month_salary,2);

	}


}
