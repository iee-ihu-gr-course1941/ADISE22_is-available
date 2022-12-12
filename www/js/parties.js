function get_parties() {
    $.ajax({
        url: "dominoes.php/parties/",
        method: 'GET',
        success: success_get_parties
    });
}

function success_get_parties(data) {
    alert('success_get_parties');
    for (var i = 0; i < data.length; i++) {
        var d = data[i];
        const tr = document.createElement("tr");
        tr.innerHTML = '<tr> <td>' + d.id + '</td> <td>' + d.x + '</td> <td><button id="'+d.id+'" onClick=join_party(this.id)>Join</button></td> </tr>';
        document.getElementById("parties_table").appendChild(tr);
    }
}
