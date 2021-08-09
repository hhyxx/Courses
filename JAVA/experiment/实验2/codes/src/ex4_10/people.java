package ex4_10;

public class people{
    int leg,hand;
    String name;
    people (String s){
        name=s;
        this.init();   
    }
    void init(){
       leg=2;
       hand=2;
    }
    void set_hand(int x) {
		this.hand=x;
    }
    void set_leg(int x) {
		this.leg=x;
    }
    String get_name() {
    	return this.name;
    }
    Integer get_hand() {
		return this.hand;
    }
    Integer get_leg() {
		return this.leg;
    }
    public static void main(String args[]){
        people boshi=new people("布什"); 
        boshi.set_hand(3);
        boshi.set_leg(1);
        System.out.print(boshi.get_name()+"有"+boshi.get_hand()+"只手"+boshi.get_leg()+"条腿");

    }
}

