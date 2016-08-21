// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var countries = ["Colombia", "Alemania", "Inglaterra", "Brasil", "Francia", "España", "Japon", "Canada", "Noruega", "Italia", "Holanda"];

function add_player(){
  $("#content").append('<div class="col-xs-12 element"> <div class="col-xs-8"> <label>Jugador:</label> <input type="text" value="" placeholder="Nombre del jugador" class="form-control" required> </div> <div class="col-xs-2"> <label>Equipo:</label> <select class="form-control"> </select> </div> <div class="col-xs-2"> <div onclick="remove_player(this);" style="margin-top:27px;" class="btn btn-default">Remover</div> </div> <br> </div>');
  for (var i = 0; i < countries.length; i++) {
    $("select").each(function(){
      var flag = false;
      $(this).children("option").each(function(){
        if($(this).val() == countries[i]){
          flag = true;
        }
      });
      if(!flag){
        $(this).append("<option value='"+countries[i]+"'>"+countries[i]+"</option>");
      }
    });
  }
}

function remove_player(obj){
  $(obj).parent().parent().remove();
}
