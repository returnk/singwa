<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<p><input type="checkbox">#######</p>
	<p><input type="checkbox">#######</p>
	<p><input type="checkbox">#######</p>
	<p><input type="checkbox">#######</p>
	<p><input type="checkbox">#######</p>
	<p><input type="checkbox">#######</p>
	<button onclick="select(true)">全选</button>
	<button onclick="select(false)">不选</button>
	<button onclick="fan()">反选</button>
	<button onclick="del()">删除</button>
</body>
</html>

<script>
	// 
	var inp = document.getElementsByTagName('input');
	function select(obj)
	{
		for(i=0; i<inp.length; i++)
		{
			inp[i].checked = obj;
		}
	}

	// 
	function fan()
	{
		for(i=0; i<inp.length; i++)
		{
			inp[i].checked = !inp[i].checked;
		}
	}

	function del()
	{
		for(i=inp.length-1; i>=0; i--)
		{
			if(inp[i].checked){
				inp[i].parentNode.parentNode.removeChild(inp[i].parentNode);
			}
		}
	}
</script>