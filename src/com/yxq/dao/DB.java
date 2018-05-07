package com.yxq.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DB {
	private Connection con;
	private String url;
	private String serverName;
	private String portNumber;
	private String databaseName;
	private String userName;
	private String password;
	private String sql;
	private PreparedStatement pstm;
	
	public DB(){

			url=("jdbc:sqlserver://");
			serverName="127.0.0.1";//SQLserver��ַ
			portNumber="1433";//�˿ں�
			databaseName="db_ProjectInfo";//���ݿ���
			userName="sa";//��½��
			password="";	//����

	}

	private String getconurl(){

		return url+serverName+":"+portNumber+";databaseName="+databaseName+";"; 
	}
	
	private Connection getcon(){
		try{
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			con=DriverManager.getConnection(getconurl(),userName,password);

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infodb?useUnicode=true&characterEncoding=utf8", "root", "wenqi");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			return con;
		}
	}
	
	
	
	public void doPstm(String sql,Object[] params){
		if(sql!=null&&!sql.equals("")){
			if(params==null)
				params=new Object[0];
			con=getcon();
			if(con!=null){
				try{
					pstm=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
					for(int i=0;i<params.length;i++){
						pstm.setObject(i+1, params[i]);
					}
					pstm.execute();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
		}
	}
			
	public ResultSet getRs() throws SQLException{
		return pstm.getResultSet();
	}
	
		
	public int getCount() throws SQLException{
		return pstm.getUpdateCount();		
	}
	public void closed(){
		try{
			if(pstm!=null)
				pstm.close();			
		}catch(SQLException e){
			e.printStackTrace();
		}
		try{
			if(con!=null){
				con.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
