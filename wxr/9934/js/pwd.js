try{
	var pwd="";
	var len=Number(window.prompt("length:","32"));
	var va=0;
	var vb="";
	var i;
	for(i=0;i<len;i++){
		va=Math.floor(64*Math.random());
		vb="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"[va]
		pwd+=vb;
	}
	alert(pwd);
}catch(e){
	var errw=window.open("","","height=200, width=300, top=100, left=250, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,titlebar=yes");
	errw.document.writeln("<!doctype html>");
	errw.document.writeln("<html>");
	errw.document.writeln("<head>");
	errw.document.writeln("<title>�޷����ʻ�ҳ���д���-9934</title>");
	errw.document.writeln("</head>");
	errw.document.writeln("<body>");
	errw.document.writeln("<div>");
	errw.document.writeln("<h1>ҳ�����</h1>");
	errw.document.writeln("</div>");
	errw.document.writeln("<div>");
	errw.document.writeln("<h3>");
	errw.document.writeln("�������ͣ�"+e.name);
	errw.document.writeln("</h3>");
	errw.document.writeln("<h3>");
	errw.document.writeln("������Ϣ��"+e.message);
	errw.document.writeln("</h3>");
	errw.document.writeln("</div>");
	errw.document.writeln("</body>");
	errw.document.writeln("</html>");
}