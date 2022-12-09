function play() {
    document.getElementById("wrap").style.display = "none"
    document.getElementById("wrap2").style.display = "block"
}
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
        error: error_login
    });
}
function success_login() {
    alert('success_login');
    document.getElementById("wrap2").style.display = "none"
    document.getElementById("wrap3").style.display = "block"
}
function error_login(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
    document.getElementById("username").value="";
}

function create() {
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
        success: success_create,
        error: error_create
    });
}
function success_create() {
    alert('success_create');
}
function error_create(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
    document.getElementById("username").value="";
}
