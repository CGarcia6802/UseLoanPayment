package body CalculateLoanPayments is
   
   months, balance, newBalance, payment, towardsLoan, interestPaid: Integer;
   actualInterest, p, a, ay, y, pay, tl, inter: float;
   file: File_Type;

   procedure loanPayment (principal, years: in integer; rate: in float; interest: in out integer) is 
   begin
     
      Create(File => file, Mode => Out_File, Name => "JonesCarLoanOctober2024.txt");
      
      put (file, "| Month | Balance | Payment | Interest | Loan Pay | New Balance | "); put (file, ASCII.LF);
      put ("| Month | Balance | Payment | Interest | Loan Pay | New Balance | "); New_Line;
      
      for I in 1..65 loop
         put(file, "-"); put("-");
      end loop;
      put (file, ASCII.LF); New_Line;
      
      actualInterest := rate / 100.00;
      inter := actualInterest / 12.00; --calculating the interest
      months := years * 12; --calculating months/payments
      balance := principal;
   
      p := (((1.0 + inter)**months) - 1.0); --calculates monthly payment
      ay := ((1.0 + inter)**months);
      a := (inter * ay);
      y := p / a;
      pay := Float(balance) / y;
      payment := integer(pay);
      
      for I in 1..months loop
         put (file, "| "); put (file, I, 5); put (file, " | "); put (file, balance, 7); put (file, " | "); 
         put ("| "); put (I, 5); put (" | "); put (balance, 7); put (" | ");

         tl := inter * Float(balance); --calculating the Towards Loan payment
         towardsLoan := Integer(tl);

         interestPaid := payment - towardsLoan; --calculating the interest payment
         interest := interest + interestPaid;
         newBalance := balance - interestPaid; --to be shown in report
         balance := newBalance; --new Balance put into Balance for next loop

         if (I = months and then newBalance > payment) then --adjusting the final payment to the exact value of the New Balance if it happens to be the last month
            payment := newBalance; towardsLoan := payment - interestPaid; newBalance := 0;            
         end if;



         if (newBalance <= 0) then
            newBalance := 0; payment := 0;
         end if;


         put (file, payment, 7); put (file, " | "); put (file, interestPaid, 8); put (file, " | ");
         put(file, towardsLoan, 8); put (file, " | "); put(file, newBalance, 11); put (file, " |"); put (file, ASCII.LF);
         put (payment, 7); put (" | "); put (interestPaid, 8); put (" | ");
         put(towardsLoan, 8); put (" | "); put(newBalance, 11); put (" |");
         New_Line;


      end loop;
      
      close (File => file);
      
   end loanPayment;

end CalculateLoanPayments;
