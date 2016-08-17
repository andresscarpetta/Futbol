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

function add_player(){
  $("#content").append('<div class="col-xs-12"> <label>Jugador:</label> <div class="row"> <div class="col-xs-10"> <input type="text" value="" placeholder="Nombre del jugador" class="form-control" required> </div> <button onclick="remove_player(this);" class="btn btn-default col-xs-2">Remover</button  > </div> <br> </div>');
}

function remove_player(obj){
  $(obj).parent().parent().remove();
}
