CLASS zcl_kx_f_cal_working_days_qry DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_result_table TYPE STANDARD TABLE OF ZC_KX_FactoryCalendar WITH DEFAULT KEY.


    INTERFACES if_rap_query_provider .

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mt_fact_cal TYPE STANDARD TABLE OF ZC_KX_FactoryCalendar WITH DEFAULT KEY.

    METHODS generate_working_days_table
      IMPORTING
        iv_fcal_id      TYPE fhc_fcalid
        iv_offset1      TYPE int1
        iv_offset2      TYPE int1
      CHANGING
        ct_working_days TYPE ty_result_table.
    METHODS get_working_days_for_an_year
      IMPORTING
        iv_year           TYPE int2
        iv_fcal_id        TYPE fhc_fcalid
        iv_legacy_fcal_id TYPE fhc_legacy_fcalid
      CHANGING
        ct_working_days   TYPE zcl_kx_f_cal_working_days_qry=>ty_result_table.
    METHODS is_leap_year
      IMPORTING
        iv_year          TYPE int2
      RETURNING
        VALUE(rv_result) TYPE abap_bool.
ENDCLASS.



CLASS zcl_kx_f_cal_working_days_qry IMPLEMENTATION.

  METHOD if_rap_query_provider~select.
*& Method to implement working days query

    DATA lt_result_table TYPE STANDARD TABLE OF ZC_KX_FactoryCalendar.
    DATA(lv_top) = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip) = io_request->get_paging( )->get_offset( ).
    DATA(lt_requested_fields) = io_request->get_requested_elements( ).
    DATA(lt_filter_cond) = io_request->get_parameters( ).

    "Fetching a specific parameter value

    TRY.
        DATA(lv_factory_Cal_id_value) = VALUE #( lt_filter_cond[ parameter_name = 'P_FCID' ]-value OPTIONAL ).
        DATA(lv_param1_value) = VALUE #( lt_filter_cond[ parameter_name = 'P_OFFSET1' ]-value OPTIONAL ).
        DATA(lv_param2_value) = VALUE #( lt_filter_cond[ parameter_name = 'P_OFFSET2' ]-value OPTIONAL ).
      CATCH cx_sy_itab_line_not_found.
        IF lv_factory_Cal_id_value IS INITIAL.
          EXIT.
        ENDIF.
    ENDTRY.

    "If input contains non numeric characters, exit
    IF ( lv_param1_value IS NOT INITIAL AND lv_param1_value CN '0123456789' )
     OR ( lv_param2_value IS NOT INITIAL AND lv_param2_value CN '0123456789' ).
      EXIT.
    ENDIF.


    IF mt_fact_cal IS INITIAL.
      generate_working_days_table(
        EXPORTING
          iv_fcal_id = CONV #( lv_factory_Cal_id_value )
          iv_offset1 = CONV #( lv_param1_value )
          iv_offset2 = CONV #( lv_param2_value )
        CHANGING
          ct_working_days = mt_fact_cal
      ).
    ENDIF.

    " Implement paging
    IF lv_skip GT 0.
      DELETE mt_fact_cal FROM 1 TO lv_skip.
    ENDIF.

    SELECT *
    FROM @mt_fact_cal AS fcal
    INTO TABLE @lt_result_table
    UP TO @lv_top ROWS.

    " Set the result data
    io_response->set_data(  lt_result_table ).
    io_response->set_total_number_of_records( lines( lt_result_table ) ).

    CLEAR: lt_result_table.

  ENDMETHOD.

  METHOD generate_working_days_table.

    DATA lv_year TYPE int2.
    DATA lv_current_year TYPE int2.

    SELECT SINGLE *  FROM I_FactoryCalendarBasic  WHERE FactoryCalendarID = @iv_fcal_id INTO @DATA(ls_factoryCalendar).
    IF sy-subrc EQ 0.
      DATA(lv_current_date) = cl_abap_context_info=>get_system_date(  ).

      lv_current_year = CONV #( lv_current_date+0(4) ).

      lv_year = lv_current_year - CONV i( iv_offset1 ).

      DO iv_offset1 + iv_offset2 + 1 TIMES.

        get_working_days_for_an_year(
          EXPORTING
            iv_year             = lv_year
            iv_fcal_id          = ls_factoryCalendar-FactoryCalendarID
            iv_legacy_fcal_id   = ls_factoryCalendar-FactoryCalendarLEgacyID
          CHANGING
            ct_working_days = ct_working_days
        ).

        lv_year = lv_year + 1.

      ENDDO.
    ENDIF.
  ENDMETHOD.


  METHOD get_working_days_for_an_year.

    DATA lv_days_in_year TYPE int2 VALUE 365.
    DATA lv_year_c(4) TYPE c.
    DATA lv_date TYPE datum.

    CONSTANTS co_firstday_of_first_month(4) TYPE c VALUE '0101'.

    TRY.

        DATA(lo_factory_calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( iv_factorycalendar_id =  iv_fcal_id ).

        IF  is_leap_year( iv_year ) = abap_true.
          lv_days_in_year = 366.
        ENDIF.

        lv_year_c = iv_year.

        CONCATENATE  lv_year_c co_firstday_of_first_month INTO lv_date.

        DO lv_days_in_year TIMES.
          IF lo_factory_calendar->is_date_workingday( lv_date ) EQ abap_true.
            INSERT VALUE #(
              fcid  = iv_fcal_id
              lfcid = iv_legacy_fcal_id
              wdt   = lv_date
            ) INTO TABLE ct_working_days.
          ENDIF.
          lv_date = lv_date + 1.
        ENDDO.
      CATCH cx_fhc_runtime INTO DATA(lo_cx).
    ENDTRY.

  ENDMETHOD.

  METHOD is_leap_year.
    rv_result = COND abap_bool(
      WHEN iv_year MOD 400 = 0 THEN abap_true
      WHEN iv_year MOD 4 = 0 AND iv_year MOD 100 <> 0 THEN abap_true
      ELSE abap_false
    ).
  ENDMETHOD.

ENDCLASS.
