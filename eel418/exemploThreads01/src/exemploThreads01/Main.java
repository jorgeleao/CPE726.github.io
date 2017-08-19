package exemploThreads01;

public class Main {

    static ClasseQueExtendeThread classeQueExtendeThread_01;
    static ClasseQueExtendeThread classeQueExtendeThread_02;
    static ClasseQueImplementaRunnable classeQueImplementaRunnable_03;
    static Thread t;
    
    public static void main(String[] args){
        System.out.println("\n--- Começou a rodar o Main...\n");
        classeQueExtendeThread_01 = new ClasseQueExtendeThread(1);
        classeQueExtendeThread_01.start();
        
        classeQueExtendeThread_02 = new ClasseQueExtendeThread(2);
        classeQueExtendeThread_02.start();
        
        classeQueImplementaRunnable_03 = new ClasseQueImplementaRunnable(3);
        t = new Thread(classeQueImplementaRunnable_03);
        t.start();
    }
}

    class ClasseQueExtendeThread extends Thread{
        private int id;
        public ClasseQueExtendeThread(int id){
            this.id = id;
        }
        
        @Override
        public void run(){
            while(true){
                System.out.println("\n--- Rodou ClasseQueExtendeThread "+id+"\n");
                try{Thread.sleep(1300);}catch(Exception e){}
            }
        }
    }

    class ClasseQueImplementaRunnable implements Runnable{
        private int id;
        public ClasseQueImplementaRunnable(int id){
            this.id = id;
        }
        
        @Override
        public void run(){
            while(true){
                System.out.println("\n--- Rodou ClasseQueImplementaRunnable "+id+"\n");
                try{Thread.sleep(1300);}catch(Exception e){}
            }
        }
    }