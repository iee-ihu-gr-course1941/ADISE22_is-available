<?php
require_once "../lib/dbconnect.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));
$input = json_decode(file_get_contents('php://input'), true);

/*print_r($_SERVER );
echo $method;
echo "</br>";  
echo $request;
echo "</br>";  
echo $input;*/

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
	if ($method == 'PUT') {
		set_player($method,$input);
	} if ($method == 'POST') {
		player($method,$input);
	} 
}

function set_player($method,$input)
{ //PUT
	global $mysqli;
	$username=$input['username'];
	$sql = 'select count(*) as c from `ADISE22_is-available_v2`.players where username=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$username);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	if ($r[0]['c'] == 0) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"User doesnt exist"]);
		exit;
	}
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function player($method,$input)
{ //POST
	global $mysqli;

	$username=$input['username'];

	$sql = 'select count(*) as c from players where username=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$username);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	if ($r[0]['c'] == 1) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"User already exist"]);
		exit;
	}

	$sql = 'select count(*) as c from players';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	$r[0]['c']++;



	$token = openssl_random_pseudo_bytes(16);
	$token = bin2hex($token);

	$sql = 'INSERT INTO players (id, username, token) VALUES (?, ?,?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iss',$r[0]['c'],$username,$token );
	$st->execute();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


//////////////////////////////////////////////////////////////////////////////////////////////////
/*function handle_player($method, $request,$input) {
    switch ($kati1=array_shift($request)) {
	//	case '':
	//	case null: if($method=='GET') {show_users($method);}
	//			   else {header("HTTP/1.1 400 Bad Request"); 
	//					 print json_encode(['errormesg'=>"Method $method not allowed here."]);}
    //                break;
        case 'B': 
		case 'W': handle_user($method, $kati1,$input);
					break;
		default: header("HTTP/1.1 404 Not Found");
				 print json_encode(['errormesg'=>"Player $kati1 not found."]);
                 break;
	}
}
function handle_user($method, $kati1,$input) {
	if($method=='GET') {
		show_user($kati1);
	} else if($method=='PUT') {
        set_user($kati1,$input);
    }
}
function set_user($kati1,$input) {
	//print_r($input);
	if(!isset($input['username']) || $input['username']=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"No username given."]);
		exit;
	}
	$username=$input['username'];
	global $mysqli;
	$sql = 'select count(*) as c from players where piece_color=? and username is not null';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$kati1);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	if($r[0]['c']>0) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Player $kati1 is already set. Please select another color."]);
		exit;
	}
	$sql = 'update players set username=?, token=md5(CONCAT( ?, NOW()))  where piece_color=?';
	$st2 = $mysqli->prepare($sql);
	$st2->bind_param('sss',$username,$username,$kati1);
	$st2->execute();


	$sql = 'select * from players where piece_color=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$b);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
	
	
}*/
?>