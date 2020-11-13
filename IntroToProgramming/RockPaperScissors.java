/* SELF ASSESSMENT
   1. Did I use appropriate easy-to-understand, meaningful variables and CONSTANTS within the code? 
       Mark out of 10: 10
       Comment: Yes, all variable names and CONSTANTS are clearly named and recognizable. 
   2. Did I format the variable and CONSTANT names appropriate (in lowerCamelCase and UPPERCASE)?
       Mark out of 5: 5
       Comment: Yes, all variable and CONSTANTS are formatted correctly.
   3. Did I generate the computer's choice in each game correctly using a Random number generator?
       Mark out of 10: 10
       Comment: Yes, the computer correctly chooses a number between 1 and 3 each time.
   4. Did I input the user's choice in each game correctly?
       Mark out of 10: 10
       Comment: Yes, the uses choice of 1, 2, or 3 is correctly correlated to rock, paper, and scissors.
   5. Did I correctly compare the choices and update the score appropriately?
       Mark out of 20: 20
       Comment: Yes, I used a series of if statements to correctly decide if the player, computer, or neither gained a point each round. 
   6. Did I inform the user of who won each game (and why) correctly?
       Mark out of 10: 10
       Comment: Yes, the game prints out the final score and the end of the 5 turns. 
   7. Did I use an appropriate for loop to allow the player to play 5 games?  There should be only one loop.
       Mark out of 20: 20
       Comment: Yes, I used a single for loop to allow the player to play 5 rounds of the game.
   8. Did I output the final scores correctly after the 5 games were played. 
       Mark out of 10: 10
       Comment:Yes, the game prints out the final score and the end of the 5 turns. 
   9. How well did I complete this self-assessment?
       Mark out of 5:5
       Comment: I thoroughly checked my work and commented on why I gave myself each score. 
   Total Mark out of 100 (Add all the previous marks): 100
*/

import java.util.Scanner;
import java.util.Random;

public class RockPaperScissors {
	
	public static final int MAX_ROUND = 5;
	public static final int MAX_GUESS = 3;

	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		Random  generator = new Random();
		
		int computerScore = 0;
		int playerScore = 0;
		
		for( int round = 0; round < MAX_ROUND; round++) {
			System.out.print("Enter 1 (for Rock) or 2 (for Paper) or 3 (for Scissors): ");
			int playerChoice = input.nextInt();
			int computerChoice = generator.nextInt(MAX_GUESS)+1;

			if (computerChoice == 1) {
				if (playerChoice == 3) {
					System.out.println("You lost this round as I chose Rock");
					computerScore++;
				}
				else if (playerChoice == 2) {
					System.out.println("You won this round as I chose Rock");
					playerScore++;
				}
				else {
					System.out.println("This round was a draw as I chose Rock too");
				}
			}
			else if (computerChoice == 2) {
				if (playerChoice == 1) {
					System.out.println("You lost this round as I chose Paper");
					computerScore++;
				}
				else if (playerChoice == 3) {
					System.out.println("You won this round as I chose Paper");
					playerScore++;
				}
				else {
					System.out.println("This round was a draw as I chose Paper too");
				}
				
			}
			else if (computerChoice == 3) {
				if (playerChoice == 2) {
					System.out.println("You lost this round as I chose Scissors");
					computerScore++;
				}
				else if (playerChoice == 1) {
					System.out.println("You won this round as I chose Scissors");
					playerScore++;
				}
				else {
					System.out.println("This round was a draw as I chose Scissors too");
				}
			}
		}
		
		System.out.println("The final score was Computer: " + computerScore + " User: " + playerScore);	
		
		input.close();
	}

}
