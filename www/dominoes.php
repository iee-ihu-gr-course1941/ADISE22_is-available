<?php

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
		break;
	default:
		header("HTTP/1.1 404 Not Found");
		exit;
}
{
	if ($method == 'GET') {
	}
}
	}
}
?>