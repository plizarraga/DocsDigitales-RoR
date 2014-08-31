# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@user_validator = ()->
# To use feedback icons, ens  ure that you use Bootstrap v3.1.0 or later
  $("form").bootstrapValidator(
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      user_correo_electronico:
      	selector: "#user_correo_electronico"
      	message: "* Correo Electronico no valido."
      	validators:
      	  notEmpty:
      	    message: "* Correo Electronico requerido."

      	  emailAddress:
      	    message: "* Correo Electronico no valido."	
      				
      user_nombre:
        selector: "#user_nombre"
        message: "* El nombre no es valido."
        validators:
          notEmpty:
            message: "* El nombre de Usuario es requerido."

          stringLength:
            min: 5
            max: 30
            message: "* El nombre debe contener al menos 5 caracteres y maximo 30."

      user_rfc:
        selector: "#user_rfc"
        message: "* RFC no valido."
        validators:
          notEmpty:
            message: "* RFC requerido."

      user_empresa:
        selector: "#user_empresa"
        message: "* Empresa no valida."
        validators:
          notEmpty:
            message: "* El nombre de su empresa es requerida"

      user_contrasena:
      	selector: "#user_contrasena"
      	validators:
      	  notEmpty:
      	  	message: "* La contraseña no debe estar vacia."

      	  stringLength:
      	    min: 6
      	    message: "* La contraseña debe contener al menos 6 caracteres"

      user_contrasena_confirmation:
      	selector: "#user_contrasena_confirmation"
      	validators:
      	  notEmpty:
      	  	message: "* La contraseña no debe estar vacia."
      	  
      	  stringLength:
      	    min: 6
      	    message: "* La contraseña debe contener al menos 6 caracteres"

      	  identical:
      	  	field: 'user_contrasena'
      	  	message: "* La contraseña no coincide con la primera."		

  ).on "success.form.bv", (e) ->
    
    # Called when the form is valid
    #$form = $(e.target)
    #e.preventDefault()  if $form.data("remote") and $.rails isnt `undefined`

    # Prevent form submission
    e.preventDefault()

    # Get the form instance
    $form = $(e.target)

    # Get the BootstrapValidator instance
    bv = $form.data("bootstrapValidator")

    # Use Ajax to submit form data
    parametros =  $form.serialize()
    $.post $form.attr("action"), $form.serialize(), ((result) ->

    # ... Process the result ...
    ), "json"
return
