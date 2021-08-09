package com;

import java.awt.BorderLayout;
import method.*;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import javax.swing.JTextArea;
public class admincenter extends JFrame {
	String ano;
	private JPanel contentPane;
	private JTextField add_gprice_in;
	private JTextField add_gname_in;
	private JTextField add_gno_in;
	private JTextField change_gno_in;
	private JTextField change_gname_in;
	private JTextField change_gprice_in;
	private JTextField delete_gno_in;
	private JTextField add_gcount_in;
	private JTextField change_gcount_in;
	private JLabel change_gcount;
	private JLabel delete_gno;
	private JTextArea show;
	private JButton query;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					admincenter frame = new admincenter();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public admincenter() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1000, 900);
		this.setLocationRelativeTo(null);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel add_gno = new JLabel("商品号：");
		add_gno.setBounds(504, 592, 61, 16);
		contentPane.add(add_gno);
		
		JLabel add_gname = new JLabel("商品名：");
		add_gname.setBounds(504, 641, 61, 16);
		contentPane.add(add_gname);
		
		JLabel add_gprice = new JLabel("商品价格：");
		add_gprice.setBounds(504, 690, 76, 16);
		contentPane.add(add_gprice);
	
		
		JLabel add_gcount = new JLabel("商品数量：");
		add_gcount.setBounds(504, 739, 76, 16);
		contentPane.add(add_gcount);
		
		JButton add_button = new JButton("添加商品");
		add_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String no=add_gno_in.getText();
				String name=add_gname_in.getText();
				String price=add_gprice_in.getText();
				String count=add_gcount_in.getText();
				insert_goods.Insert_goods(no, name, price, count);
				JOptionPane.showMessageDialog(null,"添加商品成功","",JOptionPane.WARNING_MESSAGE);
				add_gno_in.setText(null);
				add_gname_in.setText(null);
				add_gprice_in.setText(null);
				add_gcount_in.setText(null);
			}
		});
		add_button.setBounds(620, 778, 139, 48);
		contentPane.add(add_button);
		
		JLabel change_gno = new JLabel("商品号：");
		change_gno.setBounds(58, 592, 61, 16);
		contentPane.add(change_gno);
		
		JLabel change_gname = new JLabel("商品名：");
		change_gname.setBounds(58, 641, 61, 16);
		contentPane.add(change_gname);
		
		JLabel change_gprice = new JLabel("商品价格：");
		change_gprice.setBounds(58, 690, 76, 16);
		contentPane.add(change_gprice);
		
		change_gcount = new JLabel("商品数量：");
		change_gcount.setBounds(58, 739, 76, 16);
		contentPane.add(change_gcount);
		
		delete_gno = new JLabel("商品号：");
		delete_gno.setBounds(304, 509, 76, 16);
		contentPane.add(delete_gno);

		
		
		add_gno_in = new JTextField();
		add_gno_in.setColumns(10);
		add_gno_in.setBounds(580, 582, 265, 37);
		contentPane.add(add_gno_in);
		
		add_gname_in = new JTextField();
		add_gname_in.setColumns(10);
		add_gname_in.setBounds(580, 631, 265, 37);
		contentPane.add(add_gname_in);
		
		
		
		add_gprice_in = new JTextField();
		add_gprice_in.setColumns(10);
		add_gprice_in.setBounds(580, 680, 265, 37);
		contentPane.add(add_gprice_in);
		
		add_gcount_in = new JTextField();
		add_gcount_in.setColumns(10);
		add_gcount_in.setBounds(580, 729, 265, 37);
		contentPane.add(add_gcount_in);
		
		
		change_gno_in = new JTextField();
		change_gno_in.setColumns(10);
		change_gno_in.setBounds(149, 582, 265, 37);
		contentPane.add(change_gno_in);
		
		change_gname_in = new JTextField();
		change_gname_in.setColumns(10);
		change_gname_in.setBounds(149, 631, 265, 37);
		contentPane.add(change_gname_in);
		
		change_gprice_in = new JTextField();
		change_gprice_in.setColumns(10);
		change_gprice_in.setBounds(149, 680, 265, 37);
		contentPane.add(change_gprice_in);
		
		change_gcount_in = new JTextField();
		change_gcount_in.setColumns(10);
		change_gcount_in.setBounds(149, 729, 265, 37);
		contentPane.add(change_gcount_in);
		
		JButton change_button = new JButton("修改商品信息");
		change_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String no=change_gno_in.getText();
				String name=change_gname_in.getText();
				String price=change_gprice_in.getText();
				String count=change_gcount_in.getText();
				change_goods_message.getchange(no, name, price, count);
				JOptionPane.showMessageDialog(null,"修改商品信息成功","",JOptionPane.WARNING_MESSAGE);
				change_gno_in.setText(null);
				change_gname_in.setText(null);
				change_gprice_in.setText(null);
				change_gcount_in.setText(null);
			}
		});
		change_button.setBounds(177, 778, 139, 48);
		contentPane.add(change_button);
		
		delete_gno_in = new JTextField();
		delete_gno_in.setColumns(10);
		delete_gno_in.setBounds(394, 499, 265, 37);
		contentPane.add(delete_gno_in);
		
		JButton delete_button = new JButton("删除商品");
		delete_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String no=delete_gno_in.getText();
				delete_goods.getdelete(no); //从当前数据库中删除
				JOptionPane.showMessageDialog(null,"删除商品成功","",JOptionPane.WARNING_MESSAGE);
				delete_gno_in.setText(null);
			}
		});
		delete_button.setBounds(693, 494, 139, 48);
		contentPane.add(delete_button);
		
		show = new JTextArea();
		show.setBounds(266, 57, 714, 370);
		contentPane.add(show);
		
		query = new JButton("查询库存");
		query.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				ArrayList<String>list = Query_all.get_queryall();
				show.setText(null);
				for(String record: list) {
					show.append(record+'\n');
					//需要按照价格从低到高排序显示
				}
			}
		});
		query.setBounds(68, 242, 127, 62);
		contentPane.add(query);
	}
	public void get_id(String id) {
		ano=id;
	}
}
