/*  SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 10: 10  
       Comment: Used a constant to declare the tax rate.
   2. Did I use easy-to-understand, meaningful CONSTANT names?
       Mark out of 5:  5
       Comment: Yes it's easy to understand the constant repersents the tax rate.
    3. Did I format the CONSTANT names properly (in UPPERCASE)?
       Mark out of 5:  5
       Comment: Yes I did format the CONSTANT names properly.
   4. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:  10
       Comment: Every variable name is specific.
   5. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 10:  10
       Comment: Yes I did format the variable names correctly in lowerCamelCase.
   6. Did I indent the code appropriately?
       Mark out of 10:  10
       Comment: Yes all code is indented properly to be easily readable.
   7. Did I read the input correctly from the user using appropriate question(s)?
       Mark out of 10:  10
       Comment: Each question is clear and the input is correctly read with scanners.
   8. Did I compute the disposable income correctly?
       Mark out of 10: 10
       Comment: Yes the disposable income is computed correctly.
   9. Did I compute the disposable income percentage correctly?
       Mark out of 10:  10
       Comment: yes the disposable income percentage is computed correctly.
   10. Did I output the correct answer in the correct format (as shown in the examples)?
       Mark out of 10:  10
       Comment: The output is exactly the same as the example.
   11. How well did I complete this self-assessment?
       Mark out of 10:  10
       Comment: I checked all my code, and added comments anywhere I thought necessary.
   Total Mark out of 100 (Add all the previous marks):  100
*/


import java.util.Scanner;
import java.lang.Math;

public class DisposableIncome {
	final static double TAX_RATE = 0.35;
	final static double AVERAGE_DISPOSABLE_INCOME = 500;
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
		
		if(disposableIncome <= 0) {
			System.out.println("You have no disposable income.");
		}
		else if(disposableIncome < AVERAGE_DISPOSABLE_INCOME/2) {
			System.out.println("You have much less then the average disposable income per month.");
		}
		else if(disposableIncome < AVERAGE_DISPOSABLE_INCOME) {
			System.out.println("You have less then the average disposable income per month.");
		}
		else if(disposableIncome == AVERAGE_DISPOSABLE_INCOME) {
			System.out.println("You have the average disposable income per month.");
		}
		else if(disposableIncome < AVERAGE_DISPOSABLE_INCOME * 1.5) {
			System.out.println("You have more then the average disposable income per month.");
		}
		else if(disposableIncome > AVERAGE_DISPOSABLE_INCOME * 1.5) {
			System.out.println("You have much more then the average disposable income per month.");
		}
		
		input.close();
	}

}
