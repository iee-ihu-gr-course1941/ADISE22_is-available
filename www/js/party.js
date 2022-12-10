function get_parties() {
    $.ajax({
        url: "dominoes.php/party/",
        method: 'GET',
        success: success_get_parties
    });
}

function success_get_parties(data) {
    alert('get_party');
    for (var i = 0; i < data.length; i++) {
        var d = data[i];
        const tr = document.createElement("tr");
        tr.innerHTML = '<tr> <td>' + d.id + '</td> <td>' + d.x + '</td> <td><button id="'+d.id+'" onClick=join_party(this.id)>Join</button></td> </tr>';
        document.getElementById("party_table").appendChild(tr);
    }
}
////////////////////////////////////////////
function join_party(this_id) { 
    $.ajax({
        url: "dominoes.php/party/",
        method: 'PUT',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ username: document.getElementById("username").value, id: this_id}),
        success: success_join_party,
        error: error_party
    });
}
////////////////////////////////////////////
function create_party() {
    $.ajax({
        url: "dominoes.php/party/",
        method: 'POST',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ username: document.getElementById("username").value }),
        success: success_join_party,
        error: error_party
    });
}

function success_join_party() {
    alert('success_join_party');
    document.getElementById("wrap3").style.display = "none";
    document.getElementById("wrap4").style.display = "block";
    //TO_DO
    /*$("#party_table tr td").remove();
    get_parties();*/
}

function error_party(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}
