function login() {
    if (document.getElementById("username").value == '') {
        alert('You have to set a username');
        return;
    }
    $.ajax({
        url: "dominoes.php/players/",
        method: 'PUT',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ username: document.getElementById("username").value }),
        success: success_login,
        error: error_players
    });
}

function success_login() {
    alert('success_login');
    document.getElementById("wrap2").style.display = "none";
    document.getElementById("wrap3").style.display = "block";
    get_parties();
}

function create_account() {
    if (document.getElementById("username").value == '') {
        alert('You have to set a username');
        return;
    }
    $.ajax({
        url: "dominoes.php/players/",
        method: 'POST',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ username: document.getElementById("username").value }),
        success: success_create_account,
        error: error_players
    });
}

function success_create_account() {
    alert('success_create_account');
}

function error_players(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
    document.getElementById("username").value="";
}