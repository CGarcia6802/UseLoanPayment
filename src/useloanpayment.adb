with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Useloanpayment is

   b, balance, payment, towardsLoan, interestPaid, interestTotal, newBalance: integer;
   tl, inter, actualInterest, interest: float;


begin

   put ("Enter How Many Months The Loan Will Take To Pay Off : "); get (b); New_Line;
   put ("Enter Total Balance For Loan : $"); get (balance); New_Line;
   put ("Enter The Interest Rate For The Loan (Float) : %"); get (inter); New_Line;
   put ("Enter The Monthly Payment : $"); get (payment); New_Line;

   actualInterest := inter / 100.00;
   interest := actualInterest / 12.00; --calculating the amount of payment
   put ("Month / "); put("Balance / "); put("Payment T "); put("Interest / "); put ("Loan Pay / "); put ("New Balance");
   New_Line;New_Line;

   for I in 1..b loop
      put (I, 3); put (" | "); put (Balance, 6); put (" | ");

      tl := interest * Float(balance); --calculating the Towards Loan payment
      towardsLoan := Integer(tl);
      interestPaid := payment - towardsLoan; --calculating the interest payment
      interestTotal := interestTotal + interestPaid;


      if (I = b and then newBalance > payment) then --adjusting the final payment to the exact value of the New Balance if it happens to be the last month
         payment := newBalance; towardsLoan := payment - interestPaid; newBalance := 0;
      else
         newBalance := balance - interestPaid; --to be shown in report
         Balance := newBalance; --new Balance put into Balance for next loop
      end if;



      if (newBalance <= 0) then
         newBalance := 0;
      end if;


      put (payment, 6); put (" | "); put (interestPaid, 4); put (" | "); put(towardsLoan, 4); put (" | "); put(newBalance, 6);
      New_Line;

      if (newBalance = 0) then
         New_Line; put("Total Interest: "); put(interestTotal);
         exit;

      end if;


   end loop;

end Useloanpayment;
