      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. GESTOR_CUENTAS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SALDO PIC 9(7)V99 VALUE 0.
       01 OPCION PIC 9 VALUE 0.
       01 MONTO PIC 9(7)V99 VALUE 0.

       PROCEDURE DIVISION.
       DISPLAY "Sistema de Administración de Cuentas Bancarias"
       PERFORM MENU
       DISPLAY "Saldo final: " SALDO
       DISPLAY "Fin del programa."
       STOP RUN.

       MENU.
       DISPLAY "1. Agregar cuenta"
       DISPLAY "2. Depositar fondos"
       DISPLAY "3. Retirar fondos"
       DISPLAY "4. Salir"
       ACCEPT OPCION
       IF OPCION = 1
        PERFORM AGREGAR-CUENTA
       ELSE IF OPCION = 2
        PERFORM DEPOSITAR-FONDOS
       ELSE IF OPCION = 3
        PERFORM RETIRAR-FONDOS
       ELSE IF OPCION = 4
           EXIT
       ELSE
        PERFORM MENU
       END-IF.

       AGREGAR-CUENTA.
       DISPLAY "Ingrese el monto inicial:"
       ACCEPT MONTO
       ADD MONTO TO SALDO
       PERFORM MENU.

       DEPOSITAR-FONDOS.
       DISPLAY "Ingrese el monto a depositar:"
       ACCEPT MONTO
       ADD MONTO TO SALDO
       PERFORM MENU.

       RETIRAR-FONDOS.
       DISPLAY "Ingrese el monto a retirar:"
       ACCEPT MONTO
       IF MONTO > SALDO
        DISPLAY "Fondos insuficientes"
       ELSE
        SUBTRACT MONTO FROM SALDO
       END-IF
       PERFORM MENU.
