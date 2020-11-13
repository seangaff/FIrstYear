package practiceETest3;

public class StackTest {
    public static void main(String[] args) {
        Stack testStack = new Stack();
        for(int i = 1; i <= 10; i++) {
            testStack.push(i);
        }
        System.out.println(testStack.pop());
        System.out.println(testStack.peek());
        System.out.println(testStack.search(4));
        testStack.move(5);
        System.out.println(testStack.peek());

    }
}
