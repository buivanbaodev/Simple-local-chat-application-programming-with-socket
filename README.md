# Simple-local-chat-application-programming-with-socket
Simple-local-chat-application-programming-with-socket
1. Socket là cái gì nhỉ?
Trước hết bạn cần hiểu được mô hình Client - Server đã nhé:

Mô hình Client-Server (hay còn gọi là mô hình máy khách - máy chủ) là mô hình mà ở đây, máy khách là các máy tính, các thiết bị điện tử như máy in, điện thoại bàn, máy fax,… các máy khách này gửi yêu cầu đến server (hay còn được gọi là máy chủ). Máy chủ, xử lý các yêu cầu đó và trả về kết quả


Socket là một giao diện lập trình ứng dụng mạng được dùng để truyền và nhận dữ liệu trên internet. Giữa hai chương trình chạy trên mạng cần có một liên kết giao tiếp hai chiều để kết nối với nhau. Điểm cuối (endpoint) của liên kết này được gọi là socket, cho phép người dùng kết nối các máy tính truyền tải và nhận dữ liệu từ máy tính thông qua mạng. Vì vậy, hiểu đơn giản thì socket là thiết bị truyền thông hai chiều gửi và nhận dữ liệu từ máy khác.
Để xây dựng được một ứng dụng chat bằng Socket thì cần phải hiểu rõ cách thức hoạt động của nó, có rất nhiều loại Socket, nhưng ở đây mình sẽ lấy Stream Socket làm ví dụ, và sẽ dùng nó để lập trình nên phần mềm chat giữa client và server, Stream Socket hoạt động như sau:


Stream Socket hay còn gọi là socket hướng kết nối, là socket hoạt động thông qua giao thức TCP (Transmission Control Protocol). Stream Socket chỉ hoạt động khi server và client đã kết nối với nhau thông qua một IP và Port, dữ liệu truyền đi được đảm bảo truyền đến đúng nơi nhận, đúng thứ tự với thời gian nhanh chóng.
2. Tạo một ứng dụng chat đơn giản bằng JFrame (Java)
Đầu tiên, chúng ta tạo một project mới đặt tên nó là ChattingSoftware (hoặc tên tùy thích), thêm vào project mới tạo này 2 lớp JFrame, lần lượt đặt tên là ClientGUI và ServerGUI và 1 lớp JPanel đặt tên là ChatPanel.





Ý nghĩa của từng lớp JFrame:

ClientGUI dùng để thiết kế giao diện người dùng cho phần mềm chat bên máy khách
ServerGUI dùng để thiết kế giao diện người dùng cho phần mềm chat bên máy chủ, quản lí các máy khách
ChatPanel dùng để thiết kế một JPanel, JPanel này dùng cho việc hiển thị cửa sổ chat và các tin nhắn giữa client-server. Vì cả Client và Server điều dùng chung một JPanel để hiện thị tin nhắn, nên mình sẽ tách nó ra thành một lớp riêng vì style của mình như vậy, các bạn có thể viết lớp ChatPanel này bên trong ClientGUI và ServerGUI (nhưng các bạn sẽ phải viết lại 2 lần, tốn thời gian hơn).
Khi tạo xong, project của các bạn sẽ tương tự như sau: 
 

2.1 Thiết kế ChatPanel
Tiếp đến là phần Design (thiết kế giao diện) cho từng lớp, đầu tiên vào ChatPanel và chọn tab Design (nếu bạn dùng Eclipse hoặc Netbean) và tạo các Components như sau (các bạn có thể tự design phần này theo ý của mình).



Lưu ý: khuyến khích các bạn chỉnh các Layout cho các Panel một cách phù hợp để tránh trường hợp bị lỗi hiển thị, thiếu chữ, thiếu nút,... Vì phần này khá dài nên mình sẽ không đề cập đến ở đây, các bạn có thể tìm hiểu về các Layout cũng như cách dùng các Layout tại: https://vietjack.com/java_swing/layout_trong_java_swing.jsp và học cách thiết kế một giao diện đồ họa bằng JFrame (Java) tại https://www.devpro.edu.vn/lap-trinh-java-swing .

Tiếp đến chúng ta thay đổi tham số hàm dựng cho ChatPanel, nhằm mục đích truyền vào trong ChatPanel một Socket, tên của người gửi tin nhắn và tên người nhận tin nhắn, từ lúc này trở đi thì phải code một tí rồi:

//Hàm dựng lớp ChatPanel
    public ChatPanel(Socket s, String sender, String receiver) {
	try {
	    //Khởi tạo các Components cho giao diện đồ họa
	    initComponents();
	    
	    //Truyền socket(Socket này sẽ được tạo sau)
	    socket = s;
	    
	    //Nhận tên người gửi và người nhận
	    this.sender = sender;
	    this.receiver = receiver;
	    
	    //Tạo các bộ đệm để gửi và nhận tin nhắn
	    bf = new BufferedReader(new InputStreamReader(socket.getInputStream()));
	    os = new DataOutputStream(socket.getOutputStream());
	} catch (Exception e) {
	    System.out.println("Error while create Main Panel");
	}

    }
Tiếp đến chúng ta tạo một ActionListener cho nút SEND, khi ấn vào nút này thì chúng ta mong rằng tin nhắn sẽ được gửi đi và hiện vào trong mục lịch sử chat:

 btnNewButton.addActionListener(new ActionListener() {
		//Một Action Listener để gửi tin nhắn đi mỗi khi người dùng ấn nút SEND
		@Override
		public void actionPerformed(ActionEvent arg0) {
		    // Kiểm tra xem người dùng nhập tin nhắn hay chưa
		    if (inputMess.getText().isEmpty()) return;
		    try {
			// Ghi dữ liệu từ ô nhập tin nhắn vào "bộ đệm của của socket"
                        // để sau này chúng ta có thể lấy dữ liệu này từ server
			os.writeBytes(inputMess.getText());
			// Xuống Dòng + Xóa bộ đệm
			os.write(13);
			os.write(10);
			os.flush();

			// Ghi dữ liệu vào textArea ở phía trên
			displayChattingHistory.append("\n" + sender + ": " + inputMess.getText());

			// Xóa hết tin nhắn tại ô nhập tin nhắn
			inputMess.setText("");
		    } catch (Exception e) {
			System.out.println("Error while sendding messeger");
		    }
		}
});
Có vẻ khá đầy đủ rồi đấy, nhưng vẫn còn thiếu một thứ, nếu như thiếu một Thread để đảm nhận nhiệm vụ kiểm tra các tin nhắn mới và hiển thị nó lên mục lịch sử, thì mục lịch sử chat của bạn sẽ chỉ có các tin nhắn bạn đã gửi đi, vì thế chúng ta tạo một phương thức run tại ChatPanel như sau:

//Một phương thức run được implement từ lớp Runable với mục đích kiểm tra tin nhắn đến
    @Override
    public void run() {
	while (true) {
	    try {
		if (socket != null) {
		    String msg = "";
		    while ((msg = bf.readLine()) != null) {
			//Nếu có tin nhắn đến thì ghi vào lịch sử
			displayChattingHistory.append("\n" + receiver + ": " + msg);
		    }
		}
	    } catch (Exception e) {
		// Do not change this because it spawn try-catch many time while running thread!
	    }
	}
    }
Thế là hoàn tất thiết kế một JPanel để hiển thị tin nhắn, phần còn lại khá đơn giản, chúng ta hãy tiếp tục.

2.2. Thiết kế Server
Tương tự như phần 1, tạo các Component như sau: 



Tiếp theo chúng ta tạo một ActionListener cho nút "START SERVER" mà khi nhấn nút này, phần mềm sẽ tạo một Server Socket cho phép các client kết nối vào:

btnNewButton.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent arg0) {
		    //Cổng mặc định là 8, bạn có thể đổi thành số bạn thích
		    int port = 8;
		    try {
			//Kiểm tra dữ liệu nhập vào
			port = Integer.parseInt(textField.getText());
		    } catch (Exception e) {
			JOptionPane.showMessageDialog(contentPane,
			                "Can't start at this port, program will use the default port=8\nDetails: " + e,
			                "Error while read Port", JOptionPane.ERROR_MESSAGE);
		    }
		    try {
			//Hiểu nôm na là chạy Server tại port này
			socket = new ServerSocket(port);
			JOptionPane.showMessageDialog(contentPane, "Server is running at port: " + port, "Started server",
			                JOptionPane.INFORMATION_MESSAGE);

		    } catch (Exception e) {
			JOptionPane.showMessageDialog(contentPane, "Details: " + e, "Start server error",
			                JOptionPane.ERROR_MESSAGE);
		    }
		    
		    //Chạy Server (class ServerGUI hiên tại) để kiểm tra các luồng kết nối vào server sau này, 
                    //ở đây biến "thisServerGUI" đã được mình gán ở đầu class
		    Thread t=new Thread(thisServerGUI);
		    t.start();
		}
	    });
Ở dòng gần cuối, bạn sẽ nhận ra để các Client kết nối được đến server này thì cần implement một phương thức run như phần 1, liên tục kiểm tra các kết nối từ Client gửi đi, vì vậy chúng ta thêm vào ServerGUI một phương thức run. Lưu ý dưới đây vẫn là cách xử lý của mình, có một cách khác là bạn có thể tạo thêm một nút "ACCEPT CONNECT" chẳng hạn, nút này sẽ chấp nhận các kết nối từ Client gửi đi khi ấn vào.

@Override
    public void run() {
	while (true)
	    try {
		// Chấp nhận kết nối từ Client
		Socket staffSocket = socket.accept();
		if (staffSocket != null) {
		    // Lấy tên của nhân viên vừa nhắn tin cho Server
		    // Có nhiều cách xử lý, đây là cách của mình
		    br = new BufferedReader(new InputStreamReader(staffSocket.getInputStream()));
		    String staffName = br.readLine();
		    staffName = staffName.substring(0,staffName.indexOf(":"));

		    // Tạo ChatPanel và show nó vào cái TabbedPane, khá là đơn giản
		    ChatPanel chatPanel = new ChatPanel(staffSocket, "Manager", staffName);
		    tabbedPane.add(staffName, chatPanel);
		    chatPanel.updateUI();
		    
		    // Chạy Thread ChatPanel để kiểm tra các tin nhắn đến và đi (Đã giải thích ở phần 1)
		    Thread t=new Thread(chatPanel);
		    t.start();
		}

		// Không cần thiết cho lắm
		Thread.sleep(1000);
	    } catch (Exception e) {
		// Do not change this because it spawn try-catch many time while running thread!
	    }
    }
Vậy là server chạy ngon lành rồi, cuối cùng thì tạo một cái Client là xong

2.3. Thiết kế Client
Tạo các component:



Tương tự, tạo ActionListener cho nút "CONNECT" nhằm tạo một socket và kết nối tới địa chỉ IP cũng như cổng cho trước từ server:

 btnNewButton.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent arg0) {
		    try {
			//Lấy dữ liệu bao gồm name,ip,port
			ip = inputIP.getText();
			port = Integer.parseInt(inputPort.getText());
			name = inputName.getText();
			
			//Tạo một socket bằng ip và port ở trên
			socket = new Socket(ip, port);
			
			// Validation__________________________
			if (name.isEmpty()) throw new Exception("Empty Name");
			if (socket == null) throw new Exception("Null Socket");
			
			//Tạo một ChatPanel
			panel.removeAll();
			ChatPanel chatPanel = new ChatPanel(socket, name, "Manager");
			panel.add(chatPanel);
			panel.updateUI();
			
			//Cho ChatPanel này "chạy" để kiểm tra tin nhắn đến và đi
			Thread t=new Thread(chatPanel);
			t.start();
			
			//Thông báo chạy thành công
			JOptionPane.showMessageDialog(contentPane, "Connect success", "Connected",
			                JOptionPane.INFORMATION_MESSAGE);
		    } catch (Exception e) {
			JOptionPane.showMessageDialog(contentPane,
			                "Error while connect, please check details try again!\nDetails: " + e,
			                "Error while connect", JOptionPane.ERROR_MESSAGE);
		    }
		}
});
3. Chạy chương trình
Chạy chương trình tại Server (ServerGUI) đầu tiên để tạo cổng kết nối:



Tiếp đến chạy chương trình bên Client (ClientGUI) để nhắn tin, có thể tạo nhiều Client cùng lúc:



Vậy là các bạn có thể nhắn tin qua lại bằng phần mềm này rồi đó, một server có thể nhắn tin cho nhiều client khác nhau ở mạng cục bộ:



4. Kết thúc
Vậy là trên đây mình đã hướng dẫn các bạn cách tạo cũng như chạy một phần mềm chat đơn giản bằng socket, lưu ý các dòng code ở trên chỉ là hướng dẫn các bạn thực thi các chức năng để có thể kết nối giữa client-server, các bạn hãy dựa vào và biến thể để tạo thành một phần mềm hoàn chỉnh. Hy vọng sau bài viết này, các bạn có thể biết thêm được nhiều kiến thức mới, cảm ơn các bạn đã đọc. 

Tham khảo source code của mình tại: chatting software  (Java_EclipseProject)
