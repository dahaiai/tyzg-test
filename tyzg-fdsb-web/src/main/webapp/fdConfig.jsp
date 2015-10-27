<%-- 
    Document   : fcConfig
    Created on : 2015-10-8, 11:17:05
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>太原重工</title>
        <link rel="stylesheet" href="css/layout.css" type="text/css"/>
        <link rel="stylesheet" href="css/skins/blue/jbox.css" type="text/css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
        <!-- jBox Start-->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.jBox-2.3.min.js"></script>
        <script type="text/javascript" src="js/jquery.jBox-zh-CN.js"></script>
        <!-- jBox End-->
        <script type="text/javascript" src="js/jquery.paginate.js"></script>
        <script>
            $(function() {
                $(".moni_center select").change(function() {
                    window.location.href = $(".moni_center :selected").val() + ".jsp";
                });
                //开始获取第一页
                getPagesAndData(1);
                getAddCutomes();
                foot(1, 1); //因为全局的字体是雅黑的，好像比较大，造成数字分行，这里设置为新罗马的
            });
            
            function getAddCutomes() {
                $.ajax({
                    "url": "/tyzg-fdsb-web/moni/getCustomesList.htm",
                    "type":"post",
                    "dataType": "json",
                    "success": function (result) {
                        $.each(result.data, function(i, item) {
                            $("#addCustomeId").append("<option value=\"" + item.id + "\">" + item.name + "</option>");
                            $("#editCustomeId").append("<option value=\"" + item.id + "\">" + item.name + "</option>");
                        });
                    }
                });
            }
            
            function foot(count, start) {
                $("#foot").paginate({
                    count: count,
                    start: start,
                    display: 10,
                    border: false,
                    text_color: '#79B5E3',
                    background_color: 'none',
                    text_hover_color: 'blue',
                    background_hover_color: 'none',
                    images: false,
                    mouse: 'press',
                    onChange: function(page) {
                        getPagesAndData(page);
                    }
                });
            }
            
            function getPagesAndData(page) {
                var carNo = $("#carNo").val();
                var gpsNo = $("#gpsNo").val();
                var subsidiary = $("#subsidiary").val();
                var subcompany = $("#subcompany").val();
                var standard = $("#standard").val();
                var customeInfo = $("#customeInfo").val();
                $.ajax({
                    url: "/tyzg-fdsb-web/moni/getCarsForPages.htm?start=" + page + "&carNo=" + carNo + "&gpsNo=" + gpsNo + "&subsidiary=" + subsidiary + "&subcompany=" + subcompany + "&standard=" + standard + "&customeInfo=" + customeInfo,
                    type: "post",
                    dataType: "json",
                    "success": function(result) {
                        if (result.count > 0) {
                            //有数据，清空table，重新画table，重新画foot
                            $("#tabsList").empty();
                            $("#tabsList").append("<tr><th>id</th><th>工作令</th><th>G码</th><th>子公司</th><th>子分公司</th><th>规格</th><th>添加日期</th><th>客户信息</th><th>位置</th><th>状态</th><th width=\"200px;\">操作</th></tr>");
                            $.each(result.data, function(i, item) {
                                var statusStr = "离线";
                                if (item.status == 1) {
                                    statusStr = "在线";
                                }
                                var address = "-";
                                if (item.lat != "" && item.lng != "") {
                                    //有地址
                                    address = "<a href=\"${ctx}/produce/carMap.htm?carNo=" + item.carNo + "\" target=\"right\">地图</a>";
                                }
                                $("#tabsList").append("<tr><td>" + item.id + "</td><td><a href=\"${ctx}/produce/monitor.htm?carNo=" + item.carNo + "\" target=\"right\">" + item.carNo + "</a></td><td>" + item.gpsNo + "</td><td>" + item.subsidiary + "</td><td>" + item.subcompany + "</td><td>" + item.standard + "</td><td>" + item.addDateStr + "</td><td>" + item.customeInfo + "</td><td>" + address + "</td><td>" + statusStr + "</td><td>" +
                                        "<div class=\"cz\">" +
                                        "<div class=\"cz_com\">" +
                                        "<span><a href=\"javascript:void(0)\" onclick=\"editCar('" + item.id + "','" + item.carNo + "','" + item.gpsNo + "','" + item.subsidiary + "','" + item.subcompany + "','" + item.standard + "','" + item.customeId + "');\">编辑</a>&nbsp;&nbsp;&nbsp;</span>" +
                                        "<span><a href=\"javascript:void(0)\" onclick=\"delCar('" + item.id + "');\">删除</a>&nbsp;&nbsp;&nbsp;</span>" +
                                        "<span><a href=\"javascript:void(0)\" onclick=\"showconfig('" + item.gpsNo + "');\">配置</a>&nbsp;&nbsp;&nbsp;</span>" +
                                        "</div>" +
                                        "</div>" +
                                        "</td>" +
                                        "</tr>");
                            });
                            $("#tabsList").append("<tr class=\"tr_foot\"><td colspan=\"11\"><div id=\"foot\"></div></td></tr>");
                            foot(result.count, result.start);
                        } else {
                            $("#tabsList").empty();
                            $("#tabsList").append("<tr><th>id</th><th>工作令</th><th>G码</th><th>子公司</th><th>子分公司</th><th>规格</th><th>添加日期</th><th>客户信息</th><th width=\"200px;\">操作</th></tr>");
                            $("#foot").text("没有记录");
                        }
                    }
                });
            }
        </script>
        <script type="text/javascript">
            function addCar() {
                $.jBox("id:addCar", {
                    title: "添加设备信息",
                    width: 500,
                    height: 350,
                    buttons: {"保存": 1, "取消": 0},
                    submit: function(v, h, f) {
                        if (v == 1) {
                            return addCheckAndSubmit(f);
                        } else {
                            return true;
                        }
                    }
                });
            }
            function editCar(id,carNo,gpsNo,subsidiary,subcompany,standard,customeId) {
                $.jBox("id:editCar", {
                    title: "编辑设备信息",
                    width: 500,
                    height: 350,
                    buttons: {"保存": 1, "取消": 0},
                    loaded:function(h) {
                        h.find("#editId").val(id);
                           h.find("#editCarNo").val(carNo);
                           h.find("#editGpsNo").val(gpsNo);
                           h.find("#editSubsidiary").val(subsidiary);
                           h.find("#editSubcompany").val(subcompany);
                           h.find("#editStandard").val(standard);
                           h.find("#editCustomeId").val(customeId);
                    },
                    submit: function(v, h, f) {
                        
                    }
                });
            }
            function delCar(id) {
                var submit = function(v, h, f) {
                    if (v == 'ok') {
                        $.ajax({
                            "url": "/tyzg-fdsb-web/moni/delCar.htm",
                            "data": "id=" + id,
                            "dataType": "json",
                            "type": "post",
                            "success": function(data) {
                                if(data.errorCode == "成功") {
                                    getPagesAndData(1);
                                    jBox.tip("删除成功", 'info');
                                }else {
                                    $.jBox.error(data.errorCode, '提示');
                                }
                            }
                        });
                    }else if (v == 'cancel') {
                        jBox.tip("取消删除", 'info');
                    }

                    return true; //close
                };

                $.jBox.confirm("确定删除？", "提示", submit);

            }
            function configCar() {
                $.jBox("id:configCar", {
                    title: "编辑设备信息",
                    width: 880,
                    height: 600,
                    buttons: {"保存": 0, "取消": 1}
                });
            }
            function check(name, content) {
                if (name == "") {
                    $.jBox.error(content, "提示");
                    return false;
                } else {
                    return true;
                }
            }
            
            function addCheckAndSubmit(f) {
                if (check(f.carNo, "请输入工作令")
                        && check(f.gpsNo, "请输入G码")
                        && check(f.subsidiary, "请输入子公司")
                        && check(f.subcompany, "请输入子分公司")
                        && check(f.standard, "请输入规格")
                        && check(f.customeId, "请输入客户信息")) {

                    $.ajax({
                        "url": "/tyzg-fdsb-web/moni/addCar.htm",
                        "data": "carNo=" + f.carNo + "&gpsNo=" + f.gpsNo + "&subsidiary=" + f.subsidiary + "&subcompany=" + f.subcompany + "&standard=" + f.standard + "&customeId=" + f.customeId,
                        "dataType": "json",
                        "type": "post",
                        "success": function(data) {
                            if (data.errorCode == "成功") {
                                getPagesAndData(1);
                            } else {
                                $.jBox.error(data.errorCode, "提示")
                            }
                        }
                    });
                } else {
                    return false;
                }
            }
        </script>

    </head>
    <body>
        <div class="container">
            <div class="header">
                <form class="moni_center" action="matrixDisplay.jsp">
                    请选择：<select>
                        <option selected="selected" value="matrixDisplay">运行监控中心</option>
                        <option value="warnCenter">故障报警中心</option>
                        <option value="reportCenter">统计报表中心</option>
                    </select>
                    <input type="submit" value="返回"></input>
                </form>
                <div style="clear: both"></div>
                <div class="header_img">
                    <img src="images/warning.gif" width="50px" height="50px"></img>
                    <p>报警</p>
                </div>
            </div>
            <div class="fd_config">
                <div class="s_condition">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>工作令：<input type="text"  class="s_ipt" id="carNo"/></td>
                            <td>&nbsp;G码：<input type="text"  class="s_ipt" id="gpsNo"/></td>	
                            <td>子分公司：<input type="text"  class="s_ipt" id="subcompany"/></td>
                            <td><button class="s_btn" style="margin-left:5px;">查 询</button></td>
                        </tr>
                        <tr>
                            <td>子公司：<input type="text"  class="s_ipt" id="subsidiary"/></td>
                            <td>规格：<input type="text"  class="s_ipt" id="standard"/></td>
                            <td>客户信息：<input type="text"  class="s_ipt" id="customeInfo"/></td>
                            <td>
                                <button class="s_btn" style="margin-left:5px;" onclick="addCar()">新 增</button>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="fd_info">
                    <table cellpadding="0" cellspacing="0"  id="tabsList">

                    </table>

                </div>
                <div id="addCar" style="display: none">
                    <div class="editB">
                        <form>
                            <table cellpadding="0" cellspacing="0" border="1" width="100%">
                                <tr>
                                    <td><span>*</span>工作令</td>
                                    <td><input type="text" name="carNo"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>G码</td>
                                    <td><input type="text" name="gpsNo"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>子公司</td>
                                    <td><input type="text" name="subsidiary"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>子分公司</td>
                                    <td><input type="text" name="subcompany"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>规格</td>
                                    <td><input type="text" name="standard"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>客户信息</td>
                                    <td>
                                        <select id="addCustomeId" name="customeId">
                                            <option selected="selected" value="">=====&nbsp;&nbsp;&nbsp;请选择&nbsp;&nbsp;&nbsp;=====</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div id="editCar" style="display: none">
                    <div class="editB">
                        <form>
                            <table cellpadding="0" cellspacing="0" border="1" width="100%">
                                <tr>
                                    <td><span>*</span>工作令</td>
                                    <td><input id="editCarNo" type="text"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>G码</td>
                                    <td><input id="editGpsNo" type="text"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>子公司</td>
                                    <td><input id="editSubsidiary" type="text"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>子分公司</td>
                                    <td><input id="editSubcompany" type="text"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>规格</td>
                                    <td><input id="editStandard" type="text"></input></td>
                                </tr>
                                <tr>
                                    <td><span>*</span>客户信息</td>
                                    <td>
                                        <select id="editCustomeId" name="customeId">
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div id="configCar" style="display: none">
                    <div class="configB">
                        <fieldset>
                            <legend>配置信息</legend>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>参数id</td>
                                    <td>寄存类型</td>
                                    <td>地址</td>
                                    <td>名称</td>
                                    <td>小数点</td>
                                    <td>显示类型</td>
                                    <td>组号</td>
                                    <td>组别</td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>
                                <tr>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 150px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                    <td><input type="text" style="width: 50px"></input></td>
                                </tr>

                            </table>
                        </fieldset>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>
