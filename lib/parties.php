<?php
function handle_parties($method, $input)
{
	if ($method == 'GET') {
		get_parties();
	} 
}

function get_parties()
{ //GET
	global $mysqli;
	$sql = 'SELECT id,COUNT(playerid) as x FROM party GROUP BY id;';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();

	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>