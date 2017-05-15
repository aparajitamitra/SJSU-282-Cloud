<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Basic Embed</title>
    
    <script type="text/javascript" 
	    src="https://public.tableau.com/javascripts/api/tableau-2.min.js"></script>
    <script type="text/javascript">
        function initViz() {
            var containerDiv = document.getElementById("vizContainer"),
                url = "https://us-east-1.online.tableau.com/#/site/poornimasrikanteshsjsuedu/views/newsheet/productprice_in_city?:iid=2",
                options = {
                    hideTabs: true,
                    onFirstInteractive: function () {
                        console.log("Run this code when the viz has finished loading.");
                    }
                };
            
            var vizTab = new tableau.Viz(containerDiv, url, options); 
            // Create a viz object and embed it in the container div.
        }
    </script>
</head>

<body onload="initViz();">
    <div id="vizContainer" style="width:800px; height:700px;"></div>    
</body>

</html>