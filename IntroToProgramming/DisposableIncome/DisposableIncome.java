/*  SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 10:   
       Comment:
   2. Did I use easy-to-understand, meaningful CONSTANT names?
       Mark out of 5:  
       Comment:
    3. Did I format the CONSTANT names properly (in UPPERCASE)?
       Mark out of 5:  
       Comment:
   4. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:  
       Comment:
   5. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 10:  
       Comment:
   6. Did I indent the code appropriately?
       Mark out of 10:  
       Comment:
   7. Did I read the input correctly from the user using appropriate question(s)?
       Mark out of 10:  
       Comment:
   8. Did I compute the disposable income correctly?
       Mark out of 10:  
       Comment:
   9. Did I compute the disposable income percentage correctly?
       Mark out of 10:  
       Comment:
   10. Did I output the correct answer in the correct format (as shown in the examples)?
       Mark out of 10:  
       Comment:
   11. How well did I complete this self-assessment?
       Mark out of 10:  
       Comment:
   Total Mark out of 100 (Add all the previous marks):  
*/


import java.util.Scanner;
import java.lang.Math;

public class DisposableIncome {
	final static double TAX_RATE = 0.35;
	public static void main(String[] args) {
		System.out.print("How much are you paid a month before tax? ");
		Scanner input = new Scanner(System.in);
		double income = input.nextDouble();
		System.out.print("How much do you pay in rent/mortgage a month? ");
		double accommodationCosts = input.nextDouble();
		System.out.print("How much does your commute cost a month? ");
		double travelCosts = input.nextDouble();
		System.out.print("How much do you spend on food per month? ");
		double foodCosts = input.nextDouble();
		
		double afterTaxIncome = income - (income * TAX_RATE);
		double disposableIncome = afterTaxIncome - accommodationCosts - travelCosts - foodCosts;
		long percentIncome = Math.round(afterTaxIncome / disposableIncome);
		
		System.out.println("Your monthly disposable income is €" + String.format("%.2f",disposableIncome) + " which is "+percentIncome + "% of your salary.");
		
		input.close();
	}

}
