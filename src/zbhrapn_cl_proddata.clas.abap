CLASS zbhrapn_cl_proddata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBHRAPN_CL_PRODDATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : lt_prod TYPE TABLE OF zbhrapn_dt_prod.
    TRY.
        lt_prod = VALUE #( (  client = sy-mandt
                              prod_id = 'BAT'
                              descpt  = 'BAT to play'
                              price   = '20.89'
                              currency = 'USD' )
                              (  client = sy-mandt
                              prod_id = 'BALL'
                              descpt  = 'BALL to play'
                              price   = '10.95'
                              currency = 'USD' )
                              (  client = sy-mandt
                              prod_id = 'WICKET'
                              descpt  = 'WICKET to play'
                              price   = '5.00'
                              currency = 'USD' )
                              (  client = sy-mandt
                              prod_id = 'CAP'
                              descpt  = 'CAP'
                              price   = '2.00'
                              currency = 'USD' )
                            (  client = sy-mandt
                              prod_id = 'BAT_IN'
                              descpt  = 'BAT to play'
                              price   = '208.9'
                              currency = 'INR' )
                              (  client = sy-mandt
                              prod_id = 'BALL_IN'
                              descpt  = 'BALL to play'
                              price   = '109.5'
                              currency = 'INR' )
                              (  client = sy-mandt
                              prod_id = 'WICKET_IN'
                              descpt  = 'WICKET to play'
                              price   = '50.0'
                              currency = 'INR' )
                              (  client = sy-mandt
                              prod_id = 'CAP_IN'
                              descpt  = 'CAP'
                              price   = '20.0'
                              currency = 'INR' )     ).
        MODIFY zbhrapn_dt_prod FROM TABLE @lt_prod.
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
