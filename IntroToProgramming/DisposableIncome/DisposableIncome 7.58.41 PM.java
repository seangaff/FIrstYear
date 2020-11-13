/*  SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 10: 10  
       Comment: Used a constant to declare the tax rate.
   2. Did I use easy-to-understand, meaningful CONSTANT names?
       Mark out of 5:  5
       Comment: Yes it's easy to understand the constant repersents the tax rate.
    3. Did I format the CONSTANT names properly (in UPPERCASE)?
       Mark out of 5:  5
       Comment:
   4. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:  10
       Comment: Every variable name is specific.
   5. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 10:  10
       Comment:
   6. Did I indent the code appropriately?
       Mark out of 10:  10
       Comment:
   7. Did I read the input correctly from the user using appropriate question(s)?
       Mark out of 10:  10
       Comment: Each question is clear and the input is correctly read with scanners.
   8. Did I compute the disposable income correctly?
       Mark out of 10: 10
       Comment:
   9. Did I compute the disposable income percentage correctly?
       Mark out of 10:  10
       Comment:
   10. Did I output the correct answer in the correct format (as shown in the examples)?
       Mark out of 10:  10
       Comment: The output is exactly the same as the exampe
   11. How well did I complete this self-assessment?
       Mark out of 10:  10
       Comment: I check all my code, and added comments anywhere I thought necessary.
   Total Mark out of 100 (Add all the previous marks):  100
*/


import java.util.Scanner;
import java.lang.Math;

public class DisposableIncome {
	final static double TAX_RATE = 0.35;
	public static void main(String[] args) {
		System.out.print("How much are you paid a month before tax? ");
		Scanner input = new Scanner(System.in);
		double grossIncome = input.nextDouble();
		System.out.print("How much do you pay in rent/mortgage a month? ");
		double accommodationCosts = input.nextDouble();
		System.out.print("How much does your commute cost a month? ");
		double travelCosts = input.nextDouble();
		System.out.print("How much do you spend on food per month? ");
		double foodCosts = input.nextDouble();
		
		double afterTaxIncome = grossIncome - (grossIncome * TAX_RATE);
		double disposableIncome = afterTaxIncome - accommodationCosts - travelCosts - foodCosts;
		long percentIncome = Math.round((disposableIncome / grossIncome) * 100);
		
		System.out.println("Your monthly disposable income is €" + String.format("%.2f",disposableIncome) + " which is "+percentIncome + "% of your salary.");
		
		input.close();
	}

}
