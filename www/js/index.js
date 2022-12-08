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
        method: 'POST',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ username: document.getElementById("username").value }),
        success: login_result,
        error: login_error
    });
}
function login_result() {
    alert('success');
    document.getElementById("wrap3").style.display = "block"
}

function login_error(data, y, z, c) {
    alert('error');
    var x = data.responseJSON;
    alert(x.errormesg);
}

function create() { }