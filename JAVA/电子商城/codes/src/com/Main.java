package com;
import method.*;
import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JDesktopPane;
import java.awt.Color;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.regex.Pattern;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import java.awt.Font;
import javax.swing.SwingConstants;

public class Main extends JFrame {

	private JPanel contentPane;
	private JDesktopPane table=null;
	private JTextField get_password;
	private JTextField get_usrname;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main frame = new Main();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	// 字符串非空检查
	private boolean check_input(String str) {
		boolean ok=true;
		if(str ==null || str.length()==0) 
			ok=false;
		return ok;
	}
	public Main() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 600, 600);
		this.setLocationRelativeTo(null);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		table = new JDesktopPane();
		table.setBackground(Color.WHITE);
		contentPane.add(table, BorderLayout.CENTER);
		
		JLabel main_title = new JLabel("登录界面");
		main_title.setHorizontalAlignment(SwingConstants.CENTER);
		main_title.setFont(new Font("Lucida Grande", Font.PLAIN, 40));
		main_title.setBounds(142, 68, 297, 112);
		table.add(main_title);
		
		JLabel label_usrname = new JLabel("用户名");
		label_usrname.setFont(new Font("Lucida Grande", Font.PLAIN, 15));
		label_usrname.setBounds(84, 222, 55, 53);
		table.add(label_usrname);
		get_password = new JTextField();
		get_password.setColumns(10);
		get_password.setBounds(190, 316, 355, 40);
		table.add(get_password);
		
		JLabel label_password = new JLabel("密码");
		label_password.setFont(new Font("Lucida Grande", Font.PLAIN, 15));
		label_password.setBounds(84, 316, 40, 39);
		table.add(label_password);
		get_usrname = new JTextField();
		get_usrname.setColumns(10);
		get_usrname.setBounds(190, 229, 355, 40);
		table.add(get_usrname);
		
		
		/*
		  添加监视器，在当前页面内打开子窗口进行注册功能
		 */
		JButton register_button = new JButton("注册");
		register_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				register regwin=new register();
				regwin.setVisible(true);
				table.add(regwin);
			}
		});
		
		
		register_button.setBounds(426, 417, 96, 46);
		table.add(register_button);
		

		JButton add_new_admin = new JButton("创建新管理员");
		add_new_admin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				add_admin adminwin=new add_admin();
				adminwin.setVisible(true);
				table.add(adminwin);
			}
		});
		add_new_admin.setBounds(233, 487, 126, 46);
		table.add(add_new_admin);
		
		
		//添加监视器，并进行判断合法后跳转到用户界面
		JButton usr_login_button = new JButton("用户登录");
		usr_login_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(!check_input(get_usrname.getText()) || !check_input(get_password.getText())){ //不为空检查
					JOptionPane.showMessageDialog(null,"账号密码不可为空","",JOptionPane.WARNING_MESSAGE);
					get_usrname.setText(null);
				}
				else if(check_usr.Check_(get_usrname.getText(),get_password.getText()) ){
					//用户通过验证后，进入商城主界面
					dispose();
					usrcenter usrwin=new usrcenter();
					usrwin.get_id(get_usrname.getText());
					usrwin.setVisible(true);
					
				}
				else {
					JOptionPane.showMessageDialog(null,"账号不存在","",JOptionPane.WARNING_MESSAGE);
					get_usrname.setText(null);
					get_password.setText(null);
				}
			}
		});
		usr_login_button.setBounds(84, 417, 96, 46);
		table.add(usr_login_button);
		
		
		//  添加监视器，并进行判断合法后跳转到管理员后台
		JButton admin_login_button = new JButton("管理员登录");
		admin_login_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//  非空检查
				if(!check_input(get_usrname.getText()) || !check_input(get_password.getText())){ 
					JOptionPane.showMessageDialog(null,"账号不可为空","",JOptionPane.WARNING_MESSAGE);
					get_usrname.setText(null);
					get_password.setText(null);
				}
				else if(check_admin.Check(get_usrname.getText(),get_password.getText())){
				//  管理员用户通过验证后，进入商城主界面
					dispose();
					admincenter adminwin=new admincenter();
					adminwin.get_id("123");
					adminwin.setVisible(true);
				}
				else {
					JOptionPane.showMessageDialog(null,"不存在管理员账户","",JOptionPane.WARNING_MESSAGE);
					get_usrname.setText(null);
					get_password.setText(null);
				}
			}
		});
		admin_login_button.setBounds(246, 417, 96, 46);
		table.add(admin_login_button);
		
	}
}
