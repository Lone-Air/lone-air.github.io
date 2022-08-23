function ff(m,text)
{
	var last="",text2="",key="";
	var i,j;
	for (i=0;i<text.length;i++)
	{
		for (j=0;j<m.length;j++)
		{
			key=m.charCodeAt(j);
			text2=text.charCodeAt(i)^key;
		}
		last+=String.fromCharCode(text2);
	}
	return last;
}