package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class userDao {

	private Connection conn;
	public userDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean adduser(UserDetails us) {
		
		boolean f=false;
		
		try {
			String query="insert into user(name,email,password) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3,us.getPassword());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return f;
	}
	
	public UserDetails loginuser(UserDetails us) {
		
		UserDetails user=null;
		
		try {
			String query="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2,us.getPassword());
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				user=new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return user;
   	}
		
}

