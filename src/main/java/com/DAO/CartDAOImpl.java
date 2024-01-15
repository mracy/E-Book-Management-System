package com.DAO;

import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import static org.hibernate.criterion.Expression.sql;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try {

            String sql = "insert into cart(bid, uid, bookName, author, price, total_price) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<>();
        try {

            String sql = "select * from cart where uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            double totalPrice = 0;
            while (rs.next()) {
                Cart c = new Cart();
                c.setCid(rs.getInt(1));
                c.setBid(rs.getInt(2));
                c.setUserId(rs.getInt(3));
                c.setBookName(rs.getString(4));
                c.setAuthor(rs.getString(5));
                c.setPrice(rs.getDouble(6));

                totalPrice += rs.getDouble(7); // Add the book price to the total price
                c.setTotalPrice(totalPrice); // Set the total price for the cart

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

 
    public boolean deleteBook(int bid,int uid, int cid) {
        boolean f=false;
      
        try{
            
         String sql="delete from cart where bid=? and uid=? and cid=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setInt(1, bid);
        ps.setInt(2,uid);
        ps.setInt(3,cid);
        int i=ps.executeUpdate();
        
        if(i==1)
        {
            f=true;
        
        }
        }catch (SQLException e){
            e.printStackTrace();
        }
    
                
        return f;
    
    }
}
