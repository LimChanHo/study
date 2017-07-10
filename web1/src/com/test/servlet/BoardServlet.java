package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.service.BoardService;

public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
//
//		String title1 = req.getParameter("title");
//		String content1 = req.getParameter("content");
//		String user_num1 = req.getParameter("user_num");
//		System.out.println(title1 + content1 + user_num1);
		String command = req.getParameter("command");
		if(command==null){
			return;
		}
		BoardService us = new BoardService();
		if (command.equals("BOARD_INPUT")) {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String user_num = req.getParameter("user_num");
		

			
//			System.out.println(title + "," + content + "," + user_num);

			
			HashMap hm = new HashMap();
			hm.put("title", title);
			hm.put("content", content);
			hm.put("user_num", user_num);
	
			if (us.insertBoard(hm)) {
				doProcess(resq, "저장 잘 됬꾸만!!!!");
			} else {
				doProcess(resq, "값 똑바로 입력 안하냐잉~");
			}
		} else if (command.equals("BOARD_SELECT")) {
			String title = req.getParameter("title");
			System.out.println("검색할 제목 : " + title);
			HashMap hm = new HashMap();
			if (title != null && !title.equals("")) {
				hm.put("title", "%" + title + "%");
			}
			List<Map> boardList = us.selectBoard(hm);
			String result = "";
			for (Map m : boardList) {
				result += m.toString();
			}
			doProcess(resq, result);
		} else if (command.equals("BOARD_DELETE")) {
			String num = req.getParameter("board_num");
			System.out.println("삭제할 번호 : " + num);
			HashMap hm2 = new HashMap();
			hm2.put("num", num);
			if (us.deleteUser(hm2)) {
				doProcess(resq, "저장 잘 됬꾸만!!!!");
			} else {
				doProcess(resq, "값 똑바로 입력 안하냐잉~");
			}
		}else if (command.equals("BOARD_UPDATE")) {
			String user_num1 = req.getParameter("user_num");
			String writer1 = req.getParameter("writer");
			String title1 = req.getParameter("title");
			String content1 = req.getParameter("content");
			System.out.println("업데이트할 번호 : " + user_num1);
			System.out.println("업데이트한 내용 : " + writer1 + "," + title1 + "," + content1);

			HashMap hm3 = new HashMap();
			hm3.put("user_num", user_num1);
			hm3.put("writer", writer1);
			hm3.put("title", title1);
			hm3.put("content", content1);
			if (us.updateUser(hm3)) {
				doProcess(resq, "저장 잘 됬꾸만!!!!");
			} else {
				doProcess(resq, "값 똑바로 입력 안하냐잉~");
			}
		}

	}

	

//	public void dePost(HttpServletRequest req, HttpServletResponse reqs) throws IOException {
//
//	}

	public void doProcess(HttpServletResponse resq, String writeStr) throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);

	}
}