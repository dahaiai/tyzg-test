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
                 $(".report_r>div:gt(0)").hide();
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
                $("dd").click(function(){
                    $(".report_r>div").hide();
                    $("div."+$(this).attr("id")).show();
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
                        <option value="matrixDisplay">运行监控中心</option>
                        <option value="warnCenter">故障报警中心</option>
                        <option selected="selected" value="reportCenter">统计报表中心</option>
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
            <div class="report_info">
                <div class="report_l">
                    <p>功能菜单</p>
                    <dl>
                        <dt class="folded">项目数据配置</dt>
                        <dd id="sbxh_manage"><a>设备型号管理</a></dd>
                        <dd id="sbwh_manage"><a>设备维护管理</a></dd>
                        <dd id="bjxx_manage"><a>报警信息配置</a></dd>
                        <dt class="folded">统计数据查询</dt>
                        <dd id="ztjl_query"><a>状态记录查询</a></dd>
                        <dd id="dl_query"><a>电量查询</a></dd>
                        <dd id="tjjl_query"><a>停机记录查询</a></dd>
                        <dd id="jz_query"><a>机组可利用率查询</a></dd>
                        <dt id="folded">历史数据查询</dt>
                        <dd id="lssj_query"><a>历史数据查询</a></dd>
                    </dl>
                </div>
                <div class="report_r">
                    <div style="font-size: 28px">欢迎进入统计报表中心</div>
                    <div class="sbxh_manage">
                        <div>
                            <form>
                               <input type="button" class="query" value="查询"></input>
                               <input type="button" value="导出excel表"></input>
                            </form>
                        </div>
                        <table>
                            <tr><td>风电厂名称</td><td>机组型号</td><td>额定风速</td><td>切入风速</td><td>切出风速</td><td>业主</td><td>操作</td></tr>
                            <tr><td>乳山</td><td>TZ2000/93-80</td><td>XX</td><td>XX</td><td>XX</td><td>XX</td><td>编辑</td></tr>
                        </table>
                    </div>
                    <div class="sbwh_manage">
                        <div>
                            <form>
                               <input type="button" class="query" value="查询"></input>
                               <input type="button" value="导出excel表"></input>
                            </form>
                        </div>
                        <table>
                            <tr><td>风电厂名称</td><td>机组型号</td><td>机组编号</td><td>维护原因</td><td>操作</td><td>结果</td><td>维护人员</td><td>时间</td><td>操作</td></tr>
                            <tr><td>乳山</td><td>TZ2000/93-80</td><td>XX</td><td>XX</td><td>XX</td><td>XX</td><td>XX</td><td>XX</td><td>编辑</td></tr>
                        </table>
                    </div>
                    <div class="bjxx_manage">
                        <div>
                            <form>
                               <input type="button" class="query" value="查询"></input>
                               <input type="button" value="导出excel表"></input>
                            </form>
                        </div>
                        <table>
                            <tr><td>故障编码/名称</td><td style="width: 300px">中文描述</td><td>报警级别</td><td>故障类别</td><td>操作</td></tr>
                            <tr><td>中文描述</td><td></td><td>XX</td><td>XX</td><td>编辑</td></tr>
                        </table>
                    </div>
                    <div class="ztjl_query">
                        <div>
                            <form>
                                请选择时间： <input type="text" class="Wdate" placeholder="请输入起始时间" size="22" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyymmdd HH:mm:ss'})"></input>
                               <input type="text" class="Wdate" placeholder="请输入终止时间" size="22" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyymmdd HH:mm:ss'})"></input>
                               <input type="button" class="query" value="查询"></input>
                               <input type="button" value="导出excel表"></input>
                            </form>
                        </div>
                        <table>
                            <tr><td>机组编号</td><td>总时长</td><td>运行时长</td><td>发电时长</td><td>故障时长</td><td>离线时长</td><td>停机时长</td><td>限电时长</td></tr>
                            <tr><td>中文描述</td><td></td><td>XX</td><td>XX</td><td></td><td></td><td></td><td></td></tr>
                        </table>
                    </div>
                     <div class="dl_query">
                        <div>
                            <form>
                                请选择时间： <input type="text" class="Wdate" placeholder="日期" size="22" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyymmdd HH:mm:ss'})"></input>
                                <input type="text" placeholder="月份" size="22" style="margin-left: 194px"></input>
                                <input type="text"  placeholder="年份" size="22" style="margin-left: 64px"></input>
                            </form>
                        </div>
                         <table style="float: left; margin-right: 10px">
                            <tr><td>机组编号</td><td>日平均风速</td><td>日发电量</td><td>日耗电量</td></tr>
                            <tr><td></td><td>XX</td><td>XX</td><td></td></td></tr>
                        </table>
                         <table style="float: left; margin-right: 10px">
                            <tr><td>月发电量</td><td>月耗电量</td></tr>
                            <tr><td></td><td>XX</td></tr>
                        </table>
                         <table style="float: left; margin-right: 10px">
                            <tr><td>年发电量</td><td>年耗电量</td></tr>
                            <tr><td></td><td>XX</td></tr>
                        </table>
                    </div>
                    <div class="tjjl_query" style="font-size: 28px">信息不明确，待开发</div>
                    <div class="jz_query" style="font-size: 28px">信息不明确，待开发</div>
                    <div class="lssj_query" style="font-size: 28px">未开发完</div>
                </div>
            </div>
               
        </div>
    </body>
</html>
