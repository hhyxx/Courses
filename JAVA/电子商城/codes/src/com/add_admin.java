package com;
import java.awt.EventQueue;

import javax.swing.JInternalFrame;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.regex.Pattern;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import method.insert_admin;
import method.insert_usr;

public class add_admin extends JInternalFrame {
	private JTextField get_usrname;
	private JTextField get_password;
	private JTextField get_repeat_password;
	private String regex="^[a-zA-Z0-9-]+$";
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					add_admin frame = new add_admin();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public add_admin() {
		setClosable(true);
		setBounds(100, 100, 500, 450);
		getContentPane().setLayout(null);
				
		JLabel label_usrname = new JLabel("管理员用户账号");
		label_usrname.setBounds(35, 77, 96, 16);
		getContentPane().add(label_usrname);
		get_usrname = new JTextField();
		get_usrname.setBounds(143, 69, 246, 33);
		getContentPane().add(get_usrname);
		get_usrname.setColumns(10);
		
		JLabel label_password = new JLabel("管理员用户密码");
		label_password.setBounds(35, 145, 96, 16);
		getContentPane().add(label_password);
		get_password = new JTextField();
		get_password.setColumns(10);
		get_password.setBounds(143, 137, 246, 33);
		getContentPane().add(get_password);
		
		JLabel label_repeat_password = new JLabel("重复密码");
		label_repeat_password.setBounds(35, 206, 61, 16);
		getContentPane().add(label_repeat_password);
		
		get_repeat_password = new JTextField();
		get_repeat_password.setColumns(10);
		get_repeat_password.setBounds(143, 201, 246, 33);
		getContentPane().add(get_repeat_password);
		
		JButton register_button = new JButton("添加管理员用户");
		register_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
					String ano=get_usrname.getText();
					String pas=get_password.getText();
					String rep_pas= get_repeat_password.getText();
					/*账号、密码非空检验*/
					if(!check_input(ano)) { //不为空检查
						JOptionPane.showMessageDialog(null,"账号不可为空","",JOptionPane.WARNING_MESSAGE);
						get_usrname.setText(null);
					}
					else if(!check_input(pas)){
						JOptionPane.showMessageDialog(null,"密码不可为空","",JOptionPane.WARNING_MESSAGE);
						get_password.setText(null);
					}
					
					/*账号长度检验*/
					else if(ano.length() < 3) {
						JOptionPane.showMessageDialog(null,"账号不能小于三位","",JOptionPane.WARNING_MESSAGE);
						get_usrname.setText(null);
					}
					
					/*密码长度、格式检验*/
					else if(!Pattern.matches(regex,pas) || pas.length() < 6 ) {
						JOptionPane.showMessageDialog(null,"密码必须是字母和数字的组合，长度不能小于6位","",JOptionPane.WARNING_MESSAGE);
						get_password.setText(null);
						get_repeat_password.setText(null);
					}
					
					/*密码的重复输入匹配检验*/
					else if(!pas.equals(rep_pas)) {
						
						JOptionPane.showMessageDialog(null,"密码重复不符","",JOptionPane.WARNING_MESSAGE);
						get_password.setText(null);
						get_repeat_password.setText(null);
					}
					else {
						//用户通过验证后，将用户数据插入到数据库之中
						insert_admin.Insert_admin(ano,pas);
						JOptionPane.showMessageDialog(null,"添加管理员成功","",JOptionPane.WARNING_MESSAGE);
						dispose();
					}
				}
		
		});
		register_button.setBounds(169, 290, 119, 39);
		getContentPane().add(register_button);
	}
	private boolean check_input(String str) {
		boolean ok=true;
		if(str ==null || str.length()==0) 
			ok=false;
		return ok;
	}
}
