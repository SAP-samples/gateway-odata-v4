INTERFACE zif_e2e001_odata_v4_so_types
  PUBLIC .
  TYPES:
    BEGIN OF gty_cds_views,
      salesorderitem TYPE ze2e001_c_salesorderitem,
      salesorder     TYPE ze2e001_c_salesorder,
      "customer       TYPE sepm_odata_c_customer,
      "scheduleline   TYPE sepm_odata_c_soi_schedline,
    END OF gty_cds_views.

  TYPES: BEGIN OF gty_s_so_soi .
           INCLUDE TYPE gty_cds_views-salesorder.
  TYPES:
           _item TYPE STANDARD TABLE OF gty_cds_views-salesorderitem WITH DEFAULT KEY,
         END OF gty_s_so_soi .

  TYPES: gty_t_so_item TYPE STANDARD TABLE OF ze2e001_c_salesorderitem WITH DEFAULT KEY.

  "Ranges
*  TYPES:
*    gt_salesorder_key_range   TYPE RANGE OF gty_cds_views-salesorder-salesorder,
*    gt_itemposition_key_range TYPE RANGE OF gty_cds_views-salesorderitem-salesorderitem.

  TYPES:
    BEGIN OF gt_key_range,
      salesorder   TYPE RANGE OF gty_cds_views-salesorder-salesorder,
      itemposition TYPE RANGE OF gty_cds_views-salesorderitem-salesorderitem,
    END OF gt_key_range.
  "gt_customer_key_range     TYPE RANGE OF gty_cds_views-customer-customer.



  CONSTANTS:

    BEGIN OF gcs_cds_view_names,
      salesorderitem TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDERITEM',
      salesorder     TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDER',
      "customer       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SEPM_ODATA_C_CUSTOMER',
    END OF gcs_cds_view_names,


    BEGIN OF gcs_entity_type_names,
      BEGIN OF internal,
        salesorderitem TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDERITEM',
        salesorder     TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDER',
        "customer       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SEPM_ODATA_C_CUSTOMER',
        "scheduleline   TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SEPM_ODATA_C_SOI_SCHEDLINE',
      END OF internal,
      BEGIN OF edm,
        salesorderitem TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'SalesOrderItemType',
        salesorder     TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'SalesOrderType',
        "customer       TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'CustomerType',
        "scheduleline   TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE  'ScheduleLineType',
      END OF edm,
    END OF gcs_entity_type_names,

    "no entity set must be defined for the entity type ScheduleLineType
    BEGIN OF gcs_entity_set_names,
      BEGIN OF internal,
        salesorderitem TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDERITEM',
        salesorder     TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'ZE2E001_C_SALESORDER',
        "customer       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SEPM_ODATA_C_CUSTOMER',
      END OF internal,
      BEGIN OF edm,
        salesorderitem TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'SalesOrderItem',
        salesorder     TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'SalesOrder',
        "customer       TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'Customer',
      END OF edm,
    END OF gcs_entity_set_names ,


    BEGIN OF gcs_nav_prop_names,
      BEGIN OF internal,
        "customer_to_salesorder TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE '_SALESORDER',
        salesorder_to_items TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE '_ITEM',
        "item_to_scheduline     TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE '_SCHEDULELINE',
      END OF internal,
      BEGIN OF edm,
        "customer_to_salesorder TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE '_SalesOrder',
        salesorder_to_items TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE '_Item',
        "item_to_scheduline     TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE '_ScheduleLine',
      END OF edm,
    END OF gcs_nav_prop_names.


*    BEGIN OF gcs_operation_names,
*      BEGIN OF internal,
*        ac_confirm_salesorder       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'AC_CONFIRM_SALESORDER',
*        ac_regenerate_epm_demo_data TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'AC_REGENERATE_EPM_DEMO_DATA',
*        fu_get_max_value_item       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'FU_GET_MAX_VALUE_ITEM',
*      END OF internal,
*      BEGIN OF edm,
*        ac_confirm_salesorder       TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'AcConfirmSalesorder',
*        ac_regenerate_epm_demo_data TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'AcRegenerateEpmDemoData',
*        fu_get_max_value_item       TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'FuGetMaxValueItem',
*      END OF edm,
*    END OF gcs_operation_names,
*
*    BEGIN OF gcs_operation_import_names,
*      BEGIN OF internal,
*        regenerate_epm_demo_data TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'REGENERATE_EPM_DEMO_DATA',
*        get_max_value_item       TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'FU_GET_MAX_VALUE_ITEM',
*      END OF internal,
*      BEGIN OF edm,
*        regenerate_epm_demo_data TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'RegenerateEpmDemoData',
*        get_max_value_item       TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'GetMaxValueItem',
*      END OF edm,
*    END OF gcs_operation_import_names,
*
*
*    BEGIN OF gcs_operation_parameter_names,
*      BEGIN OF internal,
*        salesorder        TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SALESORDER',
*        no_of_salesorders TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'NO_OF_SALESORDERS',
*      END OF internal,
*      BEGIN OF edm,
*        salesorder        TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'Salesorder',
*        no_of_salesorders TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'NoOfSalesorders',
*      END OF edm,
*    END OF gcs_operation_parameter_names ,
*
*
*    BEGIN OF gcs_primitive_type_names,
*      BEGIN OF internal,
*        salesorder        TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'SALESORDER',
*        no_of_salesorders TYPE /iwbep/if_v4_med_element=>ty_e_med_internal_name VALUE 'NO_OF_SALESORDERS',
*      END OF internal,
*      BEGIN OF edm,
*        salesorder        TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'Salesorder',
*        no_of_salesorders TYPE /iwbep/if_v4_med_element=>ty_e_med_edm_name VALUE 'NoOfSalesorders',
*      END OF edm,
*    END OF gcs_primitive_type_names ,
*
*
*    BEGIN OF gcs_expand_expressions,
*      "BEGIN OF internal,
*      salesorder_with_items TYPE /iwbep/if_v4_runtime_types=>ty_expand_expression VALUE '_ITEM',
*      "END OF internal,
*      "BEGIN OF edm,
*
*    END OF gcs_expand_expressions .
ENDINTERFACE.
