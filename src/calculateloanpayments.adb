package body CalculateLoanPayments is
   
   months, balance, newBalance, payment, yearlyPayments, towardsLoan, interestPaid: Integer;
   newRate, actualInterest, part1, part2, part3, part4, part5, towardsLoanRaw: float;
   fileOut, fileIn: File_Type;

   procedure loanPayment (years, principal, yearlyPayments: in integer; rate: in float; interest: in out integer) is 
   begin
      
      Put_Line("Enter a Name for the Copy of File for Truth in Lending Report: ");
      Skip_Line; New_Line;
      
      declare
         
         name1: String := Get_Line;
         
      begin
         
         Create (File => fileOut, Mode => Out_File, Name => name1 & ".txt"); --WRITE
         
      end;
      
      put (fileOut, "| Month | Balance | Payment | Interest | Loan Pay | New Balance | "); put (fileOut, ASCII.LF);
      
      for I in 1..65 loop
         put(fileOut, "-");
      end loop;
      
      put (fileOut, ASCII.LF);
      
      actualInterest := rate / 100.00;
      newRate := actualInterest / Float(yearlyPayments); --calculating the interest
      months := years * 12; --calculating months/payments
      balance := principal; --due to the in constraint and needing to re-enter the new balance into balance for next month,
                            --we pass off principal into balance
   
      --block of code that calculates the monthly payment, split into multiple parts due to an indexed component constraint;
      part1 := ((1.0 + newRate)**months); 
      part2 := (float(balance) * part1);
      part3 := (newRate * part2);
      part4 := (part1 - 1.0);
      part5 := (part3 / part4);
      payment := integer(Float'Ceiling(part5)); --calculated monthly payment
      
      for I in 1..months loop
         put (fileOut, "| "); put (fileOut, I, 5); put (fileOut, " | "); put (fileOut, balance, 7); put (fileOut, " | "); 

         towardsLoanRaw := newRate * Float(balance); --calculating the Towards Loan payment
         towardsLoan := Integer(towardsLoanRaw);

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


         put (fileOut, payment, 7); put (fileOut, " | "); put (fileOut, interestPaid, 8); put (fileOut, " | ");
         put(fileOut, towardsLoan, 8); put (fileOut, " | "); put(fileOut, newBalance, 11); put (fileOut, " |"); put (fileOut, ASCII.LF);

      end loop;
      
      Close (File => fileOut); --end of WRITE
      
      Put_Line("Enter the Name of the File for Truth in Lending Report for Printing: "); New_Line;
      
      declare
         
         name2: String := Get_Line;
         
      begin
         
         Open (File => fileIn, Mode => In_File, Name => name2 & ".txt"); --READ
         
      end;
      
      while not End_Of_File (fileIn) loop
      Put_Line (Get_Line (fileIn));
      end loop;
      
      Close (File => fileIn); --end of READ
      
   end loanPayment;

end CalculateLoanPayments;
