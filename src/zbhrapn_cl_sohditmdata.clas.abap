CLASS zbhrapn_cl_sohditmdata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbhrapn_cl_sohditmdata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : lt_sohd   TYPE TABLE OF zbhrapn_dt_sohd,
           ls_sohd   TYPE zbhrapn_dt_sohd,
           lt_soitm  TYPE TABLE OF zbhrapn_dt_soitm,
           ls_soitm  TYPE zbhrapn_dt_soitm,
           lv_soid   TYPE sysuuid_x16,
           lv_itm_id TYPE zbhrapn_dt_soitm-item_id,
           lt_buyer  TYPE string_table,
           lt_prod   TYPE string_table,
           lt_amt    TYPE TABLE OF i,
           l_buyer   TYPE zbhrapn_dt_sohd-buyer,
           l_prod    TYPE zbhrapn_dt_soitm-prod,
           l_amt     TYPE i,
           l_curr    TYPE  zbhrapn_dt_soitm-curr.
    lt_buyer = VALUE #( ( |{ 12345 }| )
                        ( |{ 12346 }| )
                        ( |{ 12347 }| )
                        ( |{ 12348 }| )
                        ( |{ 12349 }| )
                        ( |{ 12341 }| )
                        ( |{ 12342 }| )
                        ( |{ 12343 }| ) ).
    lt_prod = VALUE #( ( |{ 'BAT' }| )
                        ( |{ 'BAT_IN' }| )
                        ( |{ 'BALL' }| )
                        ( |{ 'BALL_IN' }| )
                        ( |{ 'WICKET' }| )
                        ( |{ 'WICKET_IN' }| )
                        ( |{ 'CAP' }| )
                        ( |{ 'CAP_IN' }| ) ).
    lt_amt = VALUE #( ( |{ 50 }| )
                        ( |{ 500 }| )
                        ( |{ 20 }| )
                        ( |{ 200 }| )
                        ( |{ 60 }| )
                        ( |{ 600 }| )
                        ( |{ 15 }| )
                        ( |{ 150 }| )  ).
    TRY.
        DO 5 TIMES.
          lv_soid = cl_system_uuid=>create_uuid_x16_static( ).
          l_buyer  = VALUE #( lt_buyer[ sy-index ] OPTIONAL ).
          lv_itm_id = 0000000001.
          ls_sohd = VALUE #( soid = lv_soid
                             buyer = l_buyer
                             crtd_by = sy-uname
                             crtd_on = sy-uzeit ).
          DO 8 TIMES.
            l_prod   = VALUE #( lt_prod[ sy-index ] OPTIONAL ).
            l_amt    = VALUE #( lt_amt[ sy-index ] OPTIONAL ).
            IF ( sy-index MOD 2 ) EQ 0 .
              l_curr = 'INR'.
            ELSE.
              l_curr = 'USD'.
            ENDIF.
            ls_soitm = VALUE #( soid = lv_soid
                                item_id = lv_itm_id
                                prod  = l_prod
                                amt   =  l_amt
                                curr  = l_curr
                                crtd_by  = sy-uname
                                crtd_on  = sy-uzeit ).
            APPEND ls_soitm TO lt_soitm.
            lv_itm_id =  lv_itm_id + 1.
            CLEAR:  l_prod, l_amt, l_curr.
          ENDDO.
          APPEND ls_sohd TO lt_sohd.
          clear l_buyer.
        ENDDO.
        MODIFY zbhrapn_dt_sohd FROM TABLE @lt_sohd.
        MODIFY zbhrapn_dt_soitm FROM TABLE @lt_soitm.
        IF sy-subrc = 0.
          out->write( |Records inserted: { sy-dbcnt }| ).
        ELSE.
          out->write( 'Insert operation failed.' ).
        ENDIF.

        "Commit database changes
        COMMIT WORK.
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
