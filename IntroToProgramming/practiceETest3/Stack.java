package practiceETest3;
import java.util.ArrayList;

public class Stack {

    ArrayList<Object> stack = new ArrayList<Object>();


    public void push(Object newNum) {
        stack.add(newNum);
    }
    public int pop() {
        if(stack.size() >= 1) {
            int lastItem = (int) stack.get(stack.size()-1);
            stack.remove(stack.size()-1);
            return lastItem;
        }
        else {
            return -1;
        }
    }
    public int peek() {
        if(stack.size() >= 1) {
            int lastItem = (int) stack.get(stack.size()-1);
            //stack.remove(stack.size());
            return lastItem;
        }
        else {
            return -1;
        }
    }
    public int search(Object element) {
        for(int i = stack.size()-1; i >= 0; i --) {
            Object currentVal = stack.get(i);
            if(currentVal == element) {
                return i;
            }
        }
        return -1;
    }
    public void move(Object element) {
        int location = search(element);
        if(location >= 1) {
            stack.remove(location);
            push(element);
        }
    }

}
