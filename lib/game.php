<?php
function handle_game($method, $input)
{
	if ($method == 'POST') {
		create_game($input);
	}
	if ($method == 'PUT') {
		domino($input);
	}
	if ($method == 'GET') {
		boneyard();
	}
}
function create_game($input)
{ //POST
	global $mysqli;

	//id of party
    $partyid=$input['partyid'];

	//elexos an oi players einai >2
	$sql = 'select count(playerid) FROM party where id=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$partyid);
	$st->execute();
	$res = $st->get_result();
	$r1 = $res->fetch_all(MYSQLI_ASSOC);
	if ($r1[0]['count(playerid)'] < 2) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "Party < 2"]);
        exit;
    }

	$sql = 'CALL start_game(?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$partyid);
	$st->execute();

	$sql = 'SELECT * FROM temp';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function domino($input)
{//PUT
	global $mysqli;

	//id of party
    $dominoid=$input['dominoid'];
	$gameid=$input['gameid'];

	$sql = 'SELECT id FROM dominoes where domino=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$dominoid);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);

	$sql = 'CALL domino(?, ?,@kati);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$gameid,$r[0]['id']);
	$st->execute();

	$sql = 'SELECT @kati';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	if($r[0]['@kati']=="wrong"){
		header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "wrong"]);
        exit;
	}
	

	$sql = 'SELECT * FROM temp';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

	if($r[0]['@kati']!="ok"){
		header('Content-type: application/json');
        print json_encode(['successmesg' => "winner ".$r[0]['@kati']]);
        exit;
	}
}
function boneyard()
{
	global $mysqli;

	//id of game
	$gameid = $_GET['gameid'];
	//$gameid=$input['gameid'];

	$sql = 'CALL boneyard(?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$gameid,);
	$st->execute();

	$sql = 'SELECT * FROM temp';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>