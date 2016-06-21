<?php
function formatFilesize($size = 0) {
	$i = 0;

	$suffix = array(
		'B',
		'KB',
		'MB',
		'GB',
		'TB'
	);

	while (($size / 1024) >= 1) {
		$size = $size / 1024;
		$i++;
	}

	return round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i];
}

function truncateFilename($filename, $length) {
	$extension = substr(strrchr($filename, '.'), 1);
	$filename = myoc_basename($filename, '.' . $extension);
	if (strlen($filename) > $length) {
		return (substr($filename, 0, $length) . '...' . $extension);
	}
	return $filename . '.' . $extension;
}

function myoc_basename($path, $suffix = "") {
	$exploded_path = explode('/', $path);
	$onlyfilename = end($exploded_path);

	if(!empty($suffix)) {
		if(is_string($suffix)) {
			if(strpos($onlyfilename, $suffix, 0) !== false) {
				$onlyfilename = str_replace($suffix, "", $onlyfilename);
			}
		} else if(is_array($suffix)) {
			// works with PHP version <= 5.x.x 
			foreach( $suffix as $key => $suffix )
			{
				$onlyfilename = str_replace($suffix, "", $onlyfilename);
			}
		}
	}
	return $onlyfilename;
}
?>