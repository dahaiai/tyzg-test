<%-- 
    Document   : index
    Created on : 2015-9-14, 11:03:06
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        <title>太原重工风电管理中心监控系统-地理分布</title>
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script>

        </script>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <div class="header_p">
                    <p>欢迎XX登录太原重工风电远程监控中心</p>
                </div>
            </div>

            <div class="con">
                <ul class="navCls">
                    <li class="focus"><a>地理分布</a></li>
                    <li><a href="fclb.jsp">风场列表</a></li>
                    <li><a href="fjjz.jsp">风机矩阵</a></li>
                </ul>
            </div>
            <div class="con_map">
                <div class="mapl">
                    <div class="mapt">

                    </div>
                    <div>
                        <img src="images/hengtiao.png" style="float: left; margin-left: 100px"></img>
                        <div class="box_button">
                            <button onclick="window.location.href = 'fdConfig.jsp'">配置中心</button>
                            <button onclick="window.location.href = '/tyzg-web/login.jsp'">退出系统</button>
                        </div>
                    </div>

                </div>
                <div class="mapr">
                    <div class="box">
                        <p>公司装机概览</p>
                        <div class="info">
                            <p>总装机：<input></input>MW</p>
                            <p>1.5MW风场<input></input>个,  共<input></input>MW</p>
                            <p>2.0MW风场<input></input>个,  共<input></input>MW</p>
                            <p>3.0MW风场<input></input>个,  共<input></input>MW</p>
                        </div> 
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
