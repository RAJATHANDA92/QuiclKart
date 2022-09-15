package Exams24;

import java.util.Scanner;

import org.eclipse.jdt.internal.compiler.batch.Main;

public class Quest1 
{

	public static void main(String[] args) 
		// TODO Auto-generated method stub
		{
		    Scanner sc = new Scanner(System.in);
			System.out.println("Enter main String");
			String MainString = sc.nextLine();
	        String[] input = MainString.split(",");
			System.out.println("Enter the size of bucket String");
			int l = sc.nextInt();
			sc.skip(System.lineSeparator());
			String[] bucketString = new String[l];
			System.out.println("Enter Elements of bucket String");
			for(int i = 0;i<bucketString.length;i++)
			{
			    bucketString[i] = sc.nextLine();
			}
			int flag =0;
	        int p=0;
		//  bucketStrings[0] = "AWESOME";      //Case 1
	    //  System.out.println(bucketStrings[0]);
		  //bucketStrings[1] = "INSIGHT";		// Case 2
		  //System.out.println(bucketStrings[1]);
	      
		    int UPPRCHAR[] = new int[26];
		    for(int i =0; i<bucketString.length; i++) 
			{
		    	char a = bucketString[i].charAt(i);
		    	p=0;
		    	for(int j=0; j<input.length; j++) 
				{
		    		String s = String.valueOf(a);  
		    		if(input[j].equals(s)) 
					{
		    			p=1;
		    			input[j]="0";
		    			break;
		    		}
		    		if(p==1) 
					{
			    		
			    	}
					else 
					{
			    		flag=1;
		    			break;
			    	}
		    	}
		    	  if(flag==0) 
		    	  {
				    	System.out.println("Yes");	    
				  }
				    else 
				  {
				    	System.out.println("No");	    
				  }
			}
		}
}


