# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@employee_validator = ()->
# To use feedback icons, ens  ure that you use Bootstrap v3.1.0 or later
  $("form").bootstrapValidator(
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      employee_nombre:
        selector: "#employee_nombre"
        message: "* El nombre no es valido."
        validators:	
          notEmpty:
            message: "* El nombre es requerido."

          stringLength:
            min: 3
            max: 30
            message: "* El nombre debe contener al menos 3 caracteres y maximo 30."

      employee_rfc:
        selector: "#employee_rfc"
        message: "* RFC no valido."
        validators:
          notEmpty:
            message: "* RFC requerido."

          remote:
            message: "* El RFC ya se encuentra registrado."
            url: "/findEmployeeRFC"
            data:
              type: "employee_rfc"     
      
      employee_store_id:
        selector: "#employee_store_id"
        message: "* Seleccione una Sucursal."
        validators:
          notEmpty:
            message: "* Seleccione una Sucursal."

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