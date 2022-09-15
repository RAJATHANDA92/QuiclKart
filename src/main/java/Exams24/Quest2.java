package Exams24;

import java.util.Scanner;

public class Quest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		Scanner sr = new Scanner(System.in);
		String[] bucketStrings= new String[2];
String MainString = "ABILITY, ABOUT, ACTION, ADVENTURE, CAT, DOG";
String[] bvbc = MainString.split(",");

int flag =0;
int p=0;
		
		String[] bucketStrings1 = "D, A".split(" ");
				
//	    bucketStrings[1] = "INSIGHT";		
    	for(int j=0; j<bvbc.length; j++) {

	    for(int i =0; i<bucketStrings1.length; i++) {
	    	String a = bucketStrings1[i];
	    	String words = bvbc[j];
	    		p=0;
	    		for(int k=0; k<words.length(); k++ ) 
	    		{
	    				char Inval = words.charAt(k);
	    				String Valstr = String.valueOf(Inval);
	    				if(Valstr.equals("1")) {
	    					p=2;
	    					break;
	    				}
	    				if(Valstr.equals(a)) {
	    					p=1;
	    					StringBuilder stt = new StringBuilder(words);
	    			        stt.setCharAt(k, '1');
	    			        
	    					words = stt.toString();
	    					break;
	    				}
	    				
	    				
	    		}
	    		if(p==2) {
	    			break;
	    		}else if(p==1){
	    			System.out.println(bvbc[j]);
	    			bvbc[j] = words;
	    		}
	    		
	    		
	    	}
	    	
	    }

	 }
}
