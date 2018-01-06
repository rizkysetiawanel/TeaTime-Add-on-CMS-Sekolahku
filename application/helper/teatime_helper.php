<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Tea Time helper :D
 * @version    0.1
 * @author     Tea Time | https://www.facebook.com/mychemicalromance.rizky | rizkys2323@gmail.com | 081311243588
 * @copyright  2018
 * @since      Version 0.1
 *
 *
 * Fungsi : jumlah fungsi 1
 * 1. postPerTagCat = mengatur jumlah post per tag / kategori
 */

/**
 * POST PER TAG / KATEGORI
 */

if (!function_exists('postPerTagCat')) {
	function postPerTagCat() 
	{
		$CI =& get_instance();

		$CI->db->select('*');
		$CI->db->from('settings');
		$CI->db->where('variable', 'post_per_tag_cat');

		$query = $CI->db->get();

		foreach($query->result() as $row)
		{
			$value = $row->value;
		}

		return $value;

	}
}
