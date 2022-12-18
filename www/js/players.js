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

function join_x_party() {
    $.ajax({
        url: "dominoes.php/players/",
        method: 'GET',
        dataType: "json",
        contentType: 'application/json',
        data: { partyid: this.partyid },
        //data: JSON.stringify({ partyid: partyid }),
        success: success_join_x_party,
    });
}

function success_join_x_party(data) {
    alert('success_join_x_party');
    var d;
    const label = document.createElement("label");
    label.innerText = 'Party id: '+data[0].partyid;
    label.id=data[0].partyid;
    label.style.textAlign= 'center';
    label.style.display='block';
    document.getElementById("wrap4").appendChild(label);
    for (var i = 0; i < data.length; i++) {
        d = data[i];
        const tr = document.createElement("tr");
        tr.innerHTML = '<tr> <td>' + d.id + '</td> <td>' + d.username + '</td> </tr>';
        document.getElementById("party_table").appendChild(tr);
    }
}

