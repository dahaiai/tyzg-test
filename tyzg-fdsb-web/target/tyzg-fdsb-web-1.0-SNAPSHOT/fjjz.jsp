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
            $(function (){
                $("#aa").click(function (){
                    window.location.href = "matrixDisplay.jsp";
                });
//                $(".moni_center select").change(function (){
//                   window.location.href = $(".moni_center :selected").val() + ".jsp";
//               });
                $("#ul_item").click(function (){
                    window.location.href = "oneFactory.jsp";
                });
            });
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
                    <li><a href="index.jsp">地理分布</a></li>
                    <li><a href="fclb.jsp">风场列表</a></li>
                    <li class="focus">风机矩阵</li>
                </ul>
            </div>
            <div class="con_map">
                <div class="matrix">
                    <table class="tabslist" cellpadding="0" cellspacing="0">
                        <td class="td1" id="aa">
                            <div class="t">乳山风电场</div>
                            <div class="n">限电:&nbsp;&nbsp;&nbsp;0&nbsp;台</div>
                        </td>
                        <td class="td2">
                            <ul id="ul_item">
                                <li>A01</li><li>A02</li><li>A03</li><li>A04</li><li>A05</li>
                                <li>A06</li><li>A07</li><li>A08</li><li>A09</li><li>A10</li>
                                <li>A11</li><li>A12</li><li>A13</li><li>A14</li><li>A15</li>
                                <li>A16</li><li>A17</li><li>A18</li><li>A19</li><li>A20</li>
                                <li>A21</li><li>A22</li><li>A23</li><li>A24</li>
                                
                            </ul>
                        </td>
                    </table>
                    <div class="box_button">
                        <button onclick="window.location.href='fdConfig.jsp'">配置中心</button>
                        <button onclick="window.location.href='/tyzg-web/login.jsp'">退出系统</button>
                    </div>
                </div>
<!--                <div class="mapr">
                    <div class="box">
                        <p>公司指标概况</p>
                        <table width="330" cellspacing="0" cellpadding="0" class="tbs">
                            <tr>
                                <td class="t1">装机容量</td><td class="t2">48000MW</td><td class="t1">年发电量</td><td class="t2">2万 kwh</td>
                            </tr><tr>
                                <td class="t1">风场个数</td><td class="t2">1个</td><td class="t1">月发电量</td><td class="t2">0.2万 kwh</td>
                            </tr><tr>
                                <td class="t1">风机台数</td><td class="t2">24台</td><td class="t1">日发电量</td><td class="t2">0.07万 kwh</td>
                            </tr><tr>
                                <td class="t1">平均风速</td><td class="t2">5.8m/s</td><td class="t1">有功功率</td><td class="t2">12.54MW</td>
                            </tr>
                        </table>
                    </div>
                    <div class="box">
                        <p>风机状态浏览</p>
                        <dl class="status">
                                <dd class="s_yx"><span class="span_l">运行</span><span class="span_r">24</span></dd>
                                <dd class="s_jx"><span class="span_l">检修</span><span class="span_r">0</span></dd>
                                <dd class="s_gz"><span class="span_l">故障</span><span class="span_r">0</span></dd>
                                <dd class="s_dj"><span class="span_l">待机</span><span class="span_r">0</span></dd>
                                <dd class="s_lx"><span class="span_l">离线</span><span class="span_r">0</span></dd>
                                <dd class="last">总接入台数 24</dd>
                        </dl>
                    </div>
                    <div class="box">
                        <p>发电量完成情况</p>
                        <div class="fdl">
                                <div class="tit">年发电量 （万kwh）</div>
                                <div class="jindu"><span>0.12%</span>0.2/85000</div>
                                <div class="tit" style="margin-top:10px;">月发电量 （万kwh）</div>
                                <div class="jindu"><span>0.22%</span>0.2/7000</div>
                        </div>
                    </div>
                    <div class="box">
                        <p>发电量完成率</p>
                        <div class="fdl">
                                生成Echarts 图表
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </body>
</html>
