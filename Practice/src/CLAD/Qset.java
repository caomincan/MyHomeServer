package CLAD;
import java.sql.*;
public class Qset {
    private static final String DEFAULT_DBURL="jdbc:mysql://localhost/CLAD";
    private static final String DEFAULT_USR="labview";
    private static final String DEFAULT_PSD="labview";
    private static final Integer DEFAULT_SIZE=40;
    
    private String user;          // user name
    private String password;     // password
    private String[][] questionSet; // store question set from database
    private Integer size;    // number of question
    private boolean ready;   // whether data are ready
    
	public Qset(){
		this.user = DEFAULT_USR;
		this.password = DEFAULT_PSD;
		this.questionSet=null;
		this.size = 0;
		this.ready=false;
	}
	public Qset(String user,String password){
		this.user=user;
		this.password=password;
		this.questionSet=null;
		this.size = 0;
		this.ready=false;
	}
	
	public void init(){
		Connection myConn;  // JDBC connection
		Statement mySmt;    // JDBC sql statement
		ResultSet myRs;     // JDBC query result
		try{
			myConn = DriverManager.getConnection(DEFAULT_DBURL,this.user,this.password);
			mySmt  = myConn.createStatement();
			myRs   = mySmt.executeQuery("select count(*) num from questionset;");
			// try to get number of questions first
			try{
				while(myRs.next()){
				this.size=Integer.valueOf(myRs.getString("num"));
				}
				System.out.printf("The number of questions in database is %d\n",this.size);
			} catch(Exception e){
				System.out.println("Fail to get number of questions from database\n");
				return;
			}
			this.questionSet = new String[this.size][field.values().length];
			myRs   = mySmt.executeQuery("select * from questionset;");
			Integer count =0;
			while(myRs.next()){
				this.questionSet[count][field.quesion.ordinal()]=myRs.getString("question");
				this.questionSet[count][field.qpic.ordinal()]=myRs.getString("qpic");
				this.questionSet[count][field.A.ordinal()]=myRs.getString("A");
				this.questionSet[count][field.Apic.ordinal()]=myRs.getString("Apic");
				this.questionSet[count][field.B.ordinal()]=myRs.getString("B");
				this.questionSet[count][field.Bpic.ordinal()]=myRs.getString("Bpic");
				this.questionSet[count][field.C.ordinal()]=myRs.getString("C");
				this.questionSet[count][field.Cpic.ordinal()]=myRs.getString("Cpic");
				this.questionSet[count][field.D.ordinal()]=myRs.getString("D");
				this.questionSet[count][field.Dpic.ordinal()]=myRs.getString("Dpic");
				this.questionSet[count][field.answer.ordinal()]=myRs.getString("answer");
				this.questionSet[count][field.explain.ordinal()]=myRs.getString("explain");
				count++;
			}
			myConn.close();
			this.ready = true;
			System.out.println("Sucess get data from database!\n");
		} catch(Exception e){
			System.out.println("Fail to get data from database!\n");
		}
	}
	public Integer getSize() { return size;}
    public String getAnswer(){
    	String result;
    	if(ready){
    		result ="";
    		for(int i=0;i<size;i++){
    			result += questionSet[i][field.answer.ordinal()];
    		}
    	} else{
    		result=" ";
    		for(int i=1;i<DEFAULT_SIZE;i++){
        		result += " ";
        	}
    	}
    	return result;
    }
	public String getQuestion(String id){
		if(!ready) return "";
		// restrict range
		Integer num = Integer.valueOf(id)-1;
		if(num<0) num=0;
		if(num>=size) num=size-1;
		String result = "";
		if(questionSet[num][field.quesion.ordinal()] != null) result += "<h4>"+questionSet[num][field.quesion.ordinal()]+"</h4>";
		if(questionSet[num][field.qpic.ordinal()] != null) result += "<img src=\"src/"+questionSet[num][field.qpic.ordinal()]+"\">";
		//System.out.println(result+"\n");
		return result;
	}
	public String getA(String id){
		if(!ready) return "";
		// restrict range
		Integer num = Integer.valueOf(id)-1;
		if(num<0) num=0;
		if(num>=size) num=size-1;
		String result = "";
		if(questionSet[num][field.A.ordinal()] != null) result += questionSet[num][field.A.ordinal()];
		if(questionSet[num][field.Apic.ordinal()] != null) result += "<br><img src=\"src/"+questionSet[num][field.Apic.ordinal()]+"\">";
		return result;
	}
	public String getB(String id){
		if(!ready) return "";
		// restrict range
		Integer num = Integer.valueOf(id)-1;
		if(num<0) num=0;
		if(num>=size) num=size-1;
		String result = "";
		if(questionSet[num][field.B.ordinal()] != null) result += questionSet[num][field.B.ordinal()];
		if(questionSet[num][field.Bpic.ordinal()] != null) result +="<br><img src=\"src/"+questionSet[num][field.Bpic.ordinal()]+"\">";
		return result;
	}
	public String getC(String id){
		if(!ready) return "";
		// restrict range
		Integer num = Integer.valueOf(id)-1;
		if(num<0) num=0;
		if(num>=size) num=size-1;
		String result = "";
		if(questionSet[num][field.C.ordinal()] != null) result += questionSet[num][field.C.ordinal()];
		if(questionSet[num][field.Cpic.ordinal()] != null) result += "<br><img src=\"src/"+questionSet[num][field.Cpic.ordinal()]+"\">";
		return result;
	}
	public String getD(String id){
		if(!ready) return "";
		// restrict range
		Integer num = Integer.valueOf(id)-1;
		if(num<0) num=0;
		if(num>=size) num=size-1;
		String result = "";
		if(questionSet[num][field.D.ordinal()] != null) result += questionSet[num][field.D.ordinal()];
		if(questionSet[num][field.Dpic.ordinal()] != null) result += "<br><img src=\"src/"+questionSet[num][field.Dpic.ordinal()]+"\">";
		return result;
	}
}
