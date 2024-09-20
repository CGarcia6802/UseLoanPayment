with Ada.Text_IO; use Ada.Text_IO;
with CalculateLoanPayments; use CalculateLoanPayments;


procedure Useloanpayment is
   
   package Int_IO is new Ada.Text_IO.Integer_IO(Integer); use Int_IO;
   package FIO is new Ada.Text_IO.Float_IO(Float); use FIO;
   
   years, balance, interestTotal, yearlyPayments: Integer;
   rate: Float;
   fileIn: File_Type;
   
begin
        
   put ("Enter How Many Years The Loan Will Take To Pay Off : "); get (years); New_Line;
   put ("Enter Total Balance For Loan : $"); get (balance); New_Line;
   put ("Enter The Amount of Annual Payments : "); get (yearlyPayments); New_Line;
   put ("Enter The Interest Rate For The Loan : %"); get (rate); New_Line;

   loanPayment(years, balance, yearlyPayments, rate, interestTotal); --calculates loan payment table
   New_Line; put("Total Interest: $"); put(interestTotal, 1); --produces the total interest

end Useloanpayment;
