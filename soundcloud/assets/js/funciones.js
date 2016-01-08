$(document).on("ready", function(){
  //Evento para el campo de texto que hace de buscador
  $("#buscar").keyup(function(){
    buscar();
  });
  //Evento para que al hacer clic en la tabla se muestre la información de dicho elemento

  $('tr').live("click",function() {
        window.location.href = $(this).find("a").attr("href");
  });

})

function buscar(){

  buscarTrack();
  buscarUsers();
  buscarGroups();
  buscarPlaylist();
}

function buscarTrack(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarTrack",
    type: "POST",
    data:{buscar: valor},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Tracks";
      if(resultados.length>0){
        html+="</h3><table id='tablaTracks' class=\"table-striped\"><thead><tr><th>Name</th><th>Artist</th><th>Cover</th><th>Length</th><th>Top Category</th><th>Likes</th><th>Plays</th></tr></thead><tbody>";
        for (var i = 0; i < resultados.length; i++) {
          html += "<tr>";
          html += "<td><a href='track_info_controller?oid="+ resultados[i].OID + "'></a>"+resultados[i].Name+"</td>";
          html += "<td>"+resultados[i].Artist+"</td>";
          html += "<td>"+resultados[i].Image+"</td>";
          html += "<td>"+resultados[i].Length+"</td>";
          html += "<td>"+resultados[i].Top_Category+"</td>";
          html += "<td>"+resultados[i].N_Like+"</td>";
          html += "<td>"+resultados[i].N_Plays+"</td>";
          html += "</tr>";
        }
        html += "</tbody></table>";
        for (var i = 0; i < resultados.length; i++) {

        }
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosTracks").html(html);
    }
  });
}

function buscarPlaylist(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarPlaylist",
    type: "POST",
    data:{buscar: valor},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Playlists";
      if(resultados.length>0){
        html+="</h3><table class=\"table-striped\"><thead><tr><th>Name</th><th>Image</th><th>Tracks</th><th>Followers</th></tr></thead><tbody>";
        for (var i = 0; i < resultados.length; i++) {
          html += "<tr>";
          html += "<td><a href='playlist_info_controller?oid="+ resultados[i].OID + "'></a>"+resultados[i].Name+"</td>";
          html += "<td>"+resultados[i].Image+"</td>";
          html += "<td>"+resultados[i].N_Tracks+"</td>";
          html += "<td>"+resultados[i].N_Followers+"</td>";
          html += "</tr>";
        }
        html += "</tbody></table>";
        for (var i = 0; i < resultados.length; i++) {

        }
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosPlaylists").html(html);
    }
  });
}

function buscarGroups(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarGroup",
    type: "POST",
    data:{buscar: valor},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Groups";
      if(resultados.length>0){
        html+= "</h3><table class=\"table-striped\"><thead><tr><th>Name</th></tr></thead><tbody>";
        for (var i = 0; i < resultados.length; i++) {
          html += "<tr>";
          html += "<td><a href='group_info_controller?oid="+ resultados[i].OID + "'></a>"+resultados[i].Name+"</td>";
          html += "</tr>";
        }
        html += "</tbody></table>";
        for (var i = 0; i < resultados.length; i++) {

        }
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosGroups").html(html);
    }
  });
}

function buscarUsers(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarUsers",
    type: "POST",
    data:{buscar: valor},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Users";

      if(resultados.length>0){
        html += "</h3><table class=\"table-striped\"><thead><tr><th>Avatar</th><th>User</th><th>Full Name</th><th>Birth date</th><th>Email</th><th>Location</th><th>Gender</th><th>Followers</th><th>Following</th><th>Tracks</th></tr></thead><tbody>";
        for (var i = 0; i < resultados.length; i++) {
          html += "<tr>";
          html += "<td><a href='user_info_controller?oid="+ resultados[i].OID + "'></a>"+resultados[i].Image+"</td>";
          html += "<td>"+resultados[i].User_Name+"</td>";
          html += "<td>"+resultados[i].Full_Name+"</td>";
          html += "<td>"+resultados[i].Date_Of_Birth+"</td>";
          html += "<td>"+resultados[i].Email+"</td>";
          html += "<td>"+resultados[i].Location+"</td>";
          html += "<td>"+resultados[i].Gender+"</td>";
          html += "<td>"+resultados[i].N_Followers+"</td>";
          html += "<td>"+resultados[i].N_Following+"</td>";
          html += "<td>"+resultados[i].N_Tracks+"</td>";
          html += "</tr>";
        }
        html += "</tbody></table>";
        for (var i = 0; i < resultados.length; i++) {

        }
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosUsers").html(html);
    }
  });
}
