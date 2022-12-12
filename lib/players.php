<?php
function handle_players($method, $input)
{
    if ($method == 'PUT') {
        login($input);
    }
    if ($method == 'POST') {
        create_account($input);
    }
}

function login($input)
{ //PUT
    global $mysqli;
    $username = $input['username'];
    $sql = 'select count(*) as c from players where username=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $username);
    $st->execute();
    $res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
    if ($r[0]['c'] == 0) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "User doesnt exist"]);
        exit;
    }
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function create_account($input)
{ //POST
    global $mysqli;

    $username = $input['username'];

    $sql = 'select count(*) as c from players where username=?';
    $st = $mysqli->prepare($sql);
    $st->bind_param('s', $username);
    $st->execute();
    $res = $st->get_result();
    $r = $res->fetch_all(MYSQLI_ASSOC);
    if ($r[0]['c'] == 1) {
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg' => "User already exist"]);
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
    $st->bind_param('iss', $r[0]['c'], $username, $token);
    $st->execute();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>