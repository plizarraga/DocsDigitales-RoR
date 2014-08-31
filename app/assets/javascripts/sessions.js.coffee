# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@login_validator = ()->
# To use feedback icons, ens  ure that you use Bootstrap v3.1.0 or later
  $("form").bootstrapValidator(
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      email:
      	message: "* Correo Electronico no valido."
      	validators:
      	  notEmpty:
      	    message: "* Correo Electronico requerido."

      	  emailAddress:
      	    message: "* Correo Electronico no valido."	

      password:
      	validators:
      	  notEmpty:
      	  	message: "* La contraseña no debe estar vacia."

  ).on "success.form.bv", (e) ->
    
    # Called when the form is valid
    #$form = $(e.target)
    #e.preventDefault()  if $form.data("remote") and $.rails isnt `undefined`

    # Prevent form submission
    # e.preventDefault()

    # # Get the form instance
    # $form = $(e.target)

    # # Get the BootstrapValidator instance
    # bv = $form.data("bootstrapValidator")

    # # Use Ajax to submit form data
    # parametros =  $form.serialize()
    # $.post $form.attr("action"), $form.serialize(), ((result) ->

    # # ... Process the result ...
    # ), "json"
return