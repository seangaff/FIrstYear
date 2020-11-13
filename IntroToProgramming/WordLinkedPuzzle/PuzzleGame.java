package WordLinkedPuzzle;

/* SELF ASSESSMENT

1. readDictionary
- I have the correct method definition [Mark out of 5:5]
- Comment: I have the correct method definition.
- My method reads the words from the "words.txt" file. [Mark out of 5:5]
- Comment: Yes it reads the words from the .txt file.
- It returns the contents from "words.txt" in a String array or an ArrayList. [Mark out of 5:5]
- Comment: it returns an arraylist of the contents.

2. readWordList
- I have the correct method definition [Mark out of 5:5]
- Comment: Yes, I have the correct method definition.
- My method reads the words provided (which are separated by commas, saves them to an array or ArrayList of String references and returns it. [Mark out of 5:5]
- Comment: Read the comma seperated words and saves them to an arraylist.

3. isUniqueList
- I have the correct method definition [Mark out of 5:5]
- Comment: Yes I have the correct method definition.
- My method compares each word in the array with the rest of the words in the list. [Mark out of 5:5]
- Comment: Each word is compared against the list.
- Exits the loop when a non-unique word is found. [Mark out of 5:5]
- Comment: The loop is exited when a non-unique word is found.
- Returns true is all the words are unique and false otherwise. [Mark out of 5:5]
- Comment: Yes, returns false unless all words are unique.

4. isEnglishWord
- I have the correct method definition [Mark out of 5:5]
- Comment: Yes I have the correct method definition.
- My method uses the binarySearch method in Arrays library class. [Mark out of 3:3]
- Comment: Yes it uses the binarySearch method.
- Returns true if the binarySearch method return a value >= 0, otherwise false is returned. [Mark out of 2:2]
- Comment: Returns true if value is >= 0.

5. isDifferentByOne
- I have the correct method definition [Mark out of 5:5]
- Comment: Yes I have the correct method definition.
- My method loops through the length of a words comparing characters at the same position in both words searching for one difference. [Mark out of 10:10]
- Comment: Yes it loops through each character in the string and compares them for differences.

6. isWordChain
- I have the correct method definition [Mark out of 5:5]
- Comment: Yes I have the correct method definition.
- My method calls isUniqueList, isEnglishWord and isDifferentByOne methods and prints the appropriate message [Mark out of 10:10]
- Comment: Calls all correct methods and prints output.

7. main
- Reads all the words from file words.txt into an array or an ArrayList using the any of teh Java.IO classes covered in lectures [Mark out of 10:10]
- Comment: Reads all words into an arraylist.
- Asks the user for input and calls isWordChain [Mark out of 5:5]
- Comment: Prompts for imput and calls method.

 Total Mark out of 100 (Add all the previous marks): 100
*/

import java.io.*;
import java.util.Scanner;
import java.util.Set;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;

public class PuzzleGame{
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        ArrayList<String> dictionary = new ArrayList<String>();

        try{
            FileReader fileReader = new FileReader("dictionary.txt");
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            dictionary = readDictionary(bufferedReader);
        } catch (Exception e){
            System.out.print(e);
        }

        boolean finished = false;
        while(!finished){
            System.out.print("Enter your list of words: ");
            String words = in.nextLine();

            if(words.equals("")){
                finished = true;
            } else {
                ArrayList<String> wordList = readWordList(words);

                if (isWordChain(wordList, dictionary)){
                    System.out.println("Valid chain of words from Lewis Carroll's word-links game.");
                }
                else {
                    System.out.println("Not a valid chain of words from Lewis Carroll's word-links game.");
                }
            }
        }
    }

    public static ArrayList<String> readDictionary(BufferedReader dictionary){
        ArrayList<String> dictionaryList = new ArrayList<String>();
        try {
            String nextWord = dictionary.readLine();
            while(nextWord != null){
                dictionaryList.add(nextWord);
                nextWord = dictionary.readLine();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return dictionaryList;
    }

    public static ArrayList<String> readWordList(String words){
        ArrayList<String> wordList = new ArrayList<String>();
        Scanner seperator = new Scanner(words);
        seperator.useDelimiter(",");
        while(seperator.hasNext()){
            wordList.add(seperator.next());
        }
        return wordList;
    }

    public static boolean isUniqueList(ArrayList<String> wordList){
        Set<String> set = new HashSet<String>(wordList);
        if(set.size() < wordList.size()) return false;
        else return true;
    }

    public static boolean isEnglishWord(String word, ArrayList<String> dictionaryList){
        String[] dictionaryArray = dictionaryList.toArray(new String[dictionaryList.size()]);
        if(Arrays.binarySearch(dictionaryArray, word) >= 0) return true;
        else return false;
    }

    public static boolean isDifferentByOne(String wordOne, String wordTwo){
        if(wordOne.length() == wordTwo.length()){
            boolean oneDiff =  false;
            for(int i = 0; i < wordOne.length(); i++){
                if(wordOne.charAt(i) != wordTwo.charAt(i)) {
                    if(oneDiff)
                        return false;
                    else
                        oneDiff = true;
                }
            }
            return true;
        }
        return false;
    }

    public static boolean isWordChain(ArrayList<String> wordList, ArrayList<String> dictionary){
        if(isUniqueList(wordList)){
            for(int i = 0; i < wordList.size()-1; i++){
                if(isEnglishWord(wordList.get(i), dictionary) && isEnglishWord(wordList.get(i+1), dictionary)){
                    if(!isDifferentByOne(wordList.get(i), wordList.get(i+1))) return false;
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
        return true;
    }
}
