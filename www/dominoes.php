<?php
require_once "../lib/dbconnect.php";
require_once "../lib/players.php";
require_once "../lib/party.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
	case 'party':
		handle_party($method, $input);
		break;
	case 'players':
		handle_player($method, $input);
		break;
	default:
		header("HTTP/1.1 404 Not Found");
		exit;
}
?>