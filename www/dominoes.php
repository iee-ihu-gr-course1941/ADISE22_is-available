<?php
require_once "../lib/dbconnect.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

switch ($r = array_shift($request)) {
	case 'players':
		handle_player($method, $input);
		break;
	default:
		header("HTTP/1.1 404 Not Found");
		exit;
}
function handle_player($method, $input)
{
	if ($method == 'GET') {
		set_player($input);
	}
}

function set_player($input)
{//GET
	global $mysqli;
	$sql = 'select * from players where username=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s', $input);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


//////////////////////////////////////////////////////////////////////////////////////////////////
function show_user($aitisi)
{ //GET
	global $mysqli;
	$sql = 'select username,piece_color from players where piece_color=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s', $aitisi);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function set_user($aitisi, $input)
{ //PUT
	//print_r($input);
	if (!isset($input['username']) || $input['username'] == '') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => "No username given."]);
		exit;
	}
	$username = $input['username'];
	global $mysqli;
	$sql = 'select count(*) as c from players where piece_color=? and username is not null';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s', $aitisi);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	if ($r[0]['c'] > 0) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg' => "Player $aitisi is already set. Please select another color."]);
		exit;
	}
	$sql = 'update players set username=?, token=md5(CONCAT( ?, NOW()))  where piece_color=?';
	$st2 = $mysqli->prepare($sql);
	$st2->bind_param('sss', $username, $username, $aitisi);
	$st2->execute();

	$sql = 'select * from players where piece_color=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s', $aitisi);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}
?>