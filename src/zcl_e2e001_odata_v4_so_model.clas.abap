CLASS zcl_e2e001_odata_v4_so_model DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_model_prov
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_e2e001_odata_v4_so_types.

    METHODS /iwbep/if_v4_mp_basic~define REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    ALIASES gty_cds_views
      FOR zif_e2e001_odata_v4_so_types~gty_cds_views.
    ALIASES gcs_entity_set_names
      FOR zif_e2e001_odata_v4_so_types~gcs_entity_set_names .
    ALIASES gcs_entity_type_names
      FOR zif_e2e001_odata_v4_so_types~gcs_entity_type_names .
    ALIASES gcs_nav_prop_names
      FOR zif_e2e001_odata_v4_so_types~gcs_nav_prop_names.

    METHODS define_salesorder
      IMPORTING
        io_model TYPE REF TO /iwbep/if_v4_med_model
      RAISING
        /iwbep/cx_gateway .
    METHODS define_salesorderitem
      IMPORTING
        io_model TYPE REF TO /iwbep/if_v4_med_model
      RAISING
        /iwbep/cx_gateway .
ENDCLASS.



CLASS zcl_e2e001_odata_v4_so_model IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic~define.


    define_salesorder( io_model ).
    define_salesorderitem( io_model ).
  ENDMETHOD.


  METHOD define_salesorder.
    DATA: lt_primitive_properties TYPE /iwbep/if_v4_med_element=>ty_t_med_prim_property,
          lo_entity_set           TYPE REF TO /iwbep/if_v4_med_entity_set,
          lo_nav_prop             TYPE REF TO /iwbep/if_v4_med_nav_prop,
          lo_entity_type          TYPE REF TO /iwbep/if_v4_med_entity_type,
          ls_referenced_cds_view  TYPE gty_cds_views-salesorder  . " As internal ABAP name we use the name of the CDS view


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Create entity type
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_entity_type = io_model->create_entity_type_by_struct(
                      EXPORTING
                        iv_entity_type_name          = gcs_entity_type_names-internal-salesorder
                        is_structure                 = ls_referenced_cds_view
                        iv_add_conv_to_prim_props    = abap_true
                        iv_add_f4_help_to_prim_props = abap_true
                        iv_gen_prim_props            = abap_true ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set external EDM name for entity type
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_entity_type->set_edm_name( gcs_entity_type_names-edm-salesorder ).



    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Rename external EDM names of properties so that CamelCase notation is used
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_entity_type->get_primitive_properties( IMPORTING et_property = lt_primitive_properties ).

    LOOP AT lt_primitive_properties INTO DATA(lo_primitive_property).
      lo_primitive_property->set_edm_name( to_mixed( val = lo_primitive_property->get_internal_name( ) ) ).
    ENDLOOP.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set key field(s)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALESORDER' ).
    lo_primitive_property->set_is_key( ).


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Create navigation property
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_nav_prop = lo_entity_type->create_navigation_property( gcs_nav_prop_names-internal-salesorder_to_items ).
    lo_nav_prop->set_edm_name( gcs_nav_prop_names-edm-salesorder_to_items ).

    lo_nav_prop->set_target_entity_type_name( gcs_entity_type_names-internal-salesorderitem ).
    lo_nav_prop->set_target_multiplicity( /iwbep/if_v4_med_element=>gcs_med_nav_multiplicity-to_many_optional ).

*    lo_nav_prop->set_on_delete_action( /iwbep/if_v4_med_element=>gcs_med_on_delete_action-none ).
*
    lo_nav_prop->set_is_containment_navigation( ).
    "OnDelete action for cont. nav. prop. '_ITEM' must be 'Cascade'
    lo_nav_prop->set_on_delete_action( /iwbep/if_v4_med_element=>gcs_med_on_delete_action-cascade ).


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Create entity set
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_entity_set = lo_entity_type->create_entity_set( gcs_entity_set_names-internal-salesorder ).
    lo_entity_set->set_edm_name( gcs_entity_set_names-edm-salesorder ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Add the binding of the navigation path
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    lo_entity_set->add_navigation_prop_binding( iv_navigation_property_path = CONV #( gcs_nav_prop_names-internal-salesorder_to_items )
*                                                iv_target_entity_set        = gcs_entity_set_names-internal-salesorderitem ).

  ENDMETHOD.


  METHOD define_salesorderitem.
    DATA: lo_entity_type          TYPE REF TO /iwbep/if_v4_med_entity_type,
          lo_entity_set           TYPE REF TO /iwbep/if_v4_med_entity_set,
          lt_primitive_properties TYPE /iwbep/if_v4_med_element=>ty_t_med_prim_property,
          ls_referenced_cds_view  TYPE gty_cds_views-salesorderitem  . " As internal ABAP name we use the name of the CDS view


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Create entity type
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    lo_entity_type = io_model->create_entity_type_by_struct(
                      EXPORTING
                        iv_entity_type_name          = gcs_entity_type_names-internal-salesorderitem
                        is_structure                 = ls_referenced_cds_view
                        iv_add_conv_to_prim_props    = abap_true
                        iv_add_f4_help_to_prim_props = abap_true
                        iv_gen_prim_props            = abap_true ).

    lo_entity_type->set_edm_name( gcs_entity_type_names-edm-salesorderitem ).


    lo_entity_type->get_primitive_properties( IMPORTING et_property = lt_primitive_properties ).

    LOOP AT lt_primitive_properties INTO DATA(lo_primitive_property).
      lo_primitive_property->set_edm_name( to_mixed( val = lo_primitive_property->get_internal_name( ) ) ).
    ENDLOOP.


    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set key field(s)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALESORDERITEM'  ).
    lo_primitive_property->set_is_key( ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "    Hide technical fields
    "    the sales order number should not be part of the key
    "    of the contained entity (items)
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALESORDER' ).
    lo_primitive_property->set_is_technical(  ).

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "   Create entity set (doesn't work since the entity type is
    "   for a containment
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "lo_entity_set = lo_entity_type->create_entity_set( 'HUGO' ).
    "lo_entity_set->set_edm_name( 'Hugo' ).

  ENDMETHOD.

ENDCLASS.
