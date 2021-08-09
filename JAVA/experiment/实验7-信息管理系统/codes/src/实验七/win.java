package 实验七;
import java.sql.*;
import java.util.*;
import java.awt.EventQueue;
import java.awt.TextArea;

import javax.swing.JFrame;
import javax.swing.JTextField;

import com.sun.jdi.connect.spi.Connection;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.beans.Statement;
import java.awt.event.ActionEvent;
import javax.swing.JTextArea;


public class win {

	private JFrame frame;
	private JTextField left1;
	private JTextField left2;
	private JTextField left3;
	private JTextField left4;
	private JTextField mid1;
	private JTextField mid2;
	private JTextField mid3;
	private JTextField mid4;
	private JLabel lblNewLabel_1;
	private JLabel lblNewLabel_2;
	private JLabel lblNewLabel_3;
	private JTextField right1;
	private JTextField right2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					win window = new win();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public win() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		
		frame = new JFrame();
		frame.setBounds(250, 250, 850, 650);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		
		JTextArea show = new JTextArea();
		show.setBounds(159, 26, 642, 243);
		frame.getContentPane().add(show);
		
		
		left1 = new JTextField();
		left1.setBounds(129, 312, 135, 35);
		frame.getContentPane().add(left1);
		left1.setColumns(10);
		
		left2 = new JTextField();
		left2.setColumns(10);
		left2.setBounds(129, 438, 135, 35);
		frame.getContentPane().add(left2);
		
		left3 = new JTextField();
		left3.setColumns(10);
		left3.setBounds(129, 373, 135, 35);
		frame.getContentPane().add(left3);
		
		left4 = new JTextField();
		left4.setColumns(10);
		left4.setBounds(129, 493, 135, 35);
		frame.getContentPane().add(left4);
		
		mid1 = new JTextField();
		mid1.setColumns(10);
		mid1.setBounds(384, 312, 135, 35);
		frame.getContentPane().add(mid1);
		
		mid2 = new JTextField();
		mid2.setColumns(10);
		mid2.setBounds(384, 373, 135, 35);
		frame.getContentPane().add(mid2);
		
		mid3 = new JTextField();
		mid3.setColumns(10);
		mid3.setBounds(384, 438, 135, 35);
		frame.getContentPane().add(mid3);
		
		mid4 = new JTextField();
		mid4.setColumns(10);
		mid4.setBounds(384, 493, 135, 35);
		frame.getContentPane().add(mid4);
		
		JLabel lblNewLabel = new JLabel("学号");
		lblNewLabel.setBounds(33, 321, 61, 16);
		frame.getContentPane().add(lblNewLabel);
		
		lblNewLabel_1 = new JLabel("姓名");
		lblNewLabel_1.setBounds(33, 382, 61, 16);
		frame.getContentPane().add(lblNewLabel_1);
		
		lblNewLabel_2 = new JLabel("学院");
		lblNewLabel_2.setBounds(33, 447, 61, 16);
		frame.getContentPane().add(lblNewLabel_2);
		
		lblNewLabel_3 = new JLabel("专业");
		lblNewLabel_3.setBounds(33, 502, 61, 16);
		frame.getContentPane().add(lblNewLabel_3);
		
		JButton btnNewButton = new JButton("查询全部");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ArrayList<String>list = queryall.getqueryall();
				show.setText(null);
				for(String record: list) {
					show.append(record+'\n');
				}
			}
		});
		btnNewButton.setBounds(22, 112, 111, 44);
		frame.getContentPane().add(btnNewButton);
		
		right1 = new JTextField();
		right1.setColumns(10);
		right1.setBounds(649, 312, 135, 35);
		frame.getContentPane().add(right1);
		
		
		right2 = new JTextField();
		right2.setColumns(10);
		right2.setBounds(649, 438, 135, 35);
		frame.getContentPane().add(right2);
		
		JButton add = new JButton("增加");
		add.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String no=left1.getText();
				String name=left2.getText();
				String dept=left3.getText();
				String major=left4.getText();
				
				if((no ==null || no.length()==0) || (name ==null || name.length()==0)||(dept ==null || dept.length()==0)||(major ==null || major.length()==0)) {
					JOptionPane.showMessageDialog(null,"请正确输入","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
				}
				else {
					getInsert.get_Insert(no,name,dept,major);
					JOptionPane.showMessageDialog(null,"增加成功","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
					left1.setText(null);
					left2.setText(null);
					left3.setText(null);
					left4.setText(null);
				}
			}
		});
		add.setBounds(129, 552, 117, 29);
		frame.getContentPane().add(add);
		
		JButton change = new JButton("修改");
		change.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String no=mid1.getText();
				String name=mid2.getText();
				String dept=mid3.getText();
				String major=mid4.getText();
				if((no ==null || no.length()==0) || (name ==null || name.length()==0)||(dept ==null || dept.length()==0)||(major ==null || major.length()==0)) {
					JOptionPane.showMessageDialog(null,"请正确输入","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
				}
				else {
					dochange.getchange(no,name,dept,major);
					JOptionPane.showMessageDialog(null,"修改成功","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
					mid1.setText(null);
					mid2.setText(null);
					mid3.setText(null);
					mid4.setText(null);
				}
			}
		});
		change.setBounds(384, 552, 117, 29);
		frame.getContentPane().add(change);
		
		JButton ask = new JButton("查询");
		ask.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String s=right1.getText();
				System.out.println(s);
				if(s ==null || s.length()==0) {
					JOptionPane.showMessageDialog(null,"请正确输入","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
				}
				else {
					ArrayList<String> list_ = querybynumber.getquerybynumber(s);
					show.setText(null);
					for(String record: list_) {
						show.append(record);
						show.append("\n");
					}
					JOptionPane.showMessageDialog(null,"查询成功","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
					right1.setText(null);
				}
			}
		});

			
		ask.setBounds(649, 377, 117, 29);
		frame.getContentPane().add(ask);
		
		JButton move = new JButton("删除");
		move.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String s=right2.getText();
				if(s ==null || s.length()==0) {
					JOptionPane.showMessageDialog(null,"请正确输入","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
				}
				else {
					dodelete.getdelete(s);
					JOptionPane.showMessageDialog(null,"删除成功","201811050392 软件186 侯宇轩",JOptionPane.WARNING_MESSAGE);
					right2.setText(null);
				}
			}
		});
		move.setBounds(649, 497, 117, 29);
		frame.getContentPane().add(move);
		
		
		JLabel lblNewLabel_4 = new JLabel("学号");
		lblNewLabel_4.setBounds(307, 321, 61, 16);
		frame.getContentPane().add(lblNewLabel_4);
		
		JLabel lblNewLabel_5 = new JLabel("姓名");
		lblNewLabel_5.setBounds(307, 382, 61, 16);
		frame.getContentPane().add(lblNewLabel_5);
		
		JLabel lblNewLabel_6 = new JLabel("学院");
		lblNewLabel_6.setBounds(307, 447, 61, 16);
		frame.getContentPane().add(lblNewLabel_6);
		
		JLabel lblNewLabel_7 = new JLabel("专业");
		lblNewLabel_7.setBounds(311, 502, 61, 16);
		frame.getContentPane().add(lblNewLabel_7);
		
		JLabel lblNewLabel_4_1 = new JLabel("学号");
		lblNewLabel_4_1.setBounds(568, 321, 61, 16);
		frame.getContentPane().add(lblNewLabel_4_1);
		
		JLabel lblNewLabel_4_2 = new JLabel("学号");
		lblNewLabel_4_2.setBounds(568, 447, 61, 16);
		frame.getContentPane().add(lblNewLabel_4_2);
		

		
		
		
	}
}
