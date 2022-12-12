<?php
require_once "../lib/dbconnect.php";
require_once "../lib/players.php";
require_once "../lib/parties.php";
require_once "../lib/party.php";
require_once "../lib/game.php";

$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
	case 'party':
		handle_party($method, $input);
		break;
	case 'parties':
		handle_parties($method, $input);
		break;
	case 'players':
		handle_players($method, $input);
		break;
	case 'game':
		handle_game($method, $input);
		break;
	default:
		header("HTTP/1.1 404 Not Found");
		exit;
}
?>