CLASS zcl_e2e001_odata_v4_so_data DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_data_provider
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_e2e001_odata_v4_so_types.

    "basic interface methods
    METHODS /iwbep/if_v4_dp_basic~read_entity REDEFINITION .
    METHODS /iwbep/if_v4_dp_basic~read_entity_list REDEFINITION.
    METHODS /iwbep/if_v4_dp_basic~read_ref_target_key_data_list REDEFINITION .
    METHODS /iwbep/if_v4_dp_basic~create_entity REDEFINITION.
    METHODS /iwbep/if_v4_dp_basic~update_entity REDEFINITION.
    METHODS /iwbep/if_v4_dp_basic~delete_entity REDEFINITION.
    METHODS /iwbep/if_v4_dp_advanced~create_entity REDEFINITION.

    "advanced interface methods
    METHODS /iwbep/if_v4_dp_advanced~update_entity REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
    ALIASES gcs_entity_set_names
       FOR zif_e2e001_odata_v4_so_types~gcs_entity_set_names .
    ALIASES gcs_entity_type_names
      FOR zif_e2e001_odata_v4_so_types~gcs_entity_type_names .
    ALIASES gty_cds_views
      FOR zif_e2e001_odata_v4_so_types~gty_cds_views.
    ALIASES gcs_nav_prop_names
      FOR zif_e2e001_odata_v4_so_types~gcs_nav_prop_names.

    METHODS read_list_salesorder
      IMPORTING
        io_request        TYPE REF TO /iwbep/if_v4_requ_basic_list
        io_response       TYPE REF TO /iwbep/if_v4_resp_basic_list
        iv_orderby_string TYPE string
        iv_where_clause   TYPE string
        iv_select_string  TYPE string
        iv_skip           TYPE i
        iv_top            TYPE i
        is_done_list      TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_process_list
      RAISING
        /iwbep/cx_gateway.
    METHODS read_entity_salesorder
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_read
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_read
      RAISING
        /iwbep/cx_gateway.
    METHODS read_ref_key_list_salesorder
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_ref_l
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_ref_l
      RAISING
        /iwbep/cx_gateway.

    METHODS read_list_salesorderitem
      IMPORTING
        io_request        TYPE REF TO /iwbep/if_v4_requ_basic_list
        io_response       TYPE REF TO /iwbep/if_v4_resp_basic_list
        iv_orderby_string TYPE string
        iv_where_clause   TYPE string
        iv_select_string  TYPE string
        iv_skip           TYPE i
        iv_top            TYPE i
        is_done_list      TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_process_list
      RAISING
        /iwbep/cx_gateway.



    METHODS read_entity_salesorderitem
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_read
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_read
      RAISING
        /iwbep/cx_gateway.
    METHODS create_salesorder
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_create
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_create
      RAISING
        /iwbep/cx_gateway.
    METHODS create_salesorderitem
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_create
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_create
      RAISING
        /iwbep/cx_gateway.
    METHODS update_salesorder
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_update
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_update
      RAISING
        /iwbep/cx_gateway.
    METHODS delete_salesorder
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_delete
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_delete
      RAISING
        /iwbep/cx_gateway.
    METHODS delete_salesorderitem
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_basic_delete
        io_response TYPE REF TO /iwbep/if_v4_resp_basic_delete
      RAISING
        /iwbep/cx_gateway.
    METHODS update_salesorderitem
      IMPORTING
        io_request   TYPE REF TO /iwbep/if_v4_requ_adv_update
        io_response  TYPE REF TO /iwbep/if_v4_resp_adv_update
        is_done_list TYPE /iwbep/if_v4_requ_adv_update=>ty_s_todo_process_list
      RAISING
        /iwbep/cx_gateway.
    METHODS create_sales_order_deep
      IMPORTING
        io_request  TYPE REF TO /iwbep/if_v4_requ_adv_create
        io_response TYPE REF TO /iwbep/if_v4_resp_adv_create
      RAISING
        /iwbep/cx_gateway.


ENDCLASS.



CLASS zcl_e2e001_odata_v4_so_data IMPLEMENTATION.


  METHOD /iwbep/if_v4_dp_basic~create_entity.
    DATA: lv_entity_type_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.


    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entity_type_name ).

    CASE lv_entity_type_name.

      WHEN gcs_entity_type_names-internal-salesorder.
        create_salesorder(
            io_request  = io_request
            io_response = io_response ).

      WHEN gcs_entity_type_names-internal-salesorderitem.
        create_salesorderitem(
            io_request  = io_request
            io_response = io_response ).

      WHEN OTHERS.

        super->/iwbep/if_v4_dp_basic~create_entity(
            EXPORTING
              io_request  = io_request
              io_response = io_response ).

    ENDCASE.

  ENDMETHOD.


  METHOD /iwbep/if_v4_dp_basic~delete_entity.

    DATA: lv_entity_type_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.

    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entity_type_name ).

    CASE lv_entity_type_name.

      WHEN gcs_entity_type_names-internal-salesorder.
        delete_salesorder(
          EXPORTING
            io_request  = io_request
            io_response = io_response ).

      WHEN gcs_entity_type_names-internal-salesorderitem.
        delete_salesorderitem(
          EXPORTING
            io_request  = io_request
            io_response = io_response ).

      WHEN OTHERS.
        RAISE EXCEPTION TYPE /iwbep/cx_v4_tea
          EXPORTING
            http_status_code = /iwbep/cx_v4_tea=>gcs_http_status_codes-sv_not_implemented
            textid           = /iwbep/cx_v4_tea=>entity_type_not_supported
            entity_type      = lv_entity_type_name.

    ENDCASE.


  ENDMETHOD.


  METHOD /iwbep/if_v4_dp_basic~read_entity.


    DATA: lv_entityset_name  TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name,
          lv_entitytype_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.

    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entitytype_name ).

    "sales order items have been configured as a containment
    "since there can't be an entity set based on this entity type
    "the entity type for a containment is unique

    CASE lv_entitytype_name.

      WHEN gcs_entity_type_names-internal-salesorderitem.

        read_entity_salesorderitem(
          EXPORTING
            io_request        = io_request
            io_response       = io_response ).

      WHEN OTHERS.

        io_request->get_entity_set( IMPORTING ev_entity_set_name = lv_entityset_name ).

        CASE lv_entityset_name.

          WHEN gcs_entity_set_names-internal-salesorder.
            read_entity_salesorder(
              EXPORTING
                io_request  = io_request
                io_response = io_response ).

          WHEN OTHERS.
            super->/iwbep/if_v4_dp_basic~read_entity(
              EXPORTING
                io_request  = io_request
                io_response = io_response ).

        ENDCASE.

    ENDCASE.

  ENDMETHOD.


  METHOD /iwbep/if_v4_dp_basic~read_entity_list.

    DATA: lv_entityset_name  TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name,
          lv_entitytype_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.

    DATA: ls_todo_list         TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_list,
          ls_done_list         TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_process_list,
          lv_where_clause      TYPE string,
          lv_select_string     TYPE string,
          lv_orderby_string    TYPE string,
          lt_selected_property TYPE /iwbep/if_v4_runtime_types=>ty_t_property_path,
          lv_skip              TYPE i VALUE 0,
          lv_top               TYPE i VALUE 0,
          lt_orderby_property  TYPE abap_sortorder_tab.


    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).
    io_request->get_entity_set( IMPORTING ev_entity_set_name = lv_entityset_name ).
    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entitytype_name ).


    " $orderby was called
    IF ls_todo_list-process-orderby = abap_true.
      ls_done_list-orderby = abap_true.
      "** only supported as of 751 or 752
      "get Open SQL Order by Clause
      "io_request->get_osql_orderby_clause( IMPORTING ev_osql_orderby_clause = lv_orderby_string ).
*        CATCH /iwbep/cx_gateway.    "

      io_request->get_orderby( IMPORTING et_orderby_property = lt_orderby_property ).
      CLEAR lv_orderby_string.
      LOOP AT lt_orderby_property INTO DATA(ls_orderby_property).
        IF ls_orderby_property-descending = abap_true.
          CONCATENATE lv_orderby_string ls_orderby_property-name 'DESCENDING' INTO lv_orderby_string SEPARATED BY space.
        ELSE.
          CONCATENATE lv_orderby_string ls_orderby_property-name 'ASCENDING' INTO lv_orderby_string SEPARATED BY space.
        ENDIF.
      ENDLOOP.

    ELSE.
      " lv_orderby_string must not be empty.
      lv_orderby_string = 'PRIMARY KEY'.
    ENDIF.


    " $skip / $top handling
    IF ls_todo_list-process-skip = abap_true.
      ls_done_list-skip = abap_true.
      io_request->get_skip( IMPORTING ev_skip = lv_skip ).
    ENDIF.
    IF ls_todo_list-process-top = abap_true.
      ls_done_list-top = abap_true.
      io_request->get_top( IMPORTING ev_top = lv_top ).
    ENDIF.


    " $select handling
    IF ls_todo_list-process-select = abap_true.
      ls_done_list-select = abap_true.
      io_request->get_selected_properties(  IMPORTING et_selected_property = lt_selected_property ).
      CONCATENATE LINES OF lt_selected_property INTO lv_select_string  SEPARATED BY ','.
    ELSE.
      "check coding. If no columns are specified via $select retrieve all columns from the model instead?
      lv_select_string = '*'.
      "or better to throw an exception instead?
    ENDIF.


    " specific sales orders based on $filter?
    IF ls_todo_list-process-filter = abap_true.
      ls_done_list-filter = abap_true.
      io_request->get_filter_osql_where_clause( IMPORTING ev_osql_where_clause = lv_where_clause ).
    ENDIF.

    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entitytype_name ).

    "sales order items have been configured as a containment
    "since there can't be an entity set based on this entity type
    "the entity type for a containment is unique

    CASE lv_entitytype_name.

      WHEN gcs_entity_type_names-internal-salesorderitem.

        read_list_salesorderitem(
          EXPORTING
            io_request        = io_request
            io_response       = io_response
            iv_orderby_string = lv_orderby_string
            iv_select_string  = lv_select_string
            iv_where_clause   = lv_where_clause
            iv_skip           = lv_skip
            iv_top            = lv_top
            is_done_list      = ls_done_list ).

      WHEN OTHERS.

        io_request->get_entity_set( IMPORTING ev_entity_set_name = lv_entityset_name ).

        CASE lv_entityset_name.

          WHEN gcs_entity_set_names-internal-salesorder.

            read_list_salesorder(
              EXPORTING
                io_request        = io_request
                io_response       = io_response
                iv_orderby_string = lv_orderby_string
                iv_select_string  = lv_select_string
                iv_where_clause   = lv_where_clause
                iv_skip           = lv_skip
                iv_top            = lv_top
                is_done_list      = ls_done_list ).

          WHEN OTHERS.

            super->/iwbep/if_v4_dp_basic~read_entity_list( io_request  = io_request
                                                           io_response = io_response ).
        ENDCASE.

    ENDCASE.

  ENDMETHOD.


  METHOD /iwbep/if_v4_dp_basic~read_ref_target_key_data_list.

    DATA: lv_source_entity_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.


    io_request->get_source_entity_type( IMPORTING ev_source_entity_type_name = lv_source_entity_name ).

    CASE lv_source_entity_name.

      WHEN gcs_entity_type_names-internal-salesorder.
        read_ref_key_list_salesorder(
           EXPORTING
            io_request  = io_request
            io_response = io_response ).

      WHEN OTHERS.
        super->/iwbep/if_v4_dp_basic~read_ref_target_key_data_list(
          EXPORTING
            io_request  = io_request
            io_response = io_response ).

    ENDCASE.

  ENDMETHOD.


  METHOD /iwbep/if_v4_dp_basic~update_entity.

    DATA: lv_entity_type_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.

    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entity_type_name ).

    CASE lv_entity_type_name.

      WHEN gcs_entity_type_names-internal-salesorder.
        update_salesorder(
          EXPORTING
            io_request  = io_request
            io_response = io_response ).

      WHEN OTHERS.

        super->/iwbep/if_v4_dp_basic~update_entity(
         EXPORTING
           io_request  = io_request
           io_response = io_response ).

    ENDCASE.

  ENDMETHOD.


  METHOD create_salesorder.


    "entity type specific data types
    DATA: ls_salesorder         TYPE gty_cds_views-salesorder,
          ls_salesorder_rfc     TYPE bapi_epm_so_header,
          ls_salesorder_rfc_key TYPE bapi_epm_so_id.

    "generic data types
    DATA:
      ls_todo_list              TYPE /iwbep/if_v4_requ_basic_create=>ty_s_todo_list,
      ls_done_list              TYPE /iwbep/if_v4_requ_basic_create=>ty_s_todo_process_list,
      lt_bapi_return            TYPE TABLE OF bapiret2,
      ls_bapi_return            TYPE bapiret2,
      lo_message_container      TYPE REF TO /iwbep/if_v4_message_container,
      lv_names_of_missing_props TYPE string.


    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).
    IF ls_todo_list-process-busi_data = abap_true.
      io_request->get_busi_data( IMPORTING es_busi_data = ls_salesorder ).
      ls_done_list-busi_data = abap_true. "business data processed
    ENDIF.

    IF ls_todo_list-process-partial_busi_data = abap_true.
      "check if the mandatory properties have been provided
      "do not check for properties that are not mandatory
      "@todo: These could be annotated as Core.Computed

      IF ls_salesorder-customer IS NOT INITIAL AND
      ls_salesorder-transactioncurrency IS NOT INITIAL.
        ls_salesorder_rfc-buyer_id = ls_salesorder-customer.
        ls_salesorder_rfc-currency_code  = ls_salesorder-transactioncurrency.
        ls_done_list-partial_busi_data = abap_true.
      ELSE.
        lv_names_of_missing_props = 'Customer or TransactionCurrency'.
        RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
          EXPORTING
            textid                 = zcx_e2e001_odata_v4_so=>missing_properties
            http_status_code       = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
            edm_entity_set_name    = gcs_entity_set_names-edm-salesorder
            names_of_missing_props = lv_names_of_missing_props.
      ENDIF.
    ENDIF.

    "Create single entity using classic API.
    "request fields have been mapped to function module parameters

    CALL FUNCTION 'BAPI_EPM_SO_CREATE'
      EXPORTING
        headerdata   = ls_salesorder_rfc
      IMPORTING
        salesorderid = ls_salesorder_rfc_key
      TABLES
        return       = lt_bapi_return.

    " Error handling
    IF lt_bapi_return IS NOT INITIAL.
      "check if an error message is in lt_bapi_return
      LOOP AT lt_bapi_return INTO ls_bapi_return.
        IF ls_bapi_return-type = 'E'.

          lo_message_container = io_response->get_message_container( ).

          LOOP AT lt_bapi_return INTO ls_bapi_return.
            lo_message_container->add_t100(
              EXPORTING
                iv_msg_type                 =     ls_bapi_return-type
                iv_msg_id                   =     ls_bapi_return-id
                iv_msg_number               =     ls_bapi_return-number
                iv_msg_v1                   =     ls_bapi_return-message_v1
                iv_msg_v2                   =     ls_bapi_return-message_v2
                iv_msg_v3                   =     ls_bapi_return-message_v3
                iv_msg_v4                   =     ls_bapi_return-message_v4 ).
          ENDLOOP.

          "raise exception
          RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
            EXPORTING
              message_container = lo_message_container.

        ENDIF.
      ENDLOOP.

    ENDIF.


    IF ls_todo_list-return-busi_data = abap_true.
      "   Read data again and set the response.
      CLEAR ls_salesorder.
      SELECT SINGLE * FROM ze2e001_c_salesorder
      INTO CORRESPONDING FIELDS OF @ls_salesorder
      WHERE salesorder = @ls_salesorder_rfc_key-so_id.
      io_response->set_busi_data( ls_salesorder ).
    ENDIF.

    io_response->set_is_done( ls_done_list ).


  ENDMETHOD.


  METHOD create_salesorderitem.

    "entity type specific data types
    DATA: ls_salesorderitem       TYPE gty_cds_views-salesorderitem,
          ls_salesorderitem_rfc   TYPE bapi_epm_so_item,
          ls_salesorderitem_x_rfc TYPE bapi_epm_so_itemx,
          lt_salesorderitem_rfc   TYPE STANDARD TABLE OF bapi_epm_so_item,
          lt_salesorderitem_x_rfc TYPE STANDARD TABLE OF bapi_epm_so_itemx,
          ls_salesorder_rfc_key   TYPE bapi_epm_so_id,
          lv_new_salesorderitem   TYPE gty_cds_views-salesorderitem-salesorderitem.

    "generic data types
    DATA:
      ls_todo_list              TYPE /iwbep/if_v4_requ_basic_create=>ty_s_todo_list,
      ls_done_list              TYPE /iwbep/if_v4_requ_basic_create=>ty_s_todo_process_list,
      lt_bapi_return            TYPE TABLE OF bapiret2,
      ls_bapi_return            TYPE bapiret2,
      lo_message_container      TYPE REF TO /iwbep/if_v4_message_container,
      lv_names_of_missing_props TYPE string.


    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).
    IF ls_todo_list-process-busi_data = abap_true.
      io_request->get_busi_data( IMPORTING es_busi_data = ls_salesorderitem ).
      ls_done_list-busi_data = abap_true. "business data processed
    ENDIF.



    IF ls_todo_list-process-partial_busi_data = abap_true.
      "check if the mandatory properties have been provided
      "do not check for properties that are not mandatory
      "@todo: These could be annotated as Core.Computed


      "Since we are using the BAPI BAPI_EPM_SO_CHANGE
      "sales order line items are NOT uniquely identified by the key fields salesorder and salesorderitem
      "we need in addition the product id as well as the delivery data
      "this is however a specific EPM demo data logic

      IF ls_salesorderitem-salesorder IS INITIAL OR
      ls_salesorderitem-product IS INITIAL OR
      ls_salesorderitem-deliverydatetime IS INITIAL.

        lv_names_of_missing_props = 'Salesorder or Product or DeveliveryDateTime'.
        RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
          EXPORTING
            textid                 = zcx_e2e001_odata_v4_so=>missing_properties
            http_status_code       = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
            edm_entity_set_name    = gcs_entity_set_names-edm-salesorderitem
            names_of_missing_props = lv_names_of_missing_props.

      ELSE.
        "the mandatory properties have been provided
        ls_done_list-partial_busi_data = abap_true.
      ENDIF.


      ls_salesorder_rfc_key-so_id =   ls_salesorderitem-salesorder.

      " fill structure for header data
      ls_salesorderitem_rfc-so_id = ls_salesorder_rfc_key-so_id.
      ls_salesorderitem_rfc-product_id = ls_salesorderitem-product.
      ls_salesorderitem_rfc-delivery_date = ls_salesorderitem-deliverydatetime.

      " @TODO Sales order description is not yet a property of the CDS view
      ls_salesorderitem_rfc-quantity = ls_salesorderitem-quantity.
      ls_salesorderitem_rfc-quantity_unit = ls_salesorderitem-unit.

      " Map key values to x-bapi-structure
      ls_salesorderitem_x_rfc-so_id = ls_salesorderitem_rfc-so_id.
      ls_salesorderitem_x_rfc-product_id = ls_salesorderitem_rfc-product_id.
      ls_salesorderitem_x_rfc-delivery_date = ls_salesorderitem_rfc-delivery_date.

      " Map constant values to function module parameters
      " @TODO Sales order description is not yet a property of the CDS view
      ls_salesorderitem_x_rfc-quantity = abap_true.
      ls_salesorderitem_x_rfc-quantity_unit = abap_true.

      "Specify that this is an insert operation 'I'
      ls_salesorderitem_x_rfc-actioncode = 'I'.

      APPEND ls_salesorderitem_rfc TO lt_salesorderitem_rfc.
      APPEND ls_salesorderitem_x_rfc TO lt_salesorderitem_x_rfc.

* update data

      CALL FUNCTION 'BAPI_EPM_SO_CHANGE'
        EXPORTING
          so_id       = ls_salesorder_rfc_key
        TABLES
          soitemdata  = lt_salesorderitem_rfc
          soitemdatax = lt_salesorderitem_x_rfc
          return      = lt_bapi_return.
      " Error handling
      IF lt_bapi_return IS NOT INITIAL.
        "check if an error message is in lt_bapi_return
        LOOP AT lt_bapi_return INTO ls_bapi_return.
          IF ls_bapi_return-type = 'E'.

            lo_message_container = io_response->get_message_container( ).

            LOOP AT lt_bapi_return INTO ls_bapi_return.
              lo_message_container->add_t100(
                EXPORTING
                  iv_msg_type                 =     ls_bapi_return-type
                  iv_msg_id                   =     ls_bapi_return-id
                  iv_msg_number               =     ls_bapi_return-number
                  iv_msg_v1                   =     ls_bapi_return-message_v1
                  iv_msg_v2                   =     ls_bapi_return-message_v2
                  iv_msg_v3                   =     ls_bapi_return-message_v3
                  iv_msg_v4                   =     ls_bapi_return-message_v4 ).
            ENDLOOP.

            "raise exception
            RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
              EXPORTING
                message_container = lo_message_container.

          ENDIF.
        ENDLOOP.

      ELSE.

        ls_salesorderitem_rfc = lt_salesorderitem_rfc[ 1 ].

      ENDIF.



      IF ls_todo_list-return-busi_data = abap_true.
        "   Read data again and set the response.
        CLEAR ls_salesorderitem.

        SELECT * FROM ze2e001_c_salesorderitem
        WHERE salesorder = @ls_salesorderitem_rfc-so_id
        ORDER BY salesorderitem DESCENDING
        INTO CORRESPONDING FIELDS OF @ls_salesorderitem
        UP TO 1 ROWS       .
        ENDSELECT.






        io_response->set_busi_data( ls_salesorderitem ).
      ENDIF.
    ENDIF.
    io_response->set_is_done( ls_done_list ).

  ENDMETHOD.


  METHOD delete_salesorder.
    "entity type specific data types
    DATA: ls_key_salesorder TYPE gty_cds_views-salesorder,
          ls_so_id          TYPE bapi_epm_so_id.

    "generic data types
    DATA:
      ls_todo_list         TYPE /iwbep/if_v4_requ_basic_delete=>ty_s_todo_list,
      ls_done_list         TYPE /iwbep/if_v4_requ_basic_delete=>ty_s_todo_process_list,
      lt_bapi_return       TYPE TABLE OF bapiret2,
      lo_message_container TYPE REF TO /iwbep/if_v4_message_container.



    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " read the key data
    io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorder ).
    ls_done_list-key_data = abap_true.

    ls_so_id-so_id = ls_key_salesorder-salesorder.

    " Delete data
    CALL FUNCTION 'BAPI_EPM_SO_DELETE'
      EXPORTING
        so_id  = ls_so_id
      TABLES
        return = lt_bapi_return.

    " Error handling
    IF lt_bapi_return IS NOT INITIAL.
      lo_message_container = io_response->get_message_container( ).

      LOOP AT lt_bapi_return INTO DATA(ls_bapi_return).
        lo_message_container->add_t100(
          EXPORTING
            iv_msg_type                 =     ls_bapi_return-type
            iv_msg_id                   =     ls_bapi_return-id
            iv_msg_number               =     ls_bapi_return-number
            iv_msg_v1                   =     ls_bapi_return-message_v1
            iv_msg_v2                   =     ls_bapi_return-message_v2
            iv_msg_v3                   =     ls_bapi_return-message_v3
            iv_msg_v4                   =     ls_bapi_return-message_v4 ).
      ENDLOOP.

      "custom exception
      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          message_container = lo_message_container.

    ENDIF.

    io_response->set_is_done( ls_done_list ).
  ENDMETHOD.


  METHOD delete_salesorderitem.

    "entity type specific data types
    DATA: ls_salesorderitem         TYPE gty_cds_views-salesorderitem,
          ls_key_salesorderitem     TYPE gty_cds_views-salesorderitem,
          ls_itemdatax              TYPE bapi_epm_so_itemx,
          lt_itemdatax              TYPE STANDARD TABLE OF bapi_epm_so_itemx,
          ls_itemdata               TYPE bapi_epm_so_item,
          lt_itemdata               TYPE STANDARD TABLE OF bapi_epm_so_item,
          ls_so_id                  TYPE snwd_so_id,
          ls_so_item                TYPE snwd_so_item_pos,
          ls_salesorder_rfc_key     TYPE bapi_epm_so_id,
          lv_key_edm_salesorderitem TYPE string,
          lv_helper_int             TYPE i.



    "generic data types
    DATA:
      ls_todo_list         TYPE /iwbep/if_v4_requ_basic_delete=>ty_s_todo_list,
      ls_done_list         TYPE /iwbep/if_v4_requ_basic_delete=>ty_s_todo_process_list,
      lt_bapi_return       TYPE TABLE OF bapiret2,
      lo_message_container TYPE REF TO /iwbep/if_v4_message_container.



    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " read the key data
    io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorderitem ).
    ls_done_list-key_data = abap_true.

    ls_so_id = ls_key_salesorderitem-salesorder.
    ls_so_item = ls_key_salesorderitem-salesorderitem.
    ls_salesorder_rfc_key-so_id =   ls_key_salesorderitem-salesorder.

    SELECT SINGLE * FROM ze2e001_c_salesorderitem
    INTO CORRESPONDING FIELDS OF @ls_salesorderitem
    WHERE salesorder = @ls_key_salesorderitem-salesorder
    AND  salesorderitem = @ls_key_salesorderitem-salesorderitem.

    IF ls_salesorderitem IS  INITIAL.
      "Move data first to an integer to remove leading zeros from the response
      lv_key_edm_salesorderitem = lv_helper_int = ls_key_salesorderitem-salesorder.
      lv_key_edm_salesorderitem = lv_key_edm_salesorderitem && ','.
      lv_helper_int = ls_key_salesorderitem-salesorderitem.
      lv_key_edm_salesorderitem = lv_key_edm_salesorderitem && lv_helper_int.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid              = zcx_e2e001_odata_v4_so=>entity_not_found
          http_status_code    = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-not_found
          edm_entity_set_name = gcs_entity_set_names-edm-salesorderitem
          entity_key          = lv_key_edm_salesorderitem.
    ELSE.

      ls_itemdata-so_id = ls_salesorderitem-salesorder.
      ls_itemdata-so_item_pos = ls_salesorderitem-salesorderitem.
      ls_itemdata-product_id = ls_salesorderitem-product.
      ls_itemdata-delivery_date = ls_salesorderitem-deliverydatetime.
      APPEND ls_itemdata TO lt_itemdata.

      "lt_itemdata[ 1 ] = ls_salesorderitem.

      ls_itemdatax-so_id = ls_salesorderitem-salesorder.
      ls_itemdatax-so_item_pos = ls_salesorderitem-salesorderitem.
      ls_itemdatax-product_id = ls_salesorderitem-product.
      ls_itemdatax-delivery_date = ls_salesorderitem-deliverydatetime.
      ls_itemdatax-actioncode = 'D'.
      APPEND ls_itemdatax TO lt_itemdatax.

      " Delete data
      CALL FUNCTION 'BAPI_EPM_SO_CHANGE'
        EXPORTING
          so_id       = ls_salesorder_rfc_key
        TABLES
          soitemdata  = lt_itemdata
          soitemdatax = lt_itemdatax
          return      = lt_bapi_return.

      " Error handling
      IF lt_bapi_return IS NOT INITIAL.
        lo_message_container = io_response->get_message_container( ).

        LOOP AT lt_bapi_return INTO DATA(ls_bapi_return).
          lo_message_container->add_t100(
            EXPORTING
              iv_msg_type                 =     ls_bapi_return-type
              iv_msg_id                   =     ls_bapi_return-id
              iv_msg_number               =     ls_bapi_return-number
              iv_msg_v1                   =     ls_bapi_return-message_v1
              iv_msg_v2                   =     ls_bapi_return-message_v2
              iv_msg_v3                   =     ls_bapi_return-message_v3
              iv_msg_v4                   =     ls_bapi_return-message_v4 ).
        ENDLOOP.

        " @TODO custom exception
        RAISE EXCEPTION TYPE /iwbep/cx_v4_tea
          EXPORTING
            message_container = lo_message_container.

      ENDIF.

      io_response->set_is_done( ls_done_list ).
    ENDIF.
  ENDMETHOD.


  METHOD read_entity_salesorder.

    "entity type specific data types
    DATA: ls_salesorder         TYPE gty_cds_views-salesorder,
          ls_key_salesorder     TYPE gty_cds_views-salesorder,
          lv_salesorder_key_edm TYPE string,
          lv_helper_int         TYPE i.
    "generic data types
    DATA: ls_todo_list TYPE /iwbep/if_v4_requ_basic_read=>ty_s_todo_list,
          ls_done_list TYPE /iwbep/if_v4_requ_basic_read=>ty_s_todo_process_list.

    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " read the key data
    io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorder ).
    ls_done_list-key_data = abap_true.

    SELECT SINGLE * FROM ze2e001_c_salesorder
    INTO CORRESPONDING FIELDS OF @ls_salesorder
    WHERE salesorder = @ls_key_salesorder-salesorder.

    IF ls_salesorder IS NOT INITIAL.
      io_response->set_busi_data( is_busi_data = ls_salesorder ).
    ELSE.
      "Move data first to an integer to remove leading zeros from the response
      lv_salesorder_key_edm = lv_helper_int = ls_key_salesorder-salesorder.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid              = zcx_e2e001_odata_v4_so=>entity_not_found
          http_status_code    = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-not_found
          edm_entity_set_name = gcs_entity_set_names-edm-salesorder
          entity_key          = lv_salesorder_key_edm.

    ENDIF.

    " Report list of request options handled by application
    io_response->set_is_done( ls_done_list ).
  ENDMETHOD.


  METHOD read_entity_salesorderitem.
    "entity type specific data types
    DATA: ls_salesorderitem         TYPE gty_cds_views-salesorderitem,
          ls_key_salesorderitem     TYPE gty_cds_views-salesorderitem,
          lv_key_edm_salesorderitem TYPE string,
          lv_helper_int             TYPE i.
    "generic data types
    DATA: ls_todo_list TYPE /iwbep/if_v4_requ_basic_read=>ty_s_todo_list,
          ls_done_list TYPE /iwbep/if_v4_requ_basic_read=>ty_s_todo_process_list.

    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " read the key data
    io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorderitem ).
    ls_done_list-key_data = abap_true.

    SELECT SINGLE * FROM ze2e001_c_salesorderitem
    INTO CORRESPONDING FIELDS OF @ls_salesorderitem
    WHERE salesorder = @ls_key_salesorderitem-salesorder
    AND  salesorderitem = @ls_key_salesorderitem-salesorderitem.

    IF ls_salesorderitem IS NOT INITIAL.
      io_response->set_busi_data( is_busi_data = ls_salesorderitem ).
    ELSE.
      "Move data first to an integer to remove leading zeros from the response
      lv_key_edm_salesorderitem = lv_helper_int = ls_key_salesorderitem-salesorder.
      lv_key_edm_salesorderitem = lv_key_edm_salesorderitem && ','.
      lv_helper_int = ls_key_salesorderitem-salesorderitem.
      lv_key_edm_salesorderitem = lv_key_edm_salesorderitem && lv_helper_int.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid              = zcx_e2e001_odata_v4_so=>entity_not_found
          http_status_code    = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-not_found
          edm_entity_set_name = gcs_entity_set_names-edm-salesorderitem
          entity_key          = lv_key_edm_salesorderitem.

    ENDIF.

    " Report list of request options handled by application
    io_response->set_is_done( ls_done_list ).
  ENDMETHOD.


  METHOD read_list_salesorder.

    "entity type specific data types
    DATA : lt_key_range_salesorder TYPE zif_e2e001_odata_v4_so_types=>gt_key_range-salesorder,
           ls_key_range_salesorder TYPE LINE OF zif_e2e001_odata_v4_so_types=>gt_key_range-salesorder,
           lt_salesorder           TYPE STANDARD TABLE OF gty_cds_views-salesorder,
           lt_key_salesorder       TYPE STANDARD TABLE OF gty_cds_views-salesorder.

    "generic data types
    DATA: ls_todo_list TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_list,
          ls_done_list TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_process_list,
          lv_count     TYPE i,
          lv_max_index TYPE i.

    " Get the request options the application should/must handle
    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " Get the request options the application has already handled
    ls_done_list = is_done_list.

    " specific sales orders based on navigation?
    IF ls_todo_list-process-key_data = abap_true.
      io_request->get_key_data( IMPORTING et_key_data = lt_key_salesorder ).
      LOOP AT lt_key_salesorder INTO DATA(ls_key_entity).
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_key_entity-salesorder ) TO lt_key_range_salesorder.
      ENDLOOP.
      ls_done_list-key_data = abap_true.
    ENDIF.

    "================================================================
    " read_list must either be called with a filter or via navigation
    " or $top has to be used to avoid a full table scan
    IF  ls_todo_list-process-filter = abap_false
    AND ls_todo_list-process-key_data = abap_false
    AND iv_top = 0.
*      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
*        EXPORTING
*          textid              = zcx_e2e001_odata_v4_so=>use_filter_top_or_nav
*          http_status_code    = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
*          edm_entity_set_name = gcs_entity_set_names-edm-salesorder.
      lv_max_index = 10.
    ENDIF.

    " Return business data if requested
    IF ls_todo_list-return-busi_data = abap_true.

      " read data from the CDS view
      "value for max_index must only be calculated if the request also contains a $top
      IF iv_top IS NOT INITIAL.
        lv_max_index = iv_top + iv_skip.
      ELSE.
        IF lv_max_index IS INITIAL.
          lv_max_index = 0.
        ENDIF.
      ENDIF.

      SELECT (iv_select_string) FROM ze2e001_c_salesorder
      WHERE (iv_where_clause)
      AND   salesorder IN @lt_key_range_salesorder
      ORDER BY (iv_orderby_string)
      INTO CORRESPONDING FIELDS OF TABLE @lt_salesorder
      UP TO @lv_max_index ROWS.

      "skipping entries specified by $skip
      "not needed as of NW751 where OFFSET is supported in Open SQL
      IF iv_skip IS NOT INITIAL.
        DELETE lt_salesorder TO iv_skip.
      ENDIF.

*      "OFFSET is only supported as of NW751
*      SELECT (iv_select_string) FROM ze2e001_c_salesorder
*      WHERE (iv_where_clause)
*      AND   salesorder IN @lt_salesorder_key_range
*      ORDER BY (iv_orderby_string)
*      INTO CORRESPONDING FIELDS OF TABLE @lt_entity
*      UP TO @iv_top ROWS
*      OFFSET @iv_skip.

      io_response->set_busi_data( it_busi_data = lt_salesorder ).

    ELSE.
      "if business data is requested count will be calculated by
      "the framework
      IF ls_todo_list-return-count = abap_true.

        SELECT COUNT( * ) FROM ze2e001_c_salesorder
            WHERE (iv_where_clause) AND
           salesorder IN @lt_key_range_salesorder
            INTO @lv_count.

        io_response->set_count( lv_count ).
      ENDIF.
    ENDIF.

    " Report list of request options handled by application
    io_response->set_is_done( ls_done_list ).
  ENDMETHOD.


  METHOD read_list_salesorderitem.

    "entity type specific data types
    DATA : lt_key_range_salesorder     TYPE zif_e2e001_odata_v4_so_types=>gt_key_range-salesorder,
           ls_key_range_salesorder     TYPE LINE OF zif_e2e001_odata_v4_so_types=>gt_key_range-salesorder,
           lt_key_range_salesorderitem TYPE zif_e2e001_odata_v4_so_types=>gt_key_range-itemposition,
           ls_key_range_salesorderitem TYPE LINE OF zif_e2e001_odata_v4_so_types=>gt_key_range-itemposition,
           lt_salesorderitem           TYPE STANDARD TABLE OF gty_cds_views-salesorderitem,
           lt_key_salesorderitem       TYPE STANDARD TABLE OF gty_cds_views-salesorderitem.

    "generic data types
    DATA: ls_todo_list TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_list,
          ls_done_list TYPE /iwbep/if_v4_requ_basic_list=>ty_s_todo_process_list,
          lv_count     TYPE i,
          lv_max_index TYPE i.

    " Get the request options the application should/must handle
    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    " Get the request options the application has already handled
    ls_done_list = is_done_list.

    " specific sales orders based on navigation?
    IF ls_todo_list-process-key_data = abap_true.
      io_request->get_key_data( IMPORTING et_key_data = lt_key_salesorderitem ).
      LOOP AT lt_key_salesorderitem INTO DATA(ls_key_entity).
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_key_entity-salesorder ) TO lt_key_range_salesorder.
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_key_entity-salesorderitem ) TO lt_key_range_salesorderitem.
      ENDLOOP.

      "the first key field (salesoder) is always the same
      DELETE ADJACENT DUPLICATES FROM lt_key_range_salesorder.
      ls_done_list-key_data = abap_true.
    ENDIF.


    "================================================================
    " read_list must either be called with a filter or via navigation
    " or $top has to be used to avoid a full table scan
    IF  ls_todo_list-process-filter = abap_false
    AND ls_todo_list-process-key_data = abap_false
    AND iv_top = 0.
      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid              = zcx_e2e001_odata_v4_so=>use_filter_top_or_nav
          http_status_code    = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
          edm_entity_set_name = gcs_entity_set_names-edm-salesorder.
    ENDIF.

    " Return business data if requested
    IF ls_todo_list-return-busi_data = abap_true.

      " read data from the CDS view

*      "OFFSET is only supported as of NW751
*      SELECT (iv_select_string) FROM ze2e001_c_salesorder
*      WHERE (iv_where_clause)
*      AND   salesorder IN @lt_salesorder_key_range
*      ORDER BY (iv_orderby_string)
*      INTO CORRESPONDING FIELDS OF TABLE @lt_entity
*      UP TO @iv_top ROWS
*      OFFSET @iv_skip.

      "value for max_index must only be calculated if the request also contains a $top
      IF iv_top IS NOT INITIAL.
        lv_max_index = iv_top + iv_skip.
      ELSE.
        lv_max_index = 0.
      ENDIF.

      SELECT (iv_select_string) FROM ze2e001_c_salesorderitem
      WHERE (iv_where_clause)
      AND   salesorder IN @lt_key_range_salesorder
      AND   salesorderitem IN @lt_key_range_salesorderitem
      ORDER BY (iv_orderby_string)
      INTO CORRESPONDING FIELDS OF TABLE @lt_salesorderitem
      UP TO @lv_max_index ROWS.

      "skipping entries specified by $skip
      "not needed as of NW751 where OFFSET is supported in Open SQL
      IF iv_skip IS NOT INITIAL.
        DELETE lt_salesorderitem TO iv_skip.
      ENDIF.

      io_response->set_busi_data( it_busi_data = lt_salesorderitem ).

    ELSE.
      "if business data is requested count will be calculated by
      "the framework
      IF ls_todo_list-return-count = abap_true.

        SELECT COUNT( * ) FROM ze2e001_c_salesorderitem
            WHERE (iv_where_clause)
            AND   salesorder IN @lt_key_range_salesorder
            AND   salesorderitem IN @lt_key_range_salesorderitem
            INTO @lv_count.

        io_response->set_count( lv_count ).
      ENDIF.
    ENDIF.

    " Report list of request options handled by application
    io_response->set_is_done( ls_done_list ).

  ENDMETHOD.


  METHOD read_ref_key_list_salesorder.

    "entity type specific data types
    DATA: ls_salesorder_key_data     TYPE  gty_cds_views-salesorder,
          lt_salesorderitem_key_data TYPE STANDARD TABLE OF gty_cds_views-salesorderitem,
          ls_salesorderitem_key_data TYPE  gty_cds_views-salesorderitem,
          ls_todo_list               TYPE /iwbep/if_v4_requ_basic_ref_l=>ty_s_todo_list.
    "generic data types
    DATA: ls_done_list         TYPE /iwbep/if_v4_requ_basic_ref_l=>ty_s_todo_process_list,
          lv_nav_property_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.

    " Get the request options the application should/must handle
    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    IF ls_todo_list-process-source_key_data = abap_true.
      io_request->get_source_key_data( IMPORTING es_source_key_data =  ls_salesorder_key_data ).
      ls_done_list-source_key_data = abap_true.
    ENDIF.

    io_request->get_navigation_prop( IMPORTING ev_navigation_prop_name = lv_nav_property_name ).

    CASE lv_nav_property_name.
      WHEN gcs_nav_prop_names-internal-salesorder_to_items.

        IF ls_todo_list-process-target_key_data = abap_true.
          "item number '10' is retrieved from target key SalesOrder('500000000')/_Item('10')
          io_request->get_target_key_data( IMPORTING es_target_key_data =  ls_salesorderitem_key_data ).
          "sales order number '500000000' is retrieved from target key SalesOrder('500000000')/_Item('10')
          ls_salesorderitem_key_data-salesorder = ls_salesorder_key_data-salesorder.
          "return structure is a table
          APPEND ls_salesorderitem_key_data TO lt_salesorderitem_key_data.
          ls_done_list-target_key_data = abap_true.
        ELSE.
          "if no target key has been provided we have to retrieve the list of keys for the read_list_salesorderitem method
          SELECT salesorder , salesorderitem FROM ze2e001_c_salesorderitem
          INTO CORRESPONDING FIELDS OF TABLE @lt_salesorderitem_key_data
          WHERE salesorder = @ls_salesorder_key_data-salesorder.
        ENDIF.

        io_response->set_target_key_data( lt_salesorderitem_key_data ).

      WHEN OTHERS.

        RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
          EXPORTING
            http_status_code = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-sv_not_implemented.

    ENDCASE.

    " Report list of request options handled by application
    io_response->set_is_done( ls_done_list ).


  ENDMETHOD.


  METHOD update_salesorder.

    "entity type specific data types
    DATA: ls_salesorder         TYPE gty_cds_views-salesorder,
          ls_key_salesorder     TYPE gty_cds_views-salesorder,
          ls_salesorder_rfc     TYPE bapi_epm_so_header,
          ls_salesorder_x_rfc   TYPE bapi_epm_so_headerx,
          ls_salesorder_rfc_key TYPE bapi_epm_so_id,
          lv_salesorder_key_edm TYPE string,
          lv_helper_int         TYPE i.
    "generic data types
    DATA: ls_todo_list         TYPE /iwbep/if_v4_requ_basic_update=>ty_s_todo_list,
          ls_done_list         TYPE /iwbep/if_v4_requ_basic_update=>ty_s_todo_process_list,
          lt_bapi_return       TYPE TABLE OF bapiret2,
          lo_message_container TYPE REF TO /iwbep/if_v4_message_container.

    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).
    IF ls_todo_list-process-busi_data = abap_true.
      io_request->get_busi_data( IMPORTING es_busi_data = ls_salesorder ).
      ls_done_list-busi_data = abap_true. "business data processed
    ENDIF.

    " Read the key data
    io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorder ).
    ls_done_list-key_data = abap_true.


    "check if key data matches key data provided in the payload
    "only needed if update instead of patch is used

    IF ls_salesorder-salesorder <> ls_key_salesorder-salesorder AND
    ls_todo_list-process-partial_busi_data = abap_false.

      "Move data first to an integer to remove leading zeros from the response
      lv_salesorder_key_edm = lv_helper_int = ls_key_salesorder-salesorder.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid           = zcx_e2e001_odata_v4_so=>entity_keys_do_not_match
          http_status_code = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
          entity_key       = lv_salesorder_key_edm.
    ENDIF.

    " Update single entity using classic API.

    " fill structure for header data
    ls_salesorder_rfc-so_id = ls_key_salesorder-salesorder.
    ls_salesorder_rfc-buyer_id = ls_salesorder-customer.
    ls_salesorder_rfc-currency_code  = ls_salesorder-transactioncurrency.
    " @TODO Sales order description is not yet a property of the CDS view

    " Map constant values to function module parameters
    ls_salesorder_x_rfc-so_id = ls_key_salesorder-salesorder.
    ls_salesorder_x_rfc-buyer_id = 'X'.
    ls_salesorder_x_rfc-currency_code  = 'X'.
    " @TODO Sales order description is not yet a property of the CDS view

    ls_salesorder_rfc_key-so_id = ls_key_salesorder-salesorder.

* update data

    CALL FUNCTION 'BAPI_EPM_SO_CHANGE'
      EXPORTING
        so_id         = ls_salesorder_rfc_key
        soheaderdata  = ls_salesorder_rfc
        soheaderdatax = ls_salesorder_x_rfc
      TABLES
        return        = lt_bapi_return.

    " Error handling
    IF lt_bapi_return IS NOT INITIAL.
      lo_message_container = io_response->get_message_container( ).

      LOOP AT lt_bapi_return INTO DATA(ls_bapi_return).
        lo_message_container->add_t100(
          EXPORTING
            iv_msg_type                 =     ls_bapi_return-type
            iv_msg_id                   =     ls_bapi_return-id
            iv_msg_number               =     ls_bapi_return-number
            iv_msg_v1                   =     ls_bapi_return-message_v1
            iv_msg_v2                   =     ls_bapi_return-message_v2
            iv_msg_v3                   =     ls_bapi_return-message_v3
            iv_msg_v4                   =     ls_bapi_return-message_v4 ).
      ENDLOOP.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          message_container = lo_message_container.

    ENDIF.

    " In OData V4 an update request has to return data by default unless specified otherwise using
    " the http header ...
    IF ls_todo_list-return-busi_data = abap_true.
      "   Read data again and set the response.
      SELECT SINGLE * FROM ze2e001_c_salesorder
      INTO CORRESPONDING FIELDS OF @ls_salesorder
      WHERE salesorder = @ls_salesorder_rfc_key-so_id.
      io_response->set_busi_data( ls_salesorder ).
    ENDIF.
    io_response->set_is_done( ls_done_list ).



  ENDMETHOD.


  METHOD update_salesorderitem.

    "entity type specific data types
    DATA: ls_salesorderitem         TYPE gty_cds_views-salesorderitem,
          ls_key_salesorderitem     TYPE gty_cds_views-salesorderitem,
          ls_key_salesorder         TYPE gty_cds_views-salesorder,
          ls_salesorderitem_rfc     TYPE bapi_epm_so_item,
          ls_salesorderitem_x_rfc   TYPE bapi_epm_so_itemx,
          lt_salesorderitem_rfc     TYPE STANDARD TABLE OF bapi_epm_so_item,
          lt_salesorderitem_x_rfc   TYPE STANDARD TABLE OF bapi_epm_so_itemx,
          ls_salesorder_rfc_key     TYPE bapi_epm_so_id,
          lv_salesorderitem_key_edm TYPE string,
          lv_helper_int             TYPE i,
          lv_names_of_missing_props TYPE string.

    "generic data types
    DATA: ls_todo_list            TYPE /iwbep/if_v4_requ_adv_update=>ty_s_todo_list,
          ls_done_list            TYPE /iwbep/if_v4_requ_adv_update=>ty_s_todo_process_list,
          lt_bapi_return          TYPE TABLE OF bapiret2,
          ls_bapi_return          TYPE bapiret2,
          lo_message_container    TYPE REF TO /iwbep/if_v4_message_container,
          lo_navigation_node      TYPE REF TO /iwbep/if_v4_navigation_node,
          lo_navigation_node_next TYPE REF TO /iwbep/if_v4_navigation_node.

    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).
    ls_done_list = is_done_list.

    IF ls_todo_list-process-busi_data = abap_true.
      io_request->get_busi_data( IMPORTING es_busi_data = ls_salesorderitem ).
      ls_done_list-busi_data = abap_true. "business data processed
    ENDIF.

    " Read the key data
    "io_request->get_key_data( IMPORTING es_key_data = ls_key_salesorderitem ).


    "read key data from parent entity (sales order)
    lo_navigation_node = io_request->get_navigation_path( ).
    IF lo_navigation_node->has_key_data( ) EQ abap_true.
      lo_navigation_node->get_key_data( IMPORTING es_key_data = ls_key_salesorder ).
      ls_done_list-key_data = abap_true.
    ENDIF.
    "read key data from dependend entity (item)
    lo_navigation_node_next = lo_navigation_node->get_next_navigation_node( ).
    lo_navigation_node_next->get_key_data( IMPORTING es_key_data = ls_key_salesorderitem ).

    ls_salesorderitem-salesorder = ls_key_salesorder-salesorder.

    "check if key data matches key data provided in the payload
    "only needed if update instead of patch is used

    IF ( ls_salesorderitem-salesorderitem <> ls_key_salesorderitem-salesorderitem ) AND
         ls_todo_list-process-partial_busi_data = abap_false.

      "Move data first to an integer to remove leading zeros from the response
      lv_salesorderitem_key_edm = lv_helper_int = ls_key_salesorderitem-salesorder.
      lv_helper_int = ls_key_salesorderitem-salesorderitem.
      lv_salesorderitem_key_edm = lv_salesorderitem_key_edm && lv_helper_int.

      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid           = zcx_e2e001_odata_v4_so=>entity_keys_do_not_match
          http_status_code = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
          entity_key       = lv_salesorderitem_key_edm.
    ENDIF.

    IF ls_todo_list-process-partial_busi_data = abap_true
    OR ls_todo_list-process-patch = abap_true.
      "check if the mandatory properties have been provided
      "do not check for properties that are not mandatory
      "@todo: These could be annotated as Core.Computed

      IF ls_salesorderitem-salesorder IS INITIAL OR
      ls_salesorderitem-product IS INITIAL OR
      ls_salesorderitem-deliverydatetime IS INITIAL.

        lv_names_of_missing_props = 'Salesorder or Product or DeveliveryDateTime'.
        RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
          EXPORTING
            textid                 = zcx_e2e001_odata_v4_so=>missing_properties
            http_status_code       = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-bad_request
            edm_entity_set_name    = gcs_entity_set_names-edm-salesorderitem
            names_of_missing_props = lv_names_of_missing_props.

      ELSE.
        "the mandatory properties have been provided
        ls_done_list-partial_busi_data = abap_true.
        IF ls_todo_list-process-patch = abap_true.
          ls_done_list-patch = abap_true.
        ENDIF.
      ENDIF.

    ENDIF.

    ls_salesorder_rfc_key-so_id =   ls_salesorderitem-salesorder.


    " fill structure for header data
    ls_salesorderitem_rfc-so_id = ls_salesorderitem-salesorder.
    ls_salesorderitem_rfc-so_item_pos = ls_salesorderitem-salesorderitem.
    ls_salesorderitem_rfc-product_id = ls_salesorderitem-product.
    ls_salesorderitem_rfc-delivery_date = ls_salesorderitem-deliverydatetime.

    " @TODO Sales order description is not yet a property of the CDS view
    ls_salesorderitem_rfc-quantity = ls_salesorderitem-quantity.
    ls_salesorderitem_rfc-quantity_unit = ls_salesorderitem-unit.

    " Map key values to x-bapi-structure
    ls_salesorderitem_x_rfc-so_id = ls_salesorderitem-salesorder.
    ls_salesorderitem_x_rfc-so_item_pos = ls_salesorderitem-salesorderitem.
    ls_salesorderitem_x_rfc-product_id = ls_salesorderitem-product.
    ls_salesorderitem_x_rfc-delivery_date = ls_salesorderitem-deliverydatetime.

    " Map constant values to function module parameters
    " @TODO Sales order description is not yet a property of the CDS view
    ls_salesorderitem_x_rfc-quantity = abap_true.
    ls_salesorderitem_x_rfc-quantity_unit = abap_true.

    "Specify that this is an update operation 'U'
    ls_salesorderitem_x_rfc-actioncode = 'U'.

    APPEND ls_salesorderitem_rfc TO lt_salesorderitem_rfc.
    APPEND ls_salesorderitem_x_rfc TO lt_salesorderitem_x_rfc.

* update data

    CALL FUNCTION 'BAPI_EPM_SO_CHANGE'
      EXPORTING
        so_id       = ls_salesorder_rfc_key
      TABLES
        soitemdata  = lt_salesorderitem_rfc
        soitemdatax = lt_salesorderitem_x_rfc
        return      = lt_bapi_return.
    " Error handling
    IF lt_bapi_return IS NOT INITIAL.
      "check if an error message is in lt_bapi_return
      LOOP AT lt_bapi_return INTO ls_bapi_return.
        IF ls_bapi_return-type = 'E'.

          lo_message_container = io_response->get_message_container( ).

          LOOP AT lt_bapi_return INTO ls_bapi_return.
            lo_message_container->add_t100(
              EXPORTING
                iv_msg_type                 =     ls_bapi_return-type
                iv_msg_id                   =     ls_bapi_return-id
                iv_msg_number               =     ls_bapi_return-number
                iv_msg_v1                   =     ls_bapi_return-message_v1
                iv_msg_v2                   =     ls_bapi_return-message_v2
                iv_msg_v3                   =     ls_bapi_return-message_v3
                iv_msg_v4                   =     ls_bapi_return-message_v4 ).
          ENDLOOP.

          RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
            EXPORTING
              message_container = lo_message_container.

        ENDIF.
      ENDLOOP.

    ELSE.

      ls_salesorderitem_rfc = lt_salesorderitem_rfc[ 1 ].

    ENDIF.



    IF ls_todo_list-return-busi_data = abap_true.
      "   Read data again and set the response.
      CLEAR ls_salesorderitem.

      SELECT SINGLE * FROM ze2e001_c_salesorderitem
      WHERE salesorder = @ls_key_salesorder-salesorder AND
            salesorderitem = @ls_key_salesorderitem-salesorderitem
      INTO CORRESPONDING FIELDS OF @ls_salesorderitem.

      io_response->set_busi_data( ls_salesorderitem ).

    ENDIF.
    io_response->set_is_done( ls_done_list ).





  ENDMETHOD.

  METHOD /iwbep/if_v4_dp_advanced~update_entity.

    DATA: lv_entityset_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name.
    DATA:
      lv_navigation_expression TYPE /iwbep/if_v4_runtime_types=>ty_navigation_expression,
      lv_entity_set_name       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name,
      ls_todo_list             TYPE /iwbep/if_v4_requ_adv_update=>ty_s_todo_list,
      ls_done_list             TYPE /iwbep/if_v4_requ_adv_update=>ty_s_todo_process_list.

    io_request->get_entity_set( IMPORTING ev_entity_set_name = lv_entityset_name ).

    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).


    IF ls_todo_list-process-navigation = abap_true.

      io_request->get_navigation_expression(
        IMPORTING
          ev_navigation_expression = lv_navigation_expression ).
      lv_navigation_expression = substring_after( val = lv_navigation_expression sub = '-' ).
      io_request->get_navigation_path( )->get_entity_set_name( IMPORTING ev_entity_set_name = lv_entity_set_name ).

      CASE lv_navigation_expression.

        WHEN gcs_nav_prop_names-internal-salesorder_to_items.

          ls_done_list-navigation = abap_true.

          update_salesorderitem(
            EXPORTING
              io_request  = io_request
              io_response = io_response
               is_done_list      = ls_done_list ).
*  CATCH /iwbep/cx_gateway.    "

        WHEN OTHERS.

          super->/iwbep/if_v4_dp_advanced~update_entity( io_request  = io_request
                                                            io_response = io_response ).
      ENDCASE.
    ELSE.
      super->/iwbep/if_v4_dp_advanced~update_entity( io_request  = io_request
                                                        io_response = io_response ).
    ENDIF.


  ENDMETHOD.

  METHOD /iwbep/if_v4_dp_advanced~create_entity.

    DATA: lv_entity_type_name TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name,
          ls_todo_list        TYPE /iwbep/if_v4_requ_adv_create=>ty_s_todo_list.


    io_request->get_entity_type( IMPORTING ev_entity_type_name = lv_entity_type_name ).
    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).

    IF lv_entity_type_name = gcs_entity_type_names-internal-salesorder
    AND ls_todo_list-process-deep_busi_data = abap_false.

      super->/iwbep/if_v4_dp_advanced~create_entity(
        EXPORTING
          io_request  = io_request
          io_response = io_response ).

    ELSE.

      create_sales_order_deep( io_request = io_request
                               io_response = io_response ).

    ENDIF.


  ENDMETHOD.


  METHOD create_sales_order_deep.

    TYPES:
      BEGIN OF ty_s_so_and_item.
        INCLUDE TYPE gty_cds_views-salesorder.
    TYPES _item TYPE zif_e2e001_odata_v4_so_types=>gty_t_so_item.
    TYPES END OF ty_s_so_and_item.
    TYPES:
      ty_t_so_and_item TYPE STANDARD TABLE OF ty_s_so_and_item WITH KEY salesorder.


    DATA:
      ls_so_and_item              TYPE ty_s_so_and_item,
      ls_data_description_express TYPE string,
      ls_todo_list                TYPE /iwbep/if_v4_requ_adv_create=>ty_s_todo_list,
      ls_done_list                TYPE /iwbep/if_v4_requ_adv_create=>ty_s_todo_process_list,
      lo_data_descr_tree          TYPE REF TO /iwbep/if_v4_data_desc_node,
      lt_data_descr_tree          TYPE /iwbep/if_v4_data_desc_node=>ty_t_data_desc_node,
      ls_todo_list_subnode        TYPE /iwbep/if_v4_data_desc_node=>ty_s_todo_list,
      ls_done_list_subnode        TYPE /iwbep/if_v4_data_desc_node=>ty_s_todo_list.


    io_request->get_todos( IMPORTING es_todo_list = ls_todo_list ).


    io_request->get_data_description_express(
      IMPORTING
        ev_data_description_express = ls_data_description_express ).


    IF ls_data_description_express <> gcs_nav_prop_names-internal-salesorder_to_items.
      RAISE EXCEPTION TYPE zcx_e2e001_odata_v4_so
        EXPORTING
          textid           = zcx_e2e001_odata_v4_so=>not_implemented
          http_status_code = zcx_e2e001_odata_v4_so=>gcs_http_status_codes-sv_not_implemented.
    ENDIF.

    ls_done_list-deep_busi_data = abap_true.
    ls_done_list-partial_busi_data = abap_true.

    io_request->get_busi_data(
      IMPORTING
        es_busi_data = ls_so_and_item ).


    " Partial busi data for subnodes
    io_request->get_data_description_tree_list( IMPORTING et_data_desc_root_node = lt_data_descr_tree ).
    LOOP AT lt_data_descr_tree INTO lo_data_descr_tree.
      lo_data_descr_tree->get_todos( IMPORTING es_todo_list = ls_todo_list_subnode ).

      IF ls_todo_list_subnode-partial_busi_data = abap_true.
        ls_done_list_subnode-partial_busi_data = abap_true.
        " Process tree to know what for properties where provided
      ENDIF.


      lo_data_descr_tree->set_is_done( ls_done_list_subnode ).
    ENDLOOP.



    IF ls_todo_list-return-busi_data = abap_true.
      ls_done_list-busi_data = abap_true.
      io_response->set_busi_data( is_busi_data = ls_so_and_item ).
    ENDIF.



    io_response->set_is_done( is_todo_list = ls_done_list ).

  ENDMETHOD.

ENDCLASS.
