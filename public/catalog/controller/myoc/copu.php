<?php  
class ControllerMyocCopu extends Controller {
	public function index($args) {
		$ssl = isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] : false;

		$type = isset($args['type']) ? $args['type'] : false;
		$path = isset($args['path']) ? $args['path'] : false;
		$copu_product_id = isset($args['copu_product_id']) ? $args['copu_product_id'] : 0;
		$product_option_id = isset($args['product_option_id']) ? $args['product_option_id'] : false;
		$product_id = isset($this->request->get['product_id']) ? (int)$this->request->get['product_id'] : false;

		$copu_products = $this->config->get('copu_products');
		$copu_product = false;
		if($copu_products) {
			foreach($copu_products as $copu_product_value) {
				if($type == 'product' && $copu_product_id && $copu_product_value['copu_product_id'] == $copu_product_id) {
					$data['copu_product_id'] = $copu_product_id;
					$copu_product = $copu_product_value;
					break;
				}
			}
		}

		if($copu_product) {
			$copu_status = $copu_product['status'];
			$copu_stores = isset($copu_product['stores']) ? $copu_product['stores'] : array();
			$copu_drag_drop = $copu_product['drag_drop'];
			$copu_multiple = $copu_product['multiple'];
			$copu_force_qty = $copu_product['force_qty'];
			$copu_max_filesize = $copu_product['max_filesize'];
			$copu_max_filename_length = $copu_product['max_filename_length'];
			$copu_preview = $copu_product['preview'];
			$copu_replace = $copu_product['replace'];
			$copu_preview_dimension_w = $copu_product['preview_dimension_w'];
			$copu_preview_dimension_h = $copu_product['preview_dimension_h'];
			$copu_message = $copu_product['message'][$this->config->get('config_language_id')]['message'];
		} else {
			$copu_status = $this->config->get('copu_' . $type . '_status');
			$copu_stores = $this->config->get('copu_' . $type . '_stores');
			$copu_drag_drop = $this->config->get('copu_' . $type . '_drag_drop');
			$copu_multiple = $this->config->get('copu_' . $type . '_multiple');
			$copu_force_qty = false;
			$copu_max_filesize = $this->config->get('copu_' . $type . '_max_filesize');
			$copu_max_filename_length = $this->config->get('copu_' . $type . '_max_filename_length');
			$copu_preview = $this->config->get('copu_' . $type . '_preview');
			$copu_replace = false;
			$copu_preview_dimension_w = $this->config->get('copu_' . $type . '_preview_dimension_w');
			$copu_preview_dimension_h = $this->config->get('copu_' . $type . '_preview_dimension_h');
			$copu_message = $this->config->get('copu_' . $type . '_message');
			$copu_message = $copu_message[$this->config->get('config_language_id')]['message'];
		}

		if(!$type || !$copu_status || ($type == 'customer' && $path == 'register' && !$this->config->get('copu_customer_register')) || $copu_stores == "" || !in_array($this->config->get('config_store_id'), $copu_stores)) {
			return false;
		}
		$this->load->language('myoc/copu');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		$this->load->model('myoc/copu');

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/myoc/copu.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/myoc/copu.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/myoc/copu.css');
		}
		$this->document->addScript('catalog/view/javascript/jquery/myoc/copu-helper.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/jquery.ui.widget.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/load-image.all.min.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/canvas-to-blob.min.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/jquery.iframe-transport.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/jquery.fileupload.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/jquery.fileupload-process.js');
		$this->document->addScript('catalog/view/javascript/jquery/myoc/jquery.fileupload-image.js');

		if(VERSION >= '1.5.5') {
			if (file_exists('catalog/view/javascript/jquery/colorbox/colorbox.css')) {
				$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
			}
			if (file_exists('catalog/view/javascript/jquery/colorbox/jquery.colorbox.js')) {
				$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox.js');
			}
		}
		$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

		$data['text_upload'] = $this->language->get('text_upload');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_confirm_delete'] = $this->language->get('text_confirm_delete');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_popup'] = $this->language->get('text_popup');
		$data['text_drag_drop'] = $this->language->get('text_drag_drop');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_complete'] = $this->language->get('text_complete');
		$data['date_format_short'] = $this->language->get('date_format_short');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_date'] = $this->language->get('column_date');
		$data['column_size'] = $this->language->get('column_size');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_upload'] = $this->language->get('button_upload');
		$data['button_remove'] = $this->language->get('button_remove');

		if ($type == 'order' && $path && $this->config->get('copu_order_minimum') && (!isset($this->session->data['copu_order_uploads']) || count($this->session->data['copu_order_uploads']) < $this->config->get('copu_order_minimum'))) {
			$data['error_upload_minimum'] = sprintf($this->language->get('error_upload_minimum'), $this->config->get('copu_order_minimum'));
			if($path == 'checkout') {
				$this->response->redirect($this->url->link('checkout/cart'));
			}
		} else {
			$data['error_upload_minimum'] = '';
		}

		$data['product_id'] = $product_id;
		$data['product_option_id'] = $product_option_id;
		$data['drag_drop'] = $copu_drag_drop;
		$data['multiple'] = $copu_multiple;
		$data['force_qty'] = $copu_force_qty;
		$data['max_filesize'] = $copu_max_filesize * 1024;
		$data['copu_replace'] = $copu_replace;
		$data['copu_preview_dimension_w'] = $copu_preview_dimension_w;
		$data['copu_preview_dimension_h'] = $copu_preview_dimension_h;
		$data['no_image'] = $this->model_tool_image->resize('no_image.png', $copu_preview_dimension_w, $copu_preview_dimension_h);
		$data['copu_max_filename_length'] = $copu_max_filename_length;
		$data['date'] = false;
		$data['nosession'] = '';
		$data['type'] = $type;
		$data['type_id'] = (isset($this->request->get['order_id']) && $type == 'order') ? $this->request->get['order_id'] : 0;

		$colspan = 4;
		$data['copu_preview'] = $copu_preview;
		if(!$data['copu_preview']) {
			$colspan--;
		}
		if($path == 'checkout' || $type == 'product' || ($type == 'order' && !$path)) {
			$colspan--;
		}
		if($type == 'customer' && !$path) {
			$data['date'] = true;
			$data['nosession'] = '&session=0';
			$colspan++;
		}
		$data['colspan'] = $colspan;

		$data['action'] = ($path == 'checkout' || ($type == 'order' && !$path)) ? false : true;
		$data['copu_order_history_modify'] = ($this->config->get('copu_order_history_modify') && $path != 'cart' && $path != 'checkout') ? true : false;

		if($type == 'order' && $data['copu_order_history_modify']) {
			$data['nosession'] = '&session=0';
		}

		$data['copu_message'] = ($data['action'] || $data['copu_order_history_modify']) ? html_entity_decode($copu_message, ENT_QUOTES, 'UTF-8') : false;

		$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;			

		if($type == 'product') {
			$uploads = isset($this->session->data['copu_product_uploads'][$product_id][$product_option_id]) ? $this->session->data['copu_product_uploads'][$product_id][$product_option_id] : false;
		} elseif($type == 'customer' && !$path) {
			$uploads = $this->model_myoc_copu->getUploads(array('customer_id' => $this->customer->isLogged(), 'start' => ($page - 1) * $this->config->get('copu_customer_files_per_page'), 'limit' => $this->config->get('copu_customer_files_per_page')));
		} elseif($type == 'order' && !$path) {
			$uploads = $this->model_myoc_copu->getUploads(array('order_id' => $this->request->get['order_id']));
		} else {
			$uploads = isset($this->session->data['copu_' . $type . '_uploads']) ? $this->session->data['copu_' . $type . '_uploads'] : false;
		}
		$data['uploads'] = array();

		if($uploads) {
			if(method_exists($this->encryption, 'encrypt')) {
				$encryption = $this->encryption;
			} else {
				$this->load->library('encryption');
			 	$encryption = new Encryption($this->config->get('config_encryption'));
			}
			foreach ($uploads as $upload_id => $upload) {
				if(is_array($upload)) {
					$file = $upload['filename'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($upload);
					if(isset($upload_info['filename'])) {
						$file = $upload_info['filename'];
					} else {
						$file = $this->encryption->decrypt($upload);
					}
				}
				$filename = myoc_basename(substr($file, 0, strrpos($file, '.')));
				if (file_exists(DIR_UPLOAD . $file)) {
					$size = filesize(DIR_UPLOAD . $file);
					$image = false;
	        		$popup = false;
                    $replace = false;
					if(($copu_preview || $copu_replace) && $file && $size) {
						$imageinfo = @getimagesize(DIR_UPLOAD . $file);
                		if($imageinfo[2] > 0 && $imageinfo[2] < 4) {
                			$random_str = md5($upload_id);
		                    copy(DIR_UPLOAD . $file, DIR_IMAGE . $random_str . $filename);
		                    $image = $copu_preview ? $this->model_tool_image->resize($random_str . $filename, $copu_preview_dimension_w, $copu_preview_dimension_h) : false;
		                    $popup = ($copu_preview || $copu_replace) ? $this->model_tool_image->resize($random_str . $filename, $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')) : false;
		                    $replace = ($type == 'product' && $copu_replace)  ? $this->model_tool_image->resize($random_str . $filename, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')) : false;
		                    unlink(DIR_IMAGE . $random_str . $filename);
		                } else {
		        			$image = $copu_preview ? $this->model_tool_image->resize('no_image.png', $copu_preview_dimension_w, $copu_preview_dimension_h) : false;
		        		}
		        	}

					$data['uploads'][] = array(
						'upload_id'	=> $upload_id,
						'image' 	=> $image,
						'popup' 	=> $popup,
						'replace'   => $replace,
						'date' 		=> isset($upload['date_added']) ? date($this->language->get('date_format_short'), strtotime($upload['date_added'])) : false,
						'name'      => truncateFilename($filename, $copu_max_filename_length),
						'size'      => formatFilesize($size),
						'href'      => $this->url->link('myoc/copu/download', 'f=' . urlencode($encryption->encrypt($file)), $ssl),
						'delete'	=> $this->url->link('myoc/copu/delete', 'upload_id=' . $upload_id, $ssl),
					);
				}
			}
		}

		$tpl = 'copu.tpl';
		if($type == 'product') {
			$tpl = 'copu_product.tpl';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/myoc/' . $tpl)) {
			return $this->load->view($this->config->get('config_template') . '/template/myoc/' . $tpl, $data);
		} else {
			return $this->load->view('default/template/myoc/' . $tpl, $data);
		}
	}

	public function cart($args) {
		$ssl = isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] : false;

		$this->load->language('myoc/copu');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['text_download'] = $this->language->get('text_download');

		$data['uploads'] = array();

		$data['path'] = 'cart';
		if(isset($this->request->get['route'])) {
			if(trim($this->request->get['route']) == 'checkout/confirm' || trim($this->request->get['route']) == 'account/order/info') {
				$data['path'] = 'confirm';
			}
		}

		if(method_exists($this->encryption, 'encrypt')) {
			$encryption = $this->encryption;
		} else {
			$this->load->library('encryption');
		 	$encryption = new Encryption($this->config->get('config_encryption'));
		}
		
		$copu_products = $this->config->get('copu_products');
		$copu_product = false;

		if(isset($args['key'])) {
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				if((isset($product['key']) ? $product['key'] : $product['cart_id']) == $args['key']) {
					foreach ($product['option'] as $option) {
						if($option['type'] == 'file' && $option['value'] && $copu_products && !empty($copu_products)) {
							foreach($copu_products as $copu_product) {
								if($copu_product['status'] && isset($copu_product['options']) && !empty($copu_product['options']) && in_array($option['option_id'], $copu_product['options']) && isset($copu_product['stores']) && !empty($copu_product['stores']) && in_array($this->config->get('config_store_id'), $copu_product['stores'])) {
									$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
									$file = $upload_info['filename'];
									$filename = $upload_info['name'];
									$size = file_exists(DIR_UPLOAD . $file) ? filesize(DIR_UPLOAD . $file) : 0;
									$data['uploads'][] = array(
										'option_name' => $option['name'],
										'size' => formatFilesize($size),
										'href' => $this->url->link('myoc/copu/download', 'f=' . urlencode($encryption->encrypt($file)), $ssl),
										'filename' => truncateFilename($filename, $copu_product['max_filename_length']),
									);
								}
							}
						}
					}
				}
			}
		} elseif(isset($args['order_id'])) {
			$this->load->model('account/order');
			$products = $this->model_account_order->getOrderProducts($args['order_id']);

			foreach ($products as $product) {
				if($product['order_product_id'] == $args['order_product_id']) {
					$options = $this->model_account_order->getOrderOptions($args['order_id'], $args['order_product_id']);
					foreach ($options as $option) {
						if($option['type'] == 'file' && $option['value'] && $copu_products && !empty($copu_products)) {
							foreach($copu_products as $copu_product) {
								if($copu_product['status'] && $copu_product['stores'] != "" && in_array($this->config->get('config_store_id'), $copu_product['stores'])) {
									$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);
									$file = $upload_info['filename'];
									$size = file_exists(DIR_UPLOAD . $file) ? filesize(DIR_UPLOAD . $file) : 0;
									$filename = $upload_info['name'];
									$data['uploads'][] = array(
										'option_name' => $option['name'],
										'size' => formatFilesize($size),
										'href' => $this->url->link('myoc/copu/download', 'f=' . urlencode($encryption->encrypt($file)), $ssl),
										'filename' => truncateFilename($filename, $copu_product['max_filename_length']),
									);
									break;
								}
							}
						}
					}
				}
			}
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/myoc/copu_cart.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/myoc/copu_cart.tpl', $data);
		} else {
			return $this->load->view('default/template/myoc/copu_cart.tpl', $data);
		}
	}

	public function customer() {
		$ssl = isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] : false;

		if(!$this->config->get('copu_customer_status') || $this->config->get('copu_customer_stores') == "" || !in_array($this->config->get('config_store_id'), $this->config->get('copu_customer_stores'))) {
			$this->response->redirect($this->url->link('account/account', '', $ssl));
		}
		if(!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/upload', '', $ssl);
			$this->response->redirect($this->url->link('account/login', '', $ssl));
		}
		$this->load->language('myoc/copu');

		$this->document->setTitle($this->language->get('heading_title'));
      	
		$data['breadcrumbs'] = array();

      	$data['breadcrumbs'][] = array(
        	'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
      	); 

      	$data['breadcrumbs'][] = array(       	
        	'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', $ssl)
      	);

      	$data['breadcrumbs'][] = array(       	
        	'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/upload')
      	);
								
		$data['heading_title'] = $this->language->get('heading_title');	

		$data['button_continue'] = $this->language->get('button_continue');

		$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;
		$this->load->model('myoc/copu');
		$upload_total = $this->model_myoc_copu->getTotalUploads(array('type' => 'customer', 'type_id' => $this->customer->isLogged()));

		$pagination = new Pagination();
		$pagination->total = $upload_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('copu_customer_files_per_page');
		$pagination->url = $this->url->link('account/upload', 'page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($upload_total) ? (($page - 1) * $this->config->get('copu_customer_files_per_page')) + 1 : 0, ((($page - 1) * $this->config->get('copu_customer_files_per_page')) > ($upload_total - $this->config->get('copu_customer_files_per_page'))) ? $upload_total : ((($page - 1) * $this->config->get('copu_customer_files_per_page')) + $this->config->get('copu_customer_files_per_page')), $upload_total, ceil($upload_total / $this->config->get('copu_customer_files_per_page')));

		$data['continue'] = $this->url->link('account/account', '', $ssl);

		$data['copu_customer'] = $this->load->controller('myoc/copu', array('type' => 'customer'));
							
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/myoc/copu_customer.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/myoc/copu_customer.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/myoc/copu_customer.tpl', $data));
		}
	}

	public function validateUpload() {
		$this->load->language('myoc/copu');
		$this->load->model('myoc/copu');

		$type = $this->request->get['type'];

		$type_id = isset($this->request->get['type_id']) ? $this->request->get['type_id'] : false;
		$product_option_id = isset($this->request->get['product_option_id']) ? $this->request->get['product_option_id'] : false;
		$copu_product_id = isset($this->request->get['copu_product_id']) ? $this->request->get['copu_product_id'] : false;
		$session = isset($this->request->get['session']) ? $this->request->get['session'] : true;

		$copu_products = $this->config->get('copu_products');
		$copu_product = false;
		if($copu_products) {
			foreach ($copu_products as $copu_product_value) {
				if($copu_product_id && $copu_product_value['copu_product_id'] == $copu_product_id) {
					$copu_product = $copu_product_value;
					break;
				}
			}
		}

		if($copu_product) {
			$copu_status = $copu_product['status'];
			$copu_stores = isset($copu_product['stores']) ? $copu_product['stores'] : array();
			$copu_login = $copu_product['login'];
			$copu_customer_groups = isset($copu_product['customer_groups']) ? $copu_product['customer_groups'] : array();
			$copu_limit = $copu_product['limit'];
			$copu_filetypes = isset($copu_product['filetypes']) ? $copu_product['filetypes'] : array();
			$copu_max_filesize = $copu_product['max_filesize'];
		} else {
			$copu_status = $this->config->get('copu_' . $type . '_status');
			$copu_stores = $this->config->get('copu_' . $type . '_stores');
			$copu_login = $this->config->get('copu_' . $type . '_login');
			$copu_customer_groups = $this->config->get('copu_' . $type . '_customer_groups');
			$copu_limit = $this->config->get('copu_' . $type . '_limit');
			$copu_filetypes = $this->config->get('copu_' . $type . '_filetypes');
			$copu_max_filesize = $this->config->get('copu_' . $type . '_max_filesize');
		}

		$json = array();

		//create upload session
		if(!isset($this->session->data['copu_' . $type . '_uploads']) && $session) {
			$this->session->data['copu_' . $type . '_uploads'] = array();
		}
		if($type == 'product' && $type_id && !isset($this->session->data['copu_' . $type . '_uploads'][$type_id])) {
			$this->session->data['copu_' . $type . '_uploads'][$type_id] = array();
		}
		if($type == 'product' && $type_id && $product_option_id && !isset($this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id])) {
			$this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id] = array();
		}

		//check status and store
		if(!$copu_status || $copu_stores == "" || !in_array($this->config->get('config_store_id'), $copu_stores)) {
			$json['error'] = $this->language->get('error_upload_status');
			$this->response->setOutput(json_encode($json));
			return;
		}

		//check login
		if($copu_login && ($session xor $type == 'customer') && (!$this->customer->isLogged() || !$copu_customer_groups || !in_array($this->customer->getGroupId(), $copu_customer_groups))) {
			$json['error'] = $this->language->get('error_login');
			$this->response->setOutput(json_encode($json));
			return;
		}

		//check file limit
		$upload_total = 0;
		if($type != 'product' && isset($this->session->data['copu_' . $type . '_uploads'])) {
			$upload_total = count($this->session->data['copu_' . $type . '_uploads']);
		}
		if($type == 'product' && $this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id]) {
			$upload_total = count($this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id]);
		}
		if(!$session) {
			if($type == 'customer') {
				$type_id = $this->customer->isLogged();
			}
			$upload_total = $this->model_myoc_copu->getTotalUploads(array('type' => $type, 'type_id' => $type_id));
		}
		if($upload_total >= $copu_limit) {
			$json['error'] = $this->language->get('error_limit');
			$this->response->setOutput(json_encode($json));
			return;
		}

		$filetypes = $this->model_myoc_copu->getFiletypes($copu_filetypes);

		if (!empty($this->request->get['filename'])) {
			$filename = html_entity_decode($this->request->get['filename'], ENT_QUOTES, 'UTF-8');
			
			if ((strlen($filename) < 3) || (strlen($filename) > 64)) {
				$json['error'] = $this->language->get('error_filename');
			}
			
			$allowed_ext = array();
			$allowed_mime = array();
			
			foreach ($filetypes as $filetype) {
				$allowed_ext[] = trim($filetype['ext']);
				$allowed_mime[trim($filetype['ext'])] = ($filetype['mime'] == '') ? false : explode(",", $filetype['mime']);
			}

			$ext = strtolower(substr(strrchr($filename, '.'), 1));
			$mime = $this->request->get['filetype'];
			
			//check file ext and mime
			if (!in_array($ext, $allowed_ext) || ($mime && $allowed_mime[$ext] && !in_array($mime, $allowed_mime[$ext]))) {
				$json['error'] = sprintf($this->language->get('error_filetype'), implode(", ", $allowed_ext));
			}

			//check file size
			if($this->request->get['filesize'] > $copu_max_filesize * 1024) {
				$json['error'] = sprintf($this->language->get('error_filesize'), formatFilesize($copu_max_filesize * 1024));
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
		$ssl = isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] : false;

		$this->load->language('myoc/copu');
		$this->load->model('myoc/copu');
		$this->load->model('tool/upload');

		$type = $this->request->get['type'];

		$type_id = isset($this->request->get['type_id']) ? $this->request->get['type_id'] : false;
		$product_option_id = isset($this->request->get['product_option_id']) ? $this->request->get['product_option_id'] : false;
		$copu_product_id = isset($this->request->get['copu_product_id']) ? $this->request->get['copu_product_id'] : false;
		$session = isset($this->request->get['session']) ? $this->request->get['session'] : true;

		$copu_products = $this->config->get('copu_products');
		$copu_product = false;
		if($copu_products) {
			foreach ($copu_products as $copu_product_value) {
				if($copu_product_id && $copu_product_value['copu_product_id'] == $copu_product_id) {
					$copu_product = $copu_product_value;
					break;
				}
			}
		}

		if($copu_product) {
			$copu_status = $copu_product['status'];
			$copu_stores = isset($copu_product['stores']) ? $copu_product['stores'] : array();
			$copu_login = $copu_product['login'];
			$copu_customer_groups = isset($copu_product['customer_groups']) ? $copu_product['customer_groups'] : array();
			$copu_limit = $copu_product['limit'];
			$copu_filetypes = isset($copu_product['filetypes']) ? $copu_product['filetypes'] : array();
			$copu_max_filesize = $copu_product['max_filesize'];
			$copu_max_dimension_w = $copu_product['max_dimension_w'];
			$copu_max_dimension_h = $copu_product['max_dimension_h'];
			$copu_image_channel = $copu_product['image_channel'];
			$copu_max_filename_length = $copu_product['max_filename_length'];
			$copu_file_location = empty($copu_product['file_location']) ? "" : "../" . $copu_product['file_location'] . "/";
			$copu_preview = $copu_product['preview'];
			$copu_replace = $copu_product['replace'];
			$copu_preview_dimension_w = $copu_product['preview_dimension_w'];
			$copu_preview_dimension_h = $copu_product['preview_dimension_h'];
		} else {
			$copu_status = $this->config->get('copu_' . $type . '_status');
			$copu_stores = $this->config->get('copu_' . $type . '_stores');
			$copu_login = $this->config->get('copu_' . $type . '_login');
			$copu_customer_groups = $this->config->get('copu_' . $type . '_customer_groups');
			$copu_limit = $this->config->get('copu_' . $type . '_limit');
			$copu_filetypes = $this->config->get('copu_' . $type . '_filetypes');
			$copu_max_filesize = $this->config->get('copu_' . $type . '_max_filesize');
			$copu_max_dimension_w = $this->config->get('copu_' . $type . '_max_dimension_w');
			$copu_max_dimension_h = $this->config->get('copu_' . $type . '_max_dimension_h');
			$copu_image_channel = $this->config->get('copu_' . $type . '_image_channel');
			$copu_max_filename_length = $this->config->get('copu_' . $type . '_max_filename_length');
			$copu_file_location = $this->config->get('copu_' . $type . '_file_location') ? "../" . $this->config->get('copu_' . $type . '_file_location')  . "/": "";
			$copu_preview = $this->config->get('copu_' . $type . '_preview');
			$copu_preview_dimension_w = $this->config->get('copu_' . $type . '_preview_dimension_w');
			$copu_preview_dimension_h = $this->config->get('copu_' . $type . '_preview_dimension_h');
			$copu_replace = false;
		}

		if(!empty($copu_file_location)) {
			if(strpos($copu_file_location, '%customer_id%')) {
				if($this->customer->isLogged()) {
					$copu_file_location = str_replace('%customer_id%', $this->customer->isLogged(), $copu_file_location);
				} else {
					$copu_file_location = "";
				}
			}
			if(strpos($copu_file_location, '%product_id%') && $type == 'product' && $type_id) {
				$copu_file_location = str_replace('%product_id%', $type_id, $copu_file_location);
			}
			if(strpos($copu_file_location, '%order_id%')) {
				if($type == 'order' && $type_id && !$session) {
					$copu_file_location = str_replace('%order_id%', $type_id, $copu_file_location);
				} else {
					$copu_file_location = "";
				}				
			}
		}
		if(!empty($copu_file_location) && !file_exists(DIR_UPLOAD . $copu_file_location)) {
			mkdir(DIR_UPLOAD . $copu_file_location, 0755, true);
		}

		$json = array();

		//create upload session
		if(!isset($this->session->data['copu_' . $type . '_uploads']) && $session) {
			$this->session->data['copu_' . $type . '_uploads'] = array();
		}
		if($type == 'product' && $type_id && !isset($this->session->data['copu_' . $type . '_uploads'][$type_id])) {
			$this->session->data['copu_' . $type . '_uploads'][$type_id] = array();
		}
		if($type == 'product' && $type_id && $product_option_id && !isset($this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id])) {
			$this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id] = array();
		}
		//check status and store
		if(!$copu_status || $copu_stores == "" || !in_array($this->config->get('config_store_id'), $copu_stores)) {
			$json['error'] = $this->language->get('error_upload_status');
			$this->response->setOutput(json_encode($json));
			return;
		}

		//check login
		if($copu_login && ($session xor $type == 'customer') && (!$this->customer->isLogged() || !$copu_customer_groups || !in_array($this->customer->getGroupId(), $copu_customer_groups))) {
			$json['error'] = $this->language->get('error_login');
			$this->response->setOutput(json_encode($json));
			return;
		}

		//check file limit
		$upload_total = 0;
		if($type != 'product' && isset($this->session->data['copu_' . $type . '_uploads'])) {
			$upload_total = count($this->session->data['copu_' . $type . '_uploads']);
		}
		if($type == 'product' && $this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id]) {
			$upload_total = count($this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id]);
		}
		if(!$session) {
			if($type == 'customer') {
				$type_id = $this->customer->isLogged();
			}
			$upload_total = $this->model_myoc_copu->getTotalUploads(array('type' => $type, 'type_id' => $type_id));
		}
		if($upload_total >= $copu_limit) {
			$json['error'] = $this->language->get('error_limit');
			$this->response->setOutput(json_encode($json));
			return;
		}

		$filetypes = $this->model_myoc_copu->getFiletypes($copu_filetypes);
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8');

			if ((strlen($filename) < 3) || (strlen($filename) > 64)) {
				$json['error'] = $this->language->get('error_filename');
			}
			
			$allowed_ext = array();
			$allowed_mime = array();
			
			foreach ($filetypes as $filetype) {
				$allowed_ext[] = trim($filetype['ext']);
				$allowed_mime[trim($filetype['ext'])] = ($filetype['mime'] == '') ? false : explode(",", $filetype['mime']);
			}

			$ext = strtolower(substr(strrchr($filename, '.'), 1));
			$mime = function_exists('mime_content_type') ? mime_content_type($this->request->files['file']['tmp_name']) : false;
			
			//check file ext and mime
			if (!in_array($ext, $allowed_ext) || ($mime && $allowed_mime[$ext] && !in_array($mime, $allowed_mime[$ext]))) {
				$json['error'] = sprintf($this->language->get('error_filetype'), implode(", ", $allowed_ext));
			}

			//check file size
			if(filesize($this->request->files['file']['tmp_name']) > $copu_max_filesize * 1024) {
				$json['error'] = sprintf($this->language->get('error_filesize'), formatFilesize($copu_max_filesize * 1024));
			}
				
			if(is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$imageinfo = @getimagesize($this->request->files['file']['tmp_name']);
				if($imageinfo[2] > 0 && $imageinfo[2] < 4 ) {
					//check image file dimension
					if($copu_max_dimension_w && $copu_max_dimension_h && ($imageinfo[0] > $copu_max_dimension_w || $imageinfo[1] > $copu_max_dimension_h)) {
						$json['error'] = sprintf($this->language->get('error_dimension'), $copu_max_dimension_w, $copu_max_dimension_h);
					}
					//check image channel
					if($copu_image_channel && (isset($imageinfo['channels']) ? $imageinfo['channels'] : false) != $copu_image_channel) {
						$channel = '';
						if($copu_image_channel == 3) {
							$channel = $this->language->get('text_rgb');
						}
						if($copu_image_channel == 4) {
							$channel = $this->language->get('text_cmyk');
						}
						$json['error'] = sprintf($this->language->get('error_image_channel'), $channel);
					}
				}
			}

			//check other system upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] = sprintf($this->language->get('error_filetype'), implode(", ", $allowed_ext));
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!$json) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$upload_id = function_exists('token') ? token(32) : md5(mt_rand());
				$file = $filename . '.' . $upload_id;

				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD . $copu_file_location . $file);
				
				if(method_exists($this->encryption, 'encrypt')) {
					$encryption = $this->encryption;
				} else {
					$this->load->library('encryption');
				 	$encryption = new Encryption($this->config->get('config_encryption'));
				}
				if(!$session) {
					$json['code'] = $this->model_tool_upload->addUpload($filename, $copu_file_location . $file);
					$upload_info = $this->model_tool_upload->getUploadByCode($json['code']);
					$upload_id = $this->model_myoc_copu->addUpload(array('filename' => $copu_file_location . $file, $type . '_id' => $type_id, 'upload_id' => $upload_info['upload_id']));

					if($type == 'order' && $this->config->get('copu_order_history_modify_status')) {
						$this->load->model('checkout/order');
						$order_info = $this->model_checkout_order->getOrder($type_id);
						if($order_info['order_status_id'] > 0) {
							$this->model_checkout_order->addOrderHistory($type_id, $this->config->get('copu_order_history_modify_status'), $this->language->get('text_uploaded') . ' ' . $filename, true);
						}
					}
				} elseif($type == 'product' && $type_id && $product_option_id) {
					$json['code'] = $this->model_tool_upload->addUpload($filename, $copu_file_location . $file);
					$this->session->data['copu_' . $type . '_uploads'][$type_id][$product_option_id][$upload_id] = $json['code'];//$encryption->encrypt($copu_file_location . $file);
				} else {
					$this->session->data['copu_' . $type . '_uploads'][$upload_id] = $encryption->encrypt($copu_file_location . $file);
				}
				$this->load->model('tool/image');

				$image = false;
				$popup = false;
				$replace = false;
				if(($copu_preview || $copu_replace) && $file && filesize(DIR_UPLOAD . $copu_file_location . $file)) {
					$imageinfo = @getimagesize(DIR_UPLOAD . $copu_file_location . $file);
					if($imageinfo[2] > 0 && $imageinfo[2] < 4) {
						$random_str = md5($upload_id);
						copy(DIR_UPLOAD . $copu_file_location . $file, DIR_IMAGE . $random_str . $filename);
						$image = $copu_preview ? $this->model_tool_image->resize($random_str . $filename, $copu_preview_dimension_w, $copu_preview_dimension_h) : false;
						$popup = ($copu_preview || $copu_replace) ? $this->model_tool_image->resize($random_str . $filename, $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')) : false;
						$replace = ($type == 'product' && $copu_replace) ? $this->model_tool_image->resize($random_str . $filename, $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')) : false;
						unlink(DIR_IMAGE . $random_str . $filename);
					} else {
						$image = $copu_preview ? $this->model_tool_image->resize('no_image.png', $copu_preview_dimension_w, $copu_preview_dimension_h) : false;
					}
				}

				$json['file'] = array();
				$json['file']['upload_id'] = $upload_id;
				$json['file']['image'] = $image;
				$json['file']['popup'] = $popup;
				$json['file']['replace'] = $replace;
				$json['file']['name'] = truncateFilename($filename, $copu_max_filename_length);
				$json['file']['href'] = $this->url->link('myoc/copu/download', 'f=' . urlencode($encryption->encrypt($copu_file_location . $file)), $ssl);
				$json['file']['date'] = date($this->language->get('date_format_short'));
				$json['file']['size'] = formatFilesize($this->request->files['file']['size']);

				$json['file']['delete'] = $this->url->link('myoc/copu/delete', 'upload_id=' . $upload_id, $ssl);
			}

			$json['success'] = true;
		}	
		
		$this->response->setOutput(json_encode($json));		
	}

	public function download() {
		if(method_exists($this->encryption, 'encrypt')) {
			$encryption = $this->encryption;
		} else {
			$this->load->library('encryption');
		 	$encryption = new Encryption($this->config->get('config_encryption'));
		}
		$filename = $encryption->decrypt($this->request->get['f']);
		$mask = myoc_basename(substr($filename, 0, strrpos($filename, '.')));
		if(strpos($_SERVER['HTTP_USER_AGENT'], 'Trident')) {
			$mask = urlencode($mask);
		}
		if (file_exists(DIR_UPLOAD . $filename)) {
			if (!headers_sent()) {
				header('Content-Type: application/octet-stream');
				header('Content-Description: File Transfer');
				header('Content-Disposition: attachment; filename="' . $mask . '"');
				header('Content-Transfer-Encoding: binary');
				header('Expires: 0');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: public');
				header('Content-Length: ' . filesize(DIR_UPLOAD . $filename));
				
				readfile(DIR_UPLOAD . $filename, 'rb');

				exit;
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			exit('Error: Could not find file ' . DIR_UPLOAD . $filename . '!');
		}
	}

	public function delete() {
        $upload_id = $this->request->get['upload_id'];
        
        $this->load->language('myoc/copu');
        $this->load->model('tool/upload');
        $this->load->model('myoc/copu');

	    $json = array();
	    $json['error'] = $this->language->get('error_delete');

		if(method_exists($this->encryption, 'encrypt')) {
			$encryption = $this->encryption;
		} else {
			$this->load->library('encryption');
		 	$encryption = new Encryption($this->config->get('config_encryption'));
		}
		if(isset($this->session->data['copu_customer_uploads'][$upload_id])) {
			if(file_exists(DIR_UPLOAD . $encryption->decrypt($this->session->data['copu_customer_uploads'][$upload_id]))) {
				unlink(DIR_UPLOAD . $encryption->decrypt($this->session->data['copu_customer_uploads'][$upload_id]));
	            $json['success'] = true;
	            unset($json['error']);
	        }
			unset($this->session->data['copu_customer_uploads'][$upload_id]);
		} elseif(isset($this->session->data['copu_order_uploads'][$upload_id])) {
            if(file_exists(DIR_UPLOAD . $encryption->decrypt($this->session->data['copu_order_uploads'][$upload_id]))) {
            	unlink(DIR_UPLOAD . $encryption->decrypt($this->session->data['copu_order_uploads'][$upload_id]));
	            $json['success'] = true;
	            unset($json['error']);
	        }
			unset($this->session->data['copu_order_uploads'][$upload_id]);
		} elseif(isset($this->session->data['copu_product_uploads']) && !empty($this->session->data['copu_product_uploads'])) {
			foreach ($this->session->data['copu_product_uploads'] as $product_id => $product_uploads) {
				foreach ($product_uploads as $product_option_id => $product_upload) {
					if(isset($this->session->data['copu_product_uploads'][$product_id][$product_option_id][$upload_id])) {
						$upload_info = $this->model_tool_upload->getUploadByCode($this->session->data['copu_product_uploads'][$product_id][$product_option_id][$upload_id]);
						unset($this->session->data['copu_product_uploads'][$product_id][$product_option_id][$upload_id]);
						$this->model_myoc_copu->deleteUpload($upload_info['upload_id']);
						if(file_exists(DIR_UPLOAD . $upload_info['filename'])) {
							unlink(DIR_UPLOAD . $upload_info['filename']);
							$json['success'] = true;
							unset($json['error']);
						}
				        break 2;
					}
				}
			}
		}
		if(isset($json['error'])) {
			$this->load->model('myoc/copu');
	    	$upload = $this->model_myoc_copu->getUpload($upload_id);
	        if($upload && $upload['customer_id'] == $this->customer->isLogged())
	        {
	        	$this->model_myoc_copu->deleteUpload($upload_id);
		        if(file_exists(DIR_UPLOAD . $upload['filename']))
		        {
		            unlink(DIR_UPLOAD . $upload['filename']);
		            $json['success'] = true;
		            unset($json['error']);
		        }
		    }
		}

        $this->response->setOutput(json_encode($json));
	}
}
?>