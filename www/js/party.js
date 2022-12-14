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

function success_join_party(data) {
    alert('success_join_party');
    document.getElementById("wrap3").style.display = "none";
    document.getElementById("wrap4").style.display = "block";
    partyid=data[0].id;
    join_x_party();
}

function error_party(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}
////////////////////////////////////////////
function join_x_party() {
    $.ajax({
        url: "dominoes.php/party/",
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