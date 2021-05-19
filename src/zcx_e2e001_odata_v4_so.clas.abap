CLASS zcx_e2e001_odata_v4_so DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cx_gateway
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF entity_not_found,
        msgid TYPE symsgid VALUE 'ZCM_E2E001ODATAV4_SO',
        msgno TYPE symsgno VALUE '050',
        attr1 TYPE scx_attrname VALUE 'ENTITY_KEY',
        attr2 TYPE scx_attrname VALUE 'EDM_ENTITY_SET_NAME',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF entity_not_found.
    CONSTANTS:
      BEGIN OF use_filter_top_or_nav,
        msgid TYPE symsgid VALUE 'ZCM_E2E001ODATAV4_SO',
        msgno TYPE symsgno VALUE '051',
        attr1 TYPE scx_attrname VALUE 'EDM_ENTITY_SET_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF use_filter_top_or_nav .
    CONSTANTS:
      BEGIN OF entity_keys_do_not_match,
        msgid TYPE symsgid VALUE 'ZCM_E2E001ODATAV4_SO',
        msgno TYPE symsgno VALUE '052',
        attr1 TYPE scx_attrname VALUE 'EDM_ENTITY_KEY',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF entity_keys_do_not_match .
    CONSTANTS:
      BEGIN OF missing_properties,
        msgid TYPE symsgid VALUE 'ZCM_E2E001ODATAV4_SO',
        msgno TYPE symsgno VALUE '054',
        attr1 TYPE scx_attrname VALUE 'EDM_ENTITY_SET_NAME',
        attr2 TYPE scx_attrname VALUE 'NAMES_OF_MISSING_PROPS',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF missing_properties .
    CONSTANTS:
      BEGIN OF not_implemented,
        msgid TYPE symsgid VALUE 'ZCM_E2E001ODATAV4_SO',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF not_implemented .

      data:                  entity_set_name        TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name,
      edm_entity_set_name    TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name,
      user_name              TYPE syuname,
      entity_key             TYPE string read-only,
      names_of_missing_props TYPE string.



    METHODS constructor
      IMPORTING
        !textid                LIKE if_t100_message=>t100key OPTIONAL
        !previous              LIKE previous OPTIONAL
        !exception_category    TYPE ty_exception_category DEFAULT gcs_excep_categories-provider
        !http_status_code      TYPE ty_http_status_code DEFAULT gcs_http_status_codes-sv_internal_server_error
        !is_for_user           TYPE abap_bool DEFAULT abap_true
        !message_container     TYPE REF TO /iwbep/if_v4_message_container OPTIONAL
        !sap_note_id           TYPE ty_sap_note_id OPTIONAL
        !edm_entity_set_name   TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name OPTIONAL
        !entity_set_name       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name OPTIONAL
        !user_name             TYPE syuname OPTIONAL
        !entity_key            TYPE string OPTIONAL
        names_of_missing_props TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_e2e001_odata_v4_so IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous           = previous
        exception_category = exception_category
        http_status_code   = http_status_code
        is_for_user        = is_for_user
        message_container  = message_container
        sap_note_id        = sap_note_id.

    me->entity_key = entity_key.
    me->user_name = user_name.
    me->entity_set_name = entity_set_name .
    me->edm_entity_set_name = edm_entity_set_name.
    me->names_of_missing_props = names_of_missing_props.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
