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
        <script type="text/javascript" src="js/dist/echarts.js"></script>
        <script type="text/javascript" src="js/gauge_dwpl.js"></script>
        <script type="text/javascript" src="js/yepian.js"></script>
        <script type="text/javascript" src="js/line_l.js"></script>
         <script type="text/javascript" src="js/line_r.js"></script>
         <script type="text/javascript" src="js/gauge_three.js"></script>
         <script type="text/javascript">
             $(function (){
//                window.location.reload();
                $(".fac_nav li").click(function(){
                    $(".fac_nav li.focus").removeClass("focus");
                    $(this).addClass("focus");
                });
                $(".back").click(function (){
//                  history.back();
                    location.replace(document.referrer);//不要用history.back(),它不会刷新页面
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
                        <option selected="selected" value="matrixDisplay">运行监控中心</option>
                        <option value="warnCenter">故障报警中心</option>
                        <option value="reportCenter">统计报表中心</option>
                    </select>
                    <input type="submit" value="配置"></input>
                </form>
                <div style="clear: both"></div>
                <div class="header_img">
                    <img src="images/warning.png" width="50px" height="50px"></img>
                    <p>报警</p>
                </div>
            </div>
            
            <div class="nav_fd">
                <div class="back">返回</div>
                <div class="factory">乳山风电场</div>
                <div class="cb"></div>
            </div>
            <div class="info_fd">
                <p>风机名称：A1         风机型号：TZ2000-93       运行状态：运行      首次并网时间：2013-11-01 00:00:00</p>
                <table>
                    <tr><td rowspan="2"><img src="images/man.gif"/></td><td>电话</td><td>手机</td></tr>
                    <tr><td>18661362602</td><td>18661362602</td></tr>
                </table>
            </div>
            
            <div class="fac_info">
                <div class="fac_nav">
                    <h2>一期工程314线</h2>
                    <ul>
                        <li class="focus"><a>A01</a></li><li><a>A02</a></li><li><a>A03</a></li><li><a>A04</a></li><li><a>A05</a></li>
                        <li><a>A06</a></li><li><a>A07</a></li><li><a>A08</a></li><li><a>A09</a></li><li><a>A10</a></li>
                        <li><a>A11</a></li><li><a>A12</a></li>
                    </ul>
                </div>
                <div class="fac_tabs">
                    <img></img>
                    <table cellpadding="0px" cellspacing="0px">
                        <tr><td>额定功率</td><td>241W</td><td>风轮直径</td><td>82.2m</td></tr>
                        <tr><td>切入风速</td><td>3m/s</td><td>**风速</td><td>11.2m/s</td></tr>
                        <tr><td>极限风速</td><td>52.5m/s</td><td>运行温度</td><td>-30~40℃</td></tr>
                        <tr><td>****</td><td>95n</td><td>日发电量</td><td>1000</td></tr>
                        <tr><td>风向</td><td>东南风</td><td>累计发电量</td><td>82.2m</td></tr>
                        <tr><td>主动功率</td><td>241W</td><td>**角度</td><td>82.2m</td></tr>
                        <tr><td>额定功率</td><td>241W</td><td>风轮直径</td><td>82.2m</td></tr>
                    </table>
                    <p>日平均风速:</p>
                </div>
                <div class="fac_fg">
                    <div class="fg_t">
                        <div class="fg_l">
                            <dir class="fg_gauge">
                                <div class="gauge_l">
                                    <table class="gauge_tabs" cellpadding="0" cellspacing="0">
                                        <tr><td>A相</td><td>B相</td><td>C相</td></tr>
                                        <tr><td>180V</td><td>399V</td><td>399V</td></tr>
                                        <tr><td>1210A</td><td>1255A</td><td>1235A</td></tr>
                                    </table>
                                    <div id="dwpl"></div>
                                    <p>功率因数</p>
                                </div>
                                <div class="gauge_r" id="g_three"></div>
                            </dir>

                            <div class="fg_line">
                                <div class="line_l" id="line_l"></div>
                                <div class="line_r" id="line_r"></div>
                            </div>
                        </div>
                        <div class="fg_r" id="yp"></div>
                    </div>
                    <div class="fg_b">
                        <div class="num0">
                            <p>28℃</p>
                            <div class="thermo">
                            <div class="temp"></div>
                            </div>
                            <p>环境</p>
                        </div>
                        <div class="num1">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>机舱</p>
                        </div>
                        <div class="num2">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>齿轮箱油</p>
                        </div><div class="num3">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>发动机轴承驱动端</p>
                        </div><div class="num4">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>发动机轴承非驱动端</p>
                        </div><div class="num5">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>齿轮箱高速轴1</p>
                        </div><div class="num6">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>齿轮箱高速轴2</p>
                        </div><div class="num7">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>主轴前承轴</p>
                        </div><div class="num8">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>主轴后承轴</p>
                        </div><div class="num9">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>发电机L1绕组</p>
                        </div><div class="num10">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>发电机L2绕组</p>
                        </div><div class="num11">
                            <p>28℃</p>
                            <div class="thermo1">
                            <div class="temp"></div>
                            </div>
                            <p>发电机L3绕组</p>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
</html>
