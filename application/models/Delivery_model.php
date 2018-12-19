<?php
class Delivery_model  extends CI_Model  {

	function __construct()
    {
        parent::__construct();
    }

    function get_delivery_total ($delivery_id)
	{
		$get_delivery_total = $this->db->query('SELECT sum(delivery_price) as delivery_total from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "5"')->row();
		$delivery_total = $get_delivery_total->delivery_total;
		return $delivery_total;
	}

	function get_orders_total ($delivery_id)
	{
		$get_order_price = $this->db->query('SELECT sum(order_price) as order_price from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "5"')->row();
		$order_price = $get_order_price->order_price;
		return $order_price;
	}

	function get_orders_total_price ($delivery_id)
	{
		$get_orders_total_price = $this->db->query('SELECT sum(order_total_price) as order_total_price from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "5"')->row();
		$order_total_price = $get_orders_total_price->order_total_price;
		return $order_total_price;
	}

	function get_not_collected_delivery ($delivery_id)
	{
		$get_not_collected_delivery = $this->db->query('SELECT sum(delivery_price) as delivery_total from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "4" and order_status != "5"')->row();
		$not_collected_delivery = $get_not_collected_delivery->delivery_total;
		return $not_collected_delivery;
	}

	function get_not_collected_orders_total ($delivery_id)
	{
		$get_not_collected_orders_total = $this->db->query('SELECT sum(order_price) as order_price from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "4" and order_status != "5"')->row();
		$not_collected_orders_total = $get_not_collected_orders_total->order_price;
		return $not_collected_orders_total;
	}

	function get_not_collected_orders_total_price ($delivery_id)
	{
		$get_not_collected_orders_total_price = $this->db->query('SELECT sum(order_total_price) as order_total_price from orders where order_delivered_to = "' . $delivery_id . '" and order_status != "4" and order_status != "5"')->row();
		$not_collected_orders_total_price = $get_not_collected_orders_total_price->order_total_price;
		return $not_collected_orders_total_price;
	}

	function get_collected_cash_difference ($delivery_id)
	{
		$get_collected_cash_difference = $this->db->query('SELECT sum(cash_difference) as cash_difference from orders where order_delivered_to = "' . $delivery_id . '" and order_status = "4" and order_status != "5"')->row();
		$collected_cash_difference = $get_collected_cash_difference->cash_difference;
		return $collected_cash_difference;
	}







}
