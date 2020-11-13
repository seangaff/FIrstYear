package labHW1;

/* SELF ASSESSMENT
   1.  createSequence:
	Did I use the correct method definition?
		Mark out of 5: 5
		Comment: Yes, methods take integer input and returns int array.
	Did I create an array of size n (passed as the parameter) and initialise it?
		Mark out of 5: 5
		Comment: Yes I created an array of size n and initialized it.
	Did I return the correct item?
		Mark out of 5: 5
		Comment: Yes I returned int array.
   2.  crossOutMultiples
	Did I use the correct method definition?
		Mark out of 5: 5
		Comment: Yes, takes int[] and int as parameters and returns new int[].
	Did I ensure the parameters are not null and one of them is a valid index into the array
		Mark out of 2: 2
		Comment: Yes it checks for array length and that array is valid.
	Did I loop through the array using the correct multiple?
		Mark out of 5: 5
		Comment: Yes, I Loop through array to determine if multiples are present.
	Did I cross out correct items in the array that were not already crossed out?
		Mark out of 3: 3
		Comment: Yes it checks that elements are not already crossed out.
   3.  sieve
	Did I have the correct function definition?
		Mark out of 5: 5
		Comment: Yes it takes int N and returns int[] with non primes crossed out.
	Did I make calls to other methods?
		Mark out of 5: 5
		Comment: Created sequence, crossed out higher multiples.
	Did I return an array with all non-prime numbers are crossed out?
		Mark out of 2: 2
		Comment: Yes, iterated through all primes to make sure non-primes were crossed out.
   4.  sequenceTostring
	Did I have the correct function definition?
		Mark out of 5: 5
		Comment: Took int[] returned String of array with non-primes formatted correctly.
	Did I ensure the parameter to be used is not null?
		Mark out of 3:3
		Comment: It checks that input array has length > 0.
	Did I Loop through the array updating the String variable with the non-crossed out numbers and the crossed numbers in brackets?
		Mark out of 10: 10
		Comment: An if statement is used to format output for each character.
   5.  nonCrossedOutSubseqToString
	Did I have the correct function definition
		Mark out of 5: 5
		Comment: Yes, takes int[] returns string of array.
	Did I ensure the parameter to be used is not null?
		Mark out of 3: 3
		Comment: It checks that the array exists.
	Did I loop through the array updating the String variable with just the non-crossed out numbers?
		Mark out of 5: 5
		Comment: basic if statement is used, similar to previous except we don't care about what happens to negatives.
   6.  main
	Did I ask  the user for input n and handles input errors?
		Mark out of 5: 5
		Comments: The getInt() method handles input.
	Did I make calls to other methods (at least one)?
		Mark out of 5: 5
		Comment: Called sieve command then used the resulting array to find noncrossed out string.
	Did I print the output as shown in the question?
		Mark out of 5: 5
		Comment: Printed to JOptionPane.
   7.  Overall
	Is my code indented correctly?
		Mark out of 4: 4
		Comments: My code is correctly indented.
	Do my variable names make sense?
		Mark out of 4: 4
		Comments: All variables are descriptive.
	Do my variable names, method names and class name follow the Java coding standard
		Mark out of 4: 4
		Comments: All follow coding standards.
      Total Mark out of 100 (Add all the previous marks):100
*/

import javax.swing.*;
import java.util.Arrays;
import java.util.Scanner;


public class SieveOfEratosthenes {
    private static String responseText = "";

    public static void main(String[] args) {
        int[] array = sieve(getInt());
        JOptionPane.showMessageDialog(null, responseText+"\nPrimes as found by sieve:\n"+"<html><b><h3>"+nonCrossedOutSubseqToString(array)+"</h3></b></html>");
    }
    public static int[] createSequence(int var_N){
        int[] sequence = new int[0];
        for (int i = 2; i <= var_N; i++) {
            sequence = Arrays.copyOf(sequence, sequence.length+1);
            sequence[sequence.length-1] = i;
        }
        sequenceToString(sequence);
        return sequence;
    }
    public static int[] crossOutHigherMultiples(int[] numArr, int n){
        if(numArr.length != 0){
            for (int i = 0; i < numArr.length; i++) {
                if(numArr[i]%n==0 && numArr[i]!=n && numArr[i]>0){
                    numArr[i]*=-1;
                }
            }
            return numArr;
        } else return numArr;

    }
    public static int[] sieve(int var_N){
        int[] array = createSequence(var_N);
        for (int i = 0; i < array.length; i++) {
            if(array[i]>0 && array[i] <= Math.sqrt(var_N)){
                array = crossOutHigherMultiples(array, array[i]);
                sequenceToString(array);
            }
        }
        return array;
    }
    public static String sequenceToString(int[] numArr){
        String outputString = "";
        if(numArr.length>0) {
            for (int i = 0; i < numArr.length; i++) {
                if (numArr[i] < 0) {
                    outputString += "[" + (-1) * numArr[i] + "]";
                } else {
                    outputString += numArr[i];
                }
                outputString += ", ";
            }
            outputString = outputString.substring(0, outputString.length() - 2);
            responseText += outputString + "\n";
        }
        return outputString;
    }
    public static String nonCrossedOutSubseqToString(int[] numArr){
        String outputString = "";
        if(numArr.length>0){
            for (int i = 0; i < numArr.length; i++) {
                if(numArr[i]>0) {
                    outputString += numArr[i];
                    outputString += ", ";
                }
            }
        }

        outputString = outputString.substring(0, outputString.length()-2);
        return outputString;
    }
    public static int getInt(){
        try{
            String input = JOptionPane.showInputDialog("Please enter an integer greater than 2: ");
            Scanner inputParser = new Scanner(input);

            if(inputParser.hasNextInt()){
                int num = inputParser.nextInt();
                if(num >=2){
                    return num;
                } else return getInt();
            } else return getInt();
        } catch(Exception except) {
            System.out.println("Error in input parser, attempting again.");
            return getInt();
        }
    }
}