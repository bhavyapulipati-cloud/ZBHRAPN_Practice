CLASS zbhrapn_cl_gen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbhrapn_cl_gen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : l_str TYPE string,
           l_out TYPE string.
    l_str = 'SAP ABAP'.
    DATA(l_len) = strlen( l_str ).
    DO l_len TIMES.
      l_len = l_len - 1.
      IF l_len GE 0.
        l_out =  |{ l_out }{ l_str+l_len(1) }| .
      ENDIF.
    ENDDO.

    out->write( l_out ).

    DATA(lt_tab) =  VALUE string_table( ( |{ 1001 }| )
                        ( |{ 1002 }| )
                        ( |{ 1003 }| )
                        ( |{ 1002 }| )
                        ( |{ 1004 }| )
                        ( |{ 1001 }| )
                          ).

    LOOP AT lt_tab INTO DATA(ls_line).
      DATA(l_cnt) = REDUCE i( INIT count = 0
                              FOR wa IN lt_tab
                              WHERE ( table_line = ls_line )
                              NEXT count = count + 1 ).
      IF l_cnt GT 1.
        out->write( ls_line ).
        DELETE lt_tab WHERE table_line EQ ls_line.
      ENDIF.
    ENDLOOP.

    DATA lt_int TYPE TABLE OF i .
    lt_int = VALUE #( ( 10 )
                      ( 25 )
                      ( 40 )
                      ( 40 )
                      ( 15 )
                      ( 30 ) ).
    SORT lt_int.
    DELETE ADJACENT DUPLICATES FROM lt_int.
    DATA(l_tot) = lines( lt_int ).
    DATA(l_2h) = l_tot - 1.
    DATA(l_2hv) = lt_int[ l_2h ].
    out->write( l_2hv ).

    DATA(lt_emp) = VALUE string_table( ( |{  'IT: 5000'  }| )
                                       ( |{  'HR: 4000'  }| )
                                       ( |{  'IT: 6000'  }| )
                                       ( |{  'HR: 3000'  }| )   ).
    TYPES: BEGIN OF ty_emp,
              dep TYPE string,
              sal TYPE string,
            END OF ty_emp.
    data : ls_empt type ty_emp,
           lt_empt type table of ty_emp,
           lt_dept TYPE TABLE of ty_emp,
           l_sal   TYPE i.
   LOOP At lt_emp INTO data(ls_emp).
    split ls_emp at ':' into ls_empt-dep ls_empt-sal.
    APPEND ls_empt to lt_empt.
    CLEAr : ls_empt, ls_emp.
   ENDLOOP.
     sort lt_empt by dep.
     LOOP At lt_empt INTO ls_empt.

     ENDLOOP.


  ENDMETHOD.
ENDCLASS.
