package Chuck_A_Luck;

/* SELF ASSESSMENT

1. ResolveBet

I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7].
Comment: ResolveBet is defined and takes the correct imput with the correct output.
My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8: 8].
Comment: IT presents the right amount and asks the user.
My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5: 5].
Comment: The program will ask for input until the user enters valid input.
My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15: 15]..
Comment: It rolls the dice and returns the results.
My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20: 20].
Comment: It determines the winnings and compares bet types.
My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10: 10].
Comment: It outputs the results and adds the winings to the wallet if the user wins or removes the bet amount.

2. Main

I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15: 15]
Comment: It asks the user for cash and creates the wallet with the cash.
My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5: 5]
Comment: It looks until the user quits or it runs out of money.
I ask the user to enter any of the four bet types or quit [Mark out of 5: 5].
Comment: It asks the user for a bet type.
My program calls resolveBet for each bet type entered [Mark out of 5: 5].
Comment: It calls resolve bet for the bet type entered.
At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: 5]
Comment: A summary is presented at the end.

 Total Mark out of 100 (Add all the previous marks): 100
*/
import javax.swing.*;
import java.util.Scanner;

public class Chuck_A_Luck {
    private static final String LOSS_TEXT = "You have lost this round";
    private static final String WIN_TEXT = "You have won, winnings have been deposited to your account";
    private static String[] BET_TYPES = {"Low", "High", "Triple", "Field"};


    public static void resolveBet(String betType, Wallet playerWallet) {
        double walletAmount = playerWallet.check();
        double betAmount = getDouble("You have €" + playerWallet.check() + " in your wallet right now. How much would you like to bet: ");
        while (betAmount > walletAmount) {
            betAmount = getDouble("You have €" + playerWallet.check() + " in your wallet right now. How much would you like to bet, remember you cannot bet more than €" + playerWallet.check() + ": ");
        }
        playerWallet.get(betAmount);
        Dice d1 = new Dice();
        Dice d2 = new Dice();
        Dice d3 = new Dice();

        d1.roll();
        d2.roll();
        d3.roll();
        int rollTotal = d1.topFace() + d2.topFace() + d3.topFace();

        if (betType == "Triple") {
            if (d1.topFace() == d2.topFace() && d2.topFace() == d3.topFace()) {
                if (d1.topFace() == 3 || d1.topFace() == 6) {
                    // lost
                    JOptionPane.showMessageDialog(null, LOSS_TEXT);
                } else {
                    // win
                    playerWallet.put(betAmount + (30 * betAmount));
                    JOptionPane.showMessageDialog(null, WIN_TEXT + ". You now have €" + playerWallet.check());
                }
            } else {
                JOptionPane.showMessageDialog(null, LOSS_TEXT);
            }
        } else if (betType == "Low") {
            if (rollTotal < 11 && !(d1.topFace() == d2.topFace() && d2.topFace() == d3.topFace())) {
                // win
                playerWallet.put(betAmount + betAmount);
                JOptionPane.showMessageDialog(null, WIN_TEXT + ". You now have €" + playerWallet.check());

            } else {
                // loss
                JOptionPane.showMessageDialog(null, LOSS_TEXT);
            }
        } else if (betType == "High") {
            if (rollTotal > 10 && !(d1.topFace() == d2.topFace() && d2.topFace() == d3.topFace())) {
                // win
                playerWallet.put(betAmount + betAmount);
                JOptionPane.showMessageDialog(null, WIN_TEXT + ". You now have €" + playerWallet.check());

            } else {
                // loss
                JOptionPane.showMessageDialog(null, LOSS_TEXT);
            }
        } else if (betType == "Field") {
            if (rollTotal < 8 || rollTotal > 12) {
                // win
                playerWallet.put(betAmount + betAmount);
                JOptionPane.showMessageDialog(null, WIN_TEXT + ". You now have €" + playerWallet.check());

            } else {
                // loss
                JOptionPane.showMessageDialog(null, LOSS_TEXT);
            }
        }

    }
    public static int getBetType() {
        String input = JOptionPane.showInputDialog("Which bet would you like to place? (1 for low, 2 for high, 3 for triple, 4 for field, or type 'quit' to quit):");
        Scanner inputParser = new Scanner(input);
        try {
            if (inputParser.hasNextInt()) {
                int nextNum = inputParser.nextInt();
                if (nextNum >= 1 && nextNum <= 4) {
                    return nextNum;
                } else {
                    return getBetType();
                }
            } else if (inputParser.hasNext("quit")) {
                return 0;
            } else {
                return getBetType();
            }
        } catch (Exception e) {
            return getBetType();
        }
    }

    public static double getDouble(String message) {
        String input = JOptionPane.showInputDialog(message);
        Scanner inputParser = new Scanner(input);
        try {
            if (inputParser.hasNextDouble()) {
                double nextNum = inputParser.nextDouble();
                if (nextNum > 0) {
                    return nextNum;
                } else {
                    return getDouble(message);
                }
            } else {
                return getDouble(message);
            }
        } catch (Exception e) {
            return getDouble(message);
        }

    }
    public static void main(String[] args) {
        Wallet playerWallet = new Wallet();
        double initWallet = getDouble("How much money would you like in your wallet to begin?");
        playerWallet.put(initWallet);
        boolean quit = false;
        do {
            int bet = getBetType();
            if (bet == 0) {
                quit = true;
            } else {
                resolveBet(BET_TYPES[bet - 1], playerWallet);
            }
        } while (!quit && playerWallet.check() > 0);
        JOptionPane.showMessageDialog(null, "Game Over! You started with €" + initWallet + ", you now have €" + playerWallet.check());
    }
}
