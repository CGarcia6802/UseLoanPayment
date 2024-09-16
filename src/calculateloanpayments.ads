with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;

package CalculateLoanPayments is
   
   package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;
   package FIO is new Ada.Text_IO.Float_IO(Float); use FIO;

   procedure loanPayment (principal, years: in integer; rate: in float; interest: in out integer);

end CalculateLoanPayments;
