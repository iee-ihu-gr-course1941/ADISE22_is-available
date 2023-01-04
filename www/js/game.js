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
    alert('success_game');
    document.getElementById("wrap4").style.display = "none"
    document.getElementById("wrap5").style.display = "block"
    
    document.getElementById("lid").innerText='Game id: '+data[0].gameid;
    document.getElementById("lid").id=data[0].gameid;

    board(data);
}

function domino(this_id,gameid) { 
    $.ajax({
        url: "dominoes.php/game/",
        method: 'PUT',
        dataType: "json",
        contentType: 'application/json',
        data: JSON.stringify({ dominoid: this_id,gameid: gameid }),
        success: success_domino,
        error: error_game
    });
}

function success_domino(data) {
    alert("success_domino");
    var x = data.responseJSON;
    if (x!=null){
        alert(x.successmesg);
    }
    board(data); 
}

function error_game(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}

function boneyard(game) {
    $.ajax({
        url: "dominoes.php/game/",
        method: 'GET',
        dataType: "json",
        contentType: 'application/json',
        data: { gameid: game},
        success: success_boneyard,
        error: error_game
    });
}

function success_boneyard(data) {
    alert("success_boneyard");
    board(data); 
}

function board(data) {
    document.getElementById("tr").innerHTML="";
    document.getElementById("tr1").innerHTML="";
    document.getElementById("tr2").innerHTML='';

    const td2 = document.createElement("td");
    td2.innerHTML='&#127074;';
    td2.onclick = function() { 
        boneyard(document.getElementById(data[0].gameid).id)
    };
    document.getElementById("tr2").appendChild(td2);

    var i;
    for (i = 0; i < data[1].tempcolumn; i++) {
        const td1 = document.createElement("td");
        td1.innerHTML = '&#127024;';
        document.getElementById("tr1").appendChild(td1);
    }
    flag=false;
    for (i = 2; i < data.length; i++) {
        const td = document.createElement("td");
        if (data[i].tempcolumn!=-1 & !flag){
            td.id=data[i].tempcolumn;
            td.onclick = function() { domino(this.id,document.getElementById(data[0].gameid).id); };
        }else{
            flag=true;
        }

        if (data[i].tempcolumn.toString().length==3 || data[i].tempcolumn.toString().length==4){
            td.innerHTML = '&#127025;';
        }

        if (data[i].tempcolumn.toString().substring(0,2)=='0'){
            td.innerHTML = '&#127025;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='10'){
            td.innerHTML = '&#127032;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127026;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='11'){
            td.innerHTML = '&#127033;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='20'){
            td.innerHTML = '&#127039;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127027;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='21'){
            td.innerHTML = '&#127040;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127034;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='22'){
            td.innerHTML = '&#127041;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='30'){
            td.innerHTML = '&#127046;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127028;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='31'){
            td.innerHTML = '&#127047;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127035;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='32'){
            td.innerHTML = '&#127048;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127042;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='33'){
            td.innerHTML = '&#127049;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='40'){
            td.innerHTML = '&#127053;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127029;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='41'){
            td.innerHTML = '&#127054;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127036;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='42'){
            td.innerHTML = '&#127055;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127043;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='43'){
            td.innerHTML = '&#127056;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127050;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='44'){
            td.innerHTML = '&#127057;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='50'){
            td.innerHTML = '&#127060;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127030;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='51'){
            td.innerHTML = '&#127061;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127037;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='52'){
            td.innerHTML = '&#127062;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127044;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='53'){
            td.innerHTML = '&#127063;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127051;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='54'){
            td.innerHTML = '&#127064;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127058;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='55'){
            td.innerHTML = '&#127065;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn.toString().substring(0,2)=='60'){
            td.innerHTML = '&#127067;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127031;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='61'){
            td.innerHTML = '&#127068;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127038;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='62'){
            td.innerHTML = '&#127069;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127045;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='63'){
            td.innerHTML = '&#127070;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127052;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='64'){
            td.innerHTML = '&#127071;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127059;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='65'){
            td.innerHTML = '&#127072;';
            if (data[i].tempcolumn.toString().charAt(4)=='1'|| data[i].tempcolumn.toString().length==6 && data[i].tempcolumn.toString().charAt(5)=='1'){
                td.innerHTML = '&#127066;';
            }
        }
        if (data[i].tempcolumn.toString().substring(0,2)=='66'){
            td.innerHTML = '&#127073;';
        }
        if (!flag){
            document.getElementById("tr").appendChild(td);
        }else if (td.innerHTML!=''){
            document.getElementById("tr2").appendChild(td);
        }
    }
}