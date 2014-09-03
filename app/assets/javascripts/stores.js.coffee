# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@store_validator = ()->
# To use feedback icons, ens  ure that you use Bootstrap v3.1.0 or later
  $("form").bootstrapValidator(
    feedbackIcons:      
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      store_nombre:
        selector: "#store_nombre"
        message: "* El nombre no es valido."
        validators:	
          notEmpty:
            message: "* El nombre es requerido."

          stringLength:
            min: 3
            max: 30
            message: "* El nombre debe contener al menos 3 caracteres y maximo 30."
      
      store_num_ext:
        selector: "#store_num_ext"
        message: "* Numero exterior no valido."
        validators:
          integer:
            message: "* Solo digitos."

      store_num_int:
        selector: "#store_num_int"
        message: "* Numero interior no valido."
        validators:
          integer:
            message: "* Solo digitos."
      
      store_cp:
        selector: "#store_cp"
        message: "* Codigo Postal no valido."
        validators:
          regexp:
            regexp: /^\d{5}$/
            message: "* El Codigo Postal debe contener 5 digitos."

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