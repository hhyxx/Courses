package com;
import method.Query_all;
import method.Query_buy_records;
import method.check_goods_count;
import method.insert_buy_records;
import method.subtract_goods_count;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import javax.swing.JTextArea;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.awt.event.ActionEvent;


public class usrcenter extends JFrame {

	private JPanel contentPane;
	private JTextField goods_id;
	private JTextField goods_buy_count;
	String uno;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					usrcenter frame = new usrcenter();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	public usrcenter() {
		init();
	}
	private void init() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 900, 700);
		this.setLocationRelativeTo(null);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JTextArea show = new JTextArea();
		show.setBounds(122, 63, 653, 379);
		contentPane.add(show);
		
		JLabel label_show = new JLabel("查询显示");
		label_show.setFont(new Font("Lucida Grande", Font.PLAIN, 20));
		label_show.setBounds(391, 20, 117, 25);
		contentPane.add(label_show);
		
		
		JLabel label_goods_id = new JLabel("商品编号");
		label_goods_id.setBounds(447, 481, 61, 16);
		contentPane.add(label_goods_id);
		
		JLabel label_goods_buy_count = new JLabel("购买数量");
		label_goods_buy_count.setBounds(447, 536, 61, 16);
		contentPane.add(label_goods_buy_count);
		
		
		goods_id = new JTextField();
		goods_id.setBounds(541, 476, 266, 26);
		contentPane.add(goods_id);
		goods_id.setColumns(10);
		
		JButton query_all = new JButton("查询所有商品");
		query_all.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//实现查商品表中的所有商品
				ArrayList<String>list = Query_all.get_queryall();
				show.setText(null);
				for(String record: list) {
					show.append(record+'\n');
					//需要按照价格从低到高排序显示
				}
			}
		});
		query_all.setBounds(90, 522, 117, 64);
		contentPane.add(query_all);
		
		JButton query_buy_records = new JButton("查询购买记录");
		query_buy_records.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//查询购买记录表中该用户的购买记录
				ArrayList<String>list = Query_buy_records.get_buy_records(uno); // 函数未修改完成
				show.setText(null);
				for(String record: list) {
					show.append(record+'\n');
				}
			}
		});
		query_buy_records.setBounds(262, 522, 117, 64);
		contentPane.add(query_buy_records);
		
	
		JButton buy_button = new JButton("购买");
		buy_button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//购买输入的id的商品，向
				String gno=goods_id.getText();
				String g_num=goods_buy_count.getText();
				int num=Integer.parseInt(g_num);
				int num_exist=check_goods_count.get(gno);
				if(num_exist>=num) {
					String rec=insert_buy_records.Insert_records(uno,gno,g_num);
					int t=num_exist-num;
					String now=String.valueOf(t);
					subtract_goods_count.change(gno,now);
					show.setText(rec);
					JOptionPane.showMessageDialog(null,"购买成功","",JOptionPane.WARNING_MESSAGE);
				}
				else {
					JOptionPane.showMessageDialog(null,"库存不足！请重新选择购买的商品数量","",JOptionPane.WARNING_MESSAGE);
				}
			}
		});
		buy_button.setBounds(601, 579, 117, 64);
		contentPane.add(buy_button);
		

		
		goods_buy_count = new JTextField();
		goods_buy_count.setColumns(10);
		goods_buy_count.setBounds(541, 531, 266, 26);
		contentPane.add(goods_buy_count);

	}
	
	public void get_id(String id) {
		uno=id;
	}
}
