<?php

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
	case 'board':
		switch ($b = array_shift($request)) {
			case '':
			case null:
				handle_board($method, $input);
				break;
			case 'piece':
				handle_piece($method, $request[0], $request[1], $input);
				break;
			default:
				header("HTTP/1.1 404 Not Found");
				break;
		}
		break;
	default:
		header("HTTP/1.1 404 Not Found");
		exit;
}
function handle_board($method, $input)
{
	if ($method == 'GET') {
		show_board($input);
	} else if ($method == 'POST') {
		reset_board();
		show_board($input);
	} else {
		header('HTTP/1.1 405 Method Not Allowed');
	}
}
function handle_piece($method, $x, $y, $input)
{
	if ($method == 'GET') {
		show_piece($x, $y);
	} else if ($method == 'PUT') {
		move_piece(
			$x,
			$y, $input['x'], $input['y'],
			$input['token']
		);
	}
}
?>