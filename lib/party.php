<?php
function handle_party($method, $input)
{
	if ($method == 'GET') {
		get_party();
	} 
	if ($method == 'POST') {
		create_party($input);
	}
	if ($method == 'PUT') {
		join_party($input);
	}
}

function get_party()
{ //GET
	global $mysqli;
	$sql = 'SELECT id,COUNT(playerid) as x FROM party GROUP BY id;';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function create_party($input)
{ //POST
	global $mysqli;

	$username=$input['username'];

	//id of party
	$sql = 'SELECT COUNT(DISTINCT id) as c FROM party';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);
	$r[0]['c']=$r[0]['c']+11;

	//id of player
	$sql = 'select id FROM players where username=?;';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$username);
	$st->execute();
	$res = $st->get_result();
	$r1 = $res->fetch_all(MYSQLI_ASSOC);

	//elexos an o xristis exi party
	$sql = 'select count(*) FROM party where playerid=?;';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$r1[0]['id']);
	$st->execute();
	$res = $st->get_result();
	$r2 = $res->fetch_all(MYSQLI_ASSOC);
	if ($r2[0]['count(*)'] == 1) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "User has a party"]);
        exit;
    }

	//dimiourgia party
	$sql = 'INSERT INTO party (id, playerid) VALUES (?, ?)';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$r[0]['c'],$r1[0]['id'] );
	$st->execute();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function join_party($input)
{ //PUT
    global $mysqli;
    $username = $input['username'];
	$id = $input['id'];

	//id of player
	$sql = 'select id FROM players where username=?;';
	$st = $mysqli->prepare($sql);
	$st->bind_param('s',$username);
	$st->execute();
	$res = $st->get_result();
	$r = $res->fetch_all(MYSQLI_ASSOC);

	//elexos an o xristis exi party
	$sql = 'select count(*) FROM party where playerid=?;';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$r[0]['id']);
	$st->execute();
	$res = $st->get_result();
	$r2 = $res->fetch_all(MYSQLI_ASSOC);
	if ($r2[0]['count(*)'] == 1) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "User has a party"]);
        exit;
    }

    $sql = 'INSERT INTO party (id, playerid) VALUES (?, ?)';
    $st = $mysqli->prepare($sql);
    $st->bind_param('ii',$id, $r[0]['id']);
    $st->execute();
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>