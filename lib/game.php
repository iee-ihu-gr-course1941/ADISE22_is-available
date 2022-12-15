<?php
function handle_game($method, $input)
{
	if ($method == 'POST') {
		create_game($input);
	}
}
function create_game($input)//alages
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
?>