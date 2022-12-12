function start_game(partyid) { 
    $.ajax({
        url: "dominoes.php/game/",
        method: 'POST',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ partyid: partyid }),
        success: success_game,
        error: error_game
    });
}
function success_game(data) {
    //alert('success_game');
    partyid=data[0].partyid;
    gameid=data[0].id;
    alert('success_game');
    moirasma();
}
function error_game(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}
function moirasma(){
    $.ajax({
        url: "dominoes.php/game/",
        method: 'PUT',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ partyid:this.partyid, gameid:this.gameid }),
        success: success_moirasma,
        error: error_game
    });
}
function success_moirasma(data) {
    alert('success_moirasma');
    //TO DO
    /*var d;
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
    }*/
}
