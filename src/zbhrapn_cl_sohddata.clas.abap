CLASS zbhrapn_cl_sohddata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbhrapn_cl_sohddata IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA : lt_sohd TYPE TABLE OF zbhrapn_dt_sohd.
    TRY.
        lt_sohd = VALUE #( ( soid = cl_system_uuid=>create_uuid_x16_static( )
                             buyer = '12345'
                             crtd_by = sy-uname
                             crtd_on = sy-uzeit )
                             ( soid = cl_system_uuid=>create_uuid_x16_static( )
                             buyer = '12346'
                             crtd_by = sy-uname
                             crtd_on = sy-uzeit )
                             ( soid = cl_system_uuid=>create_uuid_x16_static( )
                             buyer = '12347'
                             crtd_by = sy-uname
                             crtd_on = sy-uzeit )
                             ( soid = cl_system_uuid=>create_uuid_x16_static( )
                             buyer = '12348'
                             crtd_by = sy-uname
                             crtd_on = sy-uzeit ) ).
        MODIFY zbhrapn_dt_sohd FROM TABLE @lt_sohd.
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
