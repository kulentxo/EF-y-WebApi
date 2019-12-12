<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="Cliente.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<script>
    function elimChamp() {
        var xhttp = new XMLHttpRequest();

        var id = document.getElementById("nume").value;

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
            }
        };

        xhttp.open("DELETE", 'https://localhost:44319/api/Campeones/', true);
        xhttp.setRequestHeader("content-type", "application/json");
        xhttp.setRequestHeader("cache-control", "no-cache");

        xhttp.send();
    }
    function modifChamp() {
        var xhttp = new XMLHttpRequest();

        var id = document.getElementById("nume").value;
        var nombre = document.getElementById("nomb").value;
        var hab1 = document.getElementById("hab11").value;
        var hab2 = document.getElementById("hab22").value;
        var hab3 = document.getElementById("hab33").value;
        var hab4 = document.getElementById("hab44").value;
        var pasv = document.getElementById("pasv1").value;

        var Campeon = {};
        Campeon.id = id;
        Campeon.Nombre = nombre;
        Campeon.Habilidad1 = hab1;
        Campeon.Habilidad2 = hab2;
        Campeon.Habilidad3 = hab3;
        Campeon.Habilidad4 = hab4;
        Campeon.Pasiva = pasv;

        var datos = JSON.stringify(Campeon);
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
            }
        };
        xhttp.open("PUT", 'https://localhost:44319/api/Campeones', true);
        xhttp.setRequestHeader("content-type", "application/json");
        xhttp.setRequestHeader("cache-control", "no-cache");
        xhttp.send(id);
    }
    function enviarChamp() {
        var xhttp = new XMLHttpRequest();

        var id = document.getElementById("num").value;
        var nombre = document.getElementById("nom").value;
        var hab1 = document.getElementById("hab1").value;
        var hab2 = document.getElementById("hab2").value;
        var hab3 = document.getElementById("hab3").value;
        var hab4 = document.getElementById("hab4").value;
        var pasv = document.getElementById("pasv").value;

        var Campeon = {};
        Campeon.id = id;
        Campeon.Nombre = nombre;
        Campeon.Habilidad1 = hab1;
        Campeon.Habilidad2 = hab2;
        Campeon.Habilidad3 = hab3;
        Campeon.Habilidad4 = hab4;
        Campeon.Pasiva = pasv;

        var datos = JSON.stringify(Campeon);
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
            }
        };
        xhttp.open("POST", 'https://localhost:44319/api/Campeones', true);
        xhttp.setRequestHeader("content-type", "application/json");
        xhttp.setRequestHeader("cache-control", "no-cache");
        xhttp.send(datos);
    }
    function getDatos() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var champs = this.responseText;
                var Campeones = JSON.parse(champs);
                for (var i = 0; i < Campeones.length; i++) {
                    document.getElementById("nombre" + i).innerHTML = Campeones[i].Nombre;
                    document.getElementById("ability1" + i).innerHTML = Campeones[i].Habilidad1;
                    document.getElementById("ability2" + i).innerHTML = Campeones[i].Habilidad2;
                    document.getElementById("ability3" + i).innerHTML = Campeones[i].Habilidad3;
                    document.getElementById("pasiva" + i).innerHTML = Campeones[i].Pasiva;
                }
            }
        };
        xhttp.open("GET", 'https://localhost:44319/api/Campeones', true);
        xhttp.send();
    }
</script>
<body onload="getDatos()">
    <div class="jumbotron text-center">
        <h1>Campeones</h1>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <h2 id="nombre0"></h2>
                <b>Habilidad 1: </b><p id="ability10"></p>
                <b>Habilidad 2: </b><p id="ability20"></p>
                <b>Habilidad 3: </b><p id="ability30"></p>
                <b>Pasiva : </b><p id="pasiva0"></p>
            </div>
            <div class="col-sm-4">
                <h2 id="nombre1"></h2>
                <b>Habilidad 1: </b><p id="ability11"></p>
                <b>Habilidad 2: </b><p id="ability21"></p>
                <b>Habilidad 3: </b><p id="ability31"></p>
                <b>Pasiva : </b><p id="pasiva1"></p>
            </div>
            <div class="col-sm-4">
                <h2 id="nombre2"></h2>
                <b>Habilidad 1: </b><p id="ability12"></p>
                <b>Habilidad 2: </b><p id="ability22"></p>
                <b>Habilidad 3: </b><p id="ability32"></p>
                <b>Pasiva : </b><p id="pasiva2"></p>
            </div>
        </div>
    </div>
    <div class="container">
        <h2>Introduce un nuevo campeon</h2>
        Id: <input type="text" id="num"/><br />
        Nombre: <input type="text" id="nom"/><br />
        Habilidad 1: <input type="text" id="hab1"/><br />
        Habilidad 2: <input type="text" id="hab2"/><br />
        Habilidad 3: <input type="text" id="hab3"/><br />
        Habilidad 4: <input type="text" id="hab4"/><br />
        Pasiva: <input type="text" id="pasv"/><br />
        <button onclick="enviarChamp()" id="Env">Enviar</button>
    </div>
    <div class="container">
            <h2>Introduce id de campeon para modificar</h2>
            Id: <input type="text" id="nume"/><br />
            Nombre: <input type="text" id="nomb"/><br />
            Habilidad 1: <input type="text" id="hab11"/><br />
            Habilidad 2: <input type="text" id="hab22"/><br />
            Habilidad 3: <input type="text" id="hab33"/><br />
            Habilidad 4: <input type="text" id="hab44"/><br />
            Pasiva: <input type="text" id="pasv1"/><br />
            <button onclick="modifChamp()" id="modif">Modificar</button>
    </div>
    <div class="container">
        <h2>Introduce id de campeon para eliminar</h2>
        Id: <input type="text" id="id"/><br />
        <button onclick="elimChamp()">Eliminar</button>
    </div>
</body>
</html>
