$(document).on("ready", function(){
  buscarTrack();
  buscarUsers();
  buscarGroups();
  buscarPlaylist();
  showTracks();
  //Evento para el campo de texto que hace de buscador
  $("#buscar").keyup(function(){
    buscar();
  });
  //Evento para que al hacer clic en la tabla se muestre la información de dicho elemento
  $('tr').live("click",function() {
        window.location.href = $(this).find("a").attr("href");
  });

  //Cambiar pestaña activa
  $('.nav li a').click(function(e) {

        $('.nav li').removeClass('active');

        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
        //e.preventDefault();
    });
})

function buscar(){

  buscarTrack();
  buscarUsers();
  buscarGroups();
  buscarPlaylist();

}

function showTracks(){
  filtroactivo = "tracks";
  mustDisablePageUp();
  mustDisablePageDown();
  hideAll();
  $("#resultadosTracks").show();
}

function showPlaylists(){
  filtroactivo = "playlist";
  mustDisablePageUp();
  mustDisablePageDown();
  hideAll();
  $("#resultadosPlaylists").show();
}

function showGroups(){
  filtroactivo = "groups";
  mustDisablePageUp();
  mustDisablePageDown();
  hideAll();
  $("#resultadosGroups").show();
}

function showUsers(){
  filtroactivo = "users";
  mustDisablePageUp();
  mustDisablePageDown();
  hideAll();
  $("#resultadosUsers").show();
  $("#paginador").show();
}

function hideAll(){
  $("#resultadosTracks").hide();
  $("#resultadosPlaylists").hide();
  $("#resultadosGroups").hide();
  $("#resultadosUsers").hide();
}

function buscarTrack(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarTrack",
    type: "POST",
    data:{buscar: valor, pag: pagTracks},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Tracks";
      if(resultados.length>0){
        //Comprobamos si hemos llegado a la ultima pagina (en cuyo caso ponemos la variable ultTracks a true)
        if(resultados.length<10){
          ultTracks = true;
        }
        else{
          ultTracks = false;
        }

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
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosTracks").html(html);
      mustDisablePageUp();
      mustDisablePageDown();
      mustShowPaginator();
    }
  });
}

function buscarPlaylist(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarPlaylist",
    type: "POST",
    data:{buscar: valor, pag: pagPlaylist},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Playlists";
      if(resultados.length>0){
        //Comprobamos si hemos llegado a la ultima pagina (en cuyo caso ponemos la variable ultPlaylist a true)
        if(resultados.length<10){
          ultPlaylist = true;
        }
        else{
          ultPlaylist = false;
        }
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
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosPlaylists").html(html);
      mustDisablePageUp();
      mustDisablePageDown();
      mustShowPaginator();
    }
  });
}

function buscarGroups(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarGroup",
    type: "POST",
    data:{buscar: valor, pag: pagGroups},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Groups";
      if(resultados.length>0){
        //Comprobamos si hemos llegado a la ultima pagina (en cuyo caso ponemos la variable ultGroups a true)
        if(resultados.length<10){
          ultGroups = true;
        }
        else{
          ultGroups = false;
        }
        html+= "</h3><table class=\"table-striped\"><thead><tr><th>Name</th></tr></thead><tbody>";
        for (var i = 0; i < resultados.length; i++) {
          html += "<tr>";
          html += "<td><a href='group_info_controller?oid="+ resultados[i].OID + "'></a>"+resultados[i].Group_Name+"</td>";
          html += "</tr>";
        }
        html += "</tbody></table>";
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosGroups").html(html);
      mustDisablePageUp();
      mustDisablePageDown();
      mustShowPaginator();
    }
  });
}

function buscarUsers(){
  valor = $("#buscar").val();
  $.ajax({
    url: "/soundcloud/index.php/search/buscarUsers",
    type: "POST",
    data:{buscar: valor, pag: pagUsers},
    success:function(respuesta){
      var resultados = eval(respuesta);
      html = "<h3>Users";

      if(resultados.length>0){
        //Comprobamos si hemos llegado a la ultima pagina (en cuyo caso ponemos la variable ultUsers a true)
        if(resultados.length<10){
          ultUsers = true;
        }
        else{
          ultUsers = false;
        }

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
      }
      else{
          html += " - No results</h3>";
      }
      $("#resultadosUsers").html(html);
      mustDisablePageUp();
      mustDisablePageDown();
      mustShowPaginator();
    }
  });
}

var pagTracks = 0;
var pagUsers = 0;
var pagGroups = 0;
var pagPlaylist = 0;
var filtroactivo = "tracks";
var ultTracks = false;
var ultUsers = false;
var ultGroups = false;
var ultPlaylist = false;

function pageDown(){
  switch (filtroactivo) {
    case "tracks": if(pagTracks>0) pagTracks--;
                  buscarTrack();
                  break;
    case "users": if(pagUsers>0) pagUsers--;
                  buscarUsers();
                  break;
    case "groups": if(pagGroups>0) pagGroups--;
                  buscarGroups();
                  break;
    case "playlist": if(pagPlaylist>0) pagPlaylist--;
                  buscarPlaylist();
                  break;
  }
}

function pageUp(){
  switch (filtroactivo) {
    case "tracks": if(!ultTracks) pagTracks++;
                  buscarTrack();
                  break;
    case "users": if(!ultUsers) pagUsers++;
                  buscarUsers();
                  break;
    case "groups": if(!ultGroups) pagGroups++;
                  buscarGroups();
                  break;
    case "playlist": if(!ultPlaylist) pagPlaylist++;
                  buscarPlaylist();
                  break;
  }
}

function mustDisablePageDown(){
  switch (filtroactivo) {
    case "tracks": if(pagTracks != 0) $("#prevPag").removeClass("disabled");
                  else $("#prevPag").addClass("disabled");
                  break;
    case "users": if(pagUsers != 0) $("#prevPag").removeClass("disabled");
                  else $("#prevPag").addClass("disabled");
                  break;
    case "groups": if(pagGroups != 0) $("#prevPag").removeClass("disabled");
                  else $("#prevPag").addClass("disabled");
                  break;
    case "playlist": if(pagPlaylist != 0) $("#prevPag").removeClass("disabled");
                  else $("#prevPag").addClass("disabled");
                  break;
  }
}

function mustDisablePageUp(){
  switch (filtroactivo) {
    case "tracks": if(!ultTracks) $("#nextPag").removeClass("disabled");
                  else $("#nextPag").addClass("disabled");
                  break;
    case "users": if(!ultUsers) $("#nextPag").removeClass("disabled");
                  else $("#nextPag").addClass("disabled");
                  break;
    case "groups": if(!ultGroups) $("#nextPag").removeClass("disabled");
                  else $("#nextPag").addClass("disabled");
                  break;
    case "playlist": if(!ultPlaylist) $("#nextPag").removeClass("disabled");
                  else $("#nextPag").addClass("disabled");
                  break;
  }
}

function mustShowPaginator(){
  $("#paginador").show();
  switch (filtroactivo) {
    case "tracks": if($("#resultadosTracks").text().indexOf("No results") != -1) $("#paginador").hide();
                  break;
    case "users": if($("#resultadosUsers").text().indexOf("No results") != -1) $("#paginador").hide();
                  break;
    case "groups": if($("#resultadosGroups").text().indexOf("No results") != -1) $("#paginador").hide();
                  break;
    case "playlist": if($("#resultadosPlaylists").text().indexOf("No results") != -1) $("#paginador").hide();
                  break;
  }
}
