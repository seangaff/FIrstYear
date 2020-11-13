
import java.util.Scanner;

public class NumberTutorial {
	public static void main(String[] args) {
		System.out.println("Enter 3 numbers you want the average and standard deviation of: ");
		System.out.print("enter the first number: ");
		Scanner input = new Scanner(System.in);
		double number1 = input.nextDouble();
		System.out.print("enter the second number: ");
		double number2 = input.nextDouble();
		System.out.print("enter the third number: ");
		double number3 = input.nextDouble();
		double average = (number1 + number2 + number3) / 3;
		System.out.println("The average of the 3 numbers is: " + average);
		double standardDeviation = (((average - number1)(average - number1))((average - number2)(average - number2))((average - number3)(average - number3))) / 3;
	}

}
