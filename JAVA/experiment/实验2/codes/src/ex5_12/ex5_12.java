package ex5_12;

abstract class 机动车 {
   abstract void 启动();
   abstract void 加速();
   abstract void 刹车();
}
class 手动挡轿车 extends 机动车 {
   void 启动() {
      System.out.println("踏下离合器，换到一挡");
      System.out.println("慢慢抬起离合器");
   }
   void 加速() {
      System.out.println("踩油门");
   }
   void 刹车() {
      System.out.println("踏下离合器、刹车板");
      System.out.println("档位换到一档");
   }
}
class 自动挡轿车 extends 机动车 {
   void 启动() {
      System.out.println("使用前进挡");
      System.out.println("轻踩油门");
   }
   void 加速() {
      System.out.println("踩油门");
   }
   void 刹车() {
      System.out.println("踏下刹车板");
   }
}
public class ex5_12 {
   public static void main(String args[]) {

      机动车 car=new 手动挡轿车();
      System.out.println("手动挡轿车的操作");
      car.启动();
      car.加速();
      car.刹车();
      car=new 自动挡轿车();
      System.out.println("自动挡轿车的操作");
      car.启动();
      car.加速();
      car.刹车();
   }
}

