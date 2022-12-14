<?php
function handle_game($method, $input)
{
	if ($method == 'POST') {
		create_game($input);
	}
	if ($method == 'PUT') {
		moirasma($input);
	}
}
function create_game($input)
{ //POST
	global $mysqli;

	//id of game
	$sql = 'SELECT COUNT(id) as c FROM game';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	$r[0]['c']++;

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

	//dimiourgia party
	$sql = 'INSERT INTO game (id, partyid) VALUES (?, ?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$r[0]['c'],$partyid);
	$st->execute();

	//
	$sql = 'SELECT id,partyid FROM game where id=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$r[0]['c']);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
function moirasma($input)
{ //PUT
    global $mysqli;
    $partyid = $input['partyid'];
	$gameid = $input['gameid'];

	$sql = 'call moirasma(?, ?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$gameid,$partyid);
	$st->execute();

	$sql = 'CALL megaliteroi_idioi_ariumi(?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$gameid);
	$st->execute();

	$sql = 'SELECT count(playerid) FROM game where id=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$gameid);
	$st->execute();
	$res = $st->get_result();
	$r1 = $res->fetch_all(MYSQLI_ASSOC);
	if (($r1[0]['count(playerid)'] == 0)) {
        $sql = 'CALL max_podi(?)';
		$st = $mysqli->prepare($sql);
		$st->bind_param('i',$gameid);
		$st->execute();
    }

	$sql = 'SELECT playerid FROM game where id=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$gameid);
	$st->execute();
	$res = $st->get_result();
	$r2 = $res->fetch_all(MYSQLI_ASSOC);

	$sql = 'CALL emfanise_ta_plakidia_toy_pekti(?, ?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$gameid,$r2);
	$st->execute();

	$sql = 'SELECT tempcolumn FROM temp';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>