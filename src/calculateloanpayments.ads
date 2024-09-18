with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;

package CalculateLoanPayments is
   
   package IIO is new Ada.Text_IO.Integer_IO(Integer); use IIO;
   package FIO is new Ada.Text_IO.Float_IO(Float); use FIO;
   
   --function monthlyPayment (years, principal: in integer; rate: in float) return float;

   procedure loanPayment (years, principal, yearlyPayments: in integer; rate: in float; interest: in out integer);

end CalculateLoanPayments;
