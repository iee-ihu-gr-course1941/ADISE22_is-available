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
    //TO DO
    
    document.getElementById("lid").innerText='Game id: '+data[0].gameid;
    document.getElementById("lid").id=data[0].gameid;

    var i;
    for (i = 0; i < data[1].tempcolumn; i++) {
        const td1 = document.createElement("td");//keli
        td1.innerHTML = '&#127024;';
        document.getElementById("tr1").appendChild(td1);
    }
    flag=false;
    for (i = 2; i < data.length; i++) {
        const td = document.createElement("td");//keli
        if (data[i].tempcolumn!=-1 & !flag){
            td.id=data[i].tempcolumn;
            td.onclick = function() { domino(this.id,document.getElementById(data[0].gameid).id); };
        }else{
            flag=true;
        }
        if (data[i].tempcolumn==0){
            td.innerHTML = '&#127025;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==10){
            td.innerHTML = '&#127032;';
        }
        if (data[i].tempcolumn==11){
            td.innerHTML = '&#127033;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==20){
            td.innerHTML = '&#127039;';
        }
        if (data[i].tempcolumn==21){
            td.innerHTML = '&#127040;';
        }
        if (data[i].tempcolumn==22){
            td.innerHTML = '&#127041;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==30){
            td.innerHTML = '&#127046;';
        }
        if (data[i].tempcolumn==31){
            td.innerHTML = '&#127047;';
        }
        if (data[i].tempcolumn==32){
            td.innerHTML = '&#127048;';
        }
        if (data[i].tempcolumn==33){
            td.innerHTML = '&#127049;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==40){
            td.innerHTML = '&#127053;';
        }
        if (data[i].tempcolumn==41){
            td.innerHTML = '&#127054;';
        }
        if (data[i].tempcolumn==42){
            td.innerHTML = '&#127055;';
        }
        if (data[i].tempcolumn==43){
            td.innerHTML = '&#127056;';
        }
        if (data[i].tempcolumn==44){
            td.innerHTML = '&#127057;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==50){
            td.innerHTML = '&#127060;';
        }
        if (data[i].tempcolumn==51){
            td.innerHTML = '&#127061;';
        }
        if (data[i].tempcolumn==52){
            td.innerHTML = '&#127062;';
        }
        if (data[i].tempcolumn==53){
            td.innerHTML = '&#127063;';
        }
        if (data[i].tempcolumn==54){
            td.innerHTML = '&#127064;';
        }
        if (data[i].tempcolumn==55){
            td.innerHTML = '&#127065;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==60){
            td.innerHTML = '&#127067;';
        }
        if (data[i].tempcolumn==61){
            td.innerHTML = '&#127068;';
        }
        if (data[i].tempcolumn==62){
            td.innerHTML = '&#127069;';
        }
        if (data[i].tempcolumn==63){
            td.innerHTML = '&#127070;';
        }
        if (data[i].tempcolumn==64){
            td.innerHTML = '&#127071;';
        }
        if (data[i].tempcolumn==65){
            td.innerHTML = '&#127072;';
        }
        if (data[i].tempcolumn==66){
            td.innerHTML = '&#127073;';
        }
        if (!flag){
            document.getElementById("tr").appendChild(td);
        }else{
            document.getElementById("tr2").appendChild(td);
        }
    }
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
    document.getElementById("tr").innerHTML="";
    document.getElementById("tr1").innerHTML="";
    var i;
    for (i = 0; i < data[1].tempcolumn; i++) {
        const td1 = document.createElement("td");//keli
        td1.innerHTML = '&#127024;';
        document.getElementById("tr1").appendChild(td1);
    }
    flag=false;
    for (i = 2; i < data.length; i++) {
        const td = document.createElement("td");//keli
        if (data[i].tempcolumn!=-1 & !flag){
            td.id=data[i].tempcolumn;
            td.onclick = function() { domino(this.id,document.getElementById(data[0].gameid).id); };
        }else{
            flag=true;
        }
        if (data[i].tempcolumn==0){
            td.innerHTML = '&#127025;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==10){
            td.innerHTML = '&#127032;';
        }
        if (data[i].tempcolumn==11){
            td.innerHTML = '&#127033;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==20){
            td.innerHTML = '&#127039;';
        }
        if (data[i].tempcolumn==21){
            td.innerHTML = '&#127040;';
        }
        if (data[i].tempcolumn==22){
            td.innerHTML = '&#127041;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==30){
            td.innerHTML = '&#127046;';
        }
        if (data[i].tempcolumn==31){
            td.innerHTML = '&#127047;';
        }
        if (data[i].tempcolumn==32){
            td.innerHTML = '&#127048;';
        }
        if (data[i].tempcolumn==33){
            td.innerHTML = '&#127049;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==40){
            td.innerHTML = '&#127053;';
        }
        if (data[i].tempcolumn==41){
            td.innerHTML = '&#127054;';
        }
        if (data[i].tempcolumn==42){
            td.innerHTML = '&#127055;';
        }
        if (data[i].tempcolumn==43){
            td.innerHTML = '&#127056;';
        }
        if (data[i].tempcolumn==44){
            td.innerHTML = '&#127057;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==50){
            td.innerHTML = '&#127060;';
        }
        if (data[i].tempcolumn==51){
            td.innerHTML = '&#127061;';
        }
        if (data[i].tempcolumn==52){
            td.innerHTML = '&#127062;';
        }
        if (data[i].tempcolumn==53){
            td.innerHTML = '&#127063;';
        }
        if (data[i].tempcolumn==54){
            td.innerHTML = '&#127064;';
        }
        if (data[i].tempcolumn==55){
            td.innerHTML = '&#127065;';
        }
        ////////////////////////////////////////
        if (data[i].tempcolumn==60){
            td.innerHTML = '&#127067;';
        }
        if (data[i].tempcolumn==61){
            td.innerHTML = '&#127068;';
        }
        if (data[i].tempcolumn==62){
            td.innerHTML = '&#127069;';
        }
        if (data[i].tempcolumn==63){
            td.innerHTML = '&#127070;';
        }
        if (data[i].tempcolumn==64){
            td.innerHTML = '&#127071;';
        }
        if (data[i].tempcolumn==65){
            td.innerHTML = '&#127072;';
        }
        if (data[i].tempcolumn==66){
            td.innerHTML = '&#127073;';
        }
        if (!flag){
            document.getElementById("tr").appendChild(td);
        }else{
            document.getElementById("tr2").appendChild(td);
        }
    }
}
function error_game(data, y, z, c) {
    var x = data.responseJSON;
    alert(x.errormesg);
}