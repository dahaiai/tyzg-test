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
        <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript">
            $(function (){
                 $(".warn_date").hide();
                 $(".nav_fd2").toggle(function() {
                    $("#li_1").removeClass("focus");
                    $("#li_2").addClass("focus");
                    $(".warn_date").show();
                }, function() {
                    $("#li_2").removeClass("focus");
                    $("#li_1").addClass("focus");
                    $(".warn_date").hide();
                });
                $(".moni_center select").change(function (){
                   window.location.href = $(".moni_center :selected").val() + ".jsp";
               });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <form class="moni_center" action="fdConfig.jsp">
                    请选择：<select>
                        <option value="index">运行监控中心</option>
                        <option selected="selected" value="warnCenter">故障报警中心</option>
                        <option value="reportCenter">统计报表中心</option>
                    </select>
                    <input type="submit" value="配置"></input>
                </form>
                 <div style="clear: both"></div>
                <div class="header_img">
                    <img src="images/warning.gif" width="50px" height="50px"></img>
                    <p>报警</p>
                </div>
            </div>
           
            <div class="nav_fd">
                <div class="back">返回</div>
                <div class="factory">乳山风电场</div>
                <div class="cb"></div>
            </div>
            <div class="info_fd">
                <ul class="nav_fd2" id="nav_fd">
                    <li id="li_1" class="focus"><a>风机实时报警</a></li>
                    <li id="li_2"><a>风机报历史报警</a></li>
                </ul>
                <table>
                    <tr><td rowspan="2"><img src="images/man.gif"/></td><td>电话</td><td>手机</td></tr>
                    <tr><td>18661362602</td><td>18661362602</td></tr>
                </table>
            </div>
            <div class="warn_info">
                <div class="warn_date">                         
                    <form>
                        请选择时间： <input type="text" class="Wdate" placeholder="请输入起始时间" size="22" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyyMMdd HH:mm:ss'})"></input>
                        <input type="text" class="Wdate" placeholder="请输入终止时间" size="22" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyyMMdd HH:mm:ss'})"></input>
                        <input type="button" value="导出excel表"></input>
                        <input type="button" class="query" value="查询"></input>
                    <form/>                        
                </div>
                <table cellpadding="0px" cellspacing="0px" class="tab_head">
                    <th class="th1">报警码</th><th class="th2">报警分类</th><th class="th3">风机编号</th><th class="th4">报警描述</th><th class="th5">发生时间</th>
                </table>
                <div class="content">
                    <table cellpadding="0px" cellspacing="0px" class="tab_body">
                        <tr><td class="td1">1997</td><td class="td2">变桨系统</td><td class="td3">A15</td><td class="td4">3号变桨变频器报警</td><td class="td5">2015-04-13 15:09:00</td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                        <tr><td class="td1"></td><td class="td2"></td><td class="td3"></td><td class="td4"></td><td class="td5"></td></tr>
                    </table>
                </div>

            </div>
        </div>
    </body>
</html>
