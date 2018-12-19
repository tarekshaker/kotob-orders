<?php
class Order_model  extends CI_Model  {

	function __construct()
    {
        parent::__construct();
    }
    function return_order ($id)
    {
		$this->db->set('order_price',null);
		$this->db->set('delivery_price',null);
		$this->db->set('order_total_price',null);
		$this->db->where('id',$id);

    	$return_order = $this->db->update('orders');

//    	echo $this->db->last_query(); die();

    	if ($return_order)
    	{
    		return true ;
    	}else
    	{
    		return false ;
    	}
    }



}
