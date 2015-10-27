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
        <script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>
        <script>
            $(function (){
               $(".moni_center select").change(function (){
                   window.location.href = $(".moni_center :selected").val() + ".jsp";
               });
            });
        </script>
        <script type="text/javascript">

            $(function() {
                require.config({
                    paths: {
                        echarts: 'http://echarts.baidu.com/build/dist'
                    }
                });

    // 使用
                require(
                        [
                            'echarts',
                            'echarts/chart/gauge' // 使用柱状图就加载bar模块，按需加载
                        ],
                        function(ec) {
                            // 基于准备好的dom，初始化echarts图表
                            var myChart = ec.init(document.getElementById('main'));

                            var option = {
                                tooltip: {
                                    formatter: "{a} <br/>{b} : {c}%"
                                },
                                toolbox: {
                                    show: true,
                                    feature: {
                                        mark: {show: true},
                                        restore: {show: true},
                                        saveAsImage: {show: true}
                                    }
                                },
                                series: [
                                    {
                                        name: '业务指标',
                                        type: 'gauge',
                                        splitNumber: 10, // 分割段数，默认为5
                                        axisLine: {// 坐标轴线
                                            lineStyle: {// 属性lineStyle控制线条样式
                                                color: [[0.2, '#228b22'], [0.8, '#48b'], [1, '#ff4500']],
                                                width: 8
                                            }
                                        },
                                        axisTick: {// 坐标轴小标记
                                            splitNumber: 10, // 每份split细分多少段
                                            length: 12, // 属性length控制线长
                                            lineStyle: {// 属性lineStyle控制线条样式
                                                color: 'auto'
                                            }
                                        },
                                        axisLabel: {// 坐标轴文本标签，详见axis.axisLabel
                                            textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                                color: 'auto'
                                            }
                                        },
                                        splitLine: {// 分隔线
                                            show: true, // 默认显示，属性show控制显示与否
                                            length: 30, // 属性length控制线长
                                            lineStyle: {// 属性lineStyle（详见lineStyle）控制线条样式
                                                color: 'auto'
                                            }
                                        },
                                        pointer: {
                                            width: 5
                                        },
                                        title: {
                                            show: true,
                                            offsetCenter: [0, '-40%'], // x, y，单位px
                                            textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                                fontWeight: 'bolder'
                                            }
                                        },
                                        detail: {
                                            formatter: '{value}%',
                                            textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                                color: 'auto',
                                                fontWeight: 'bolder'
                                            }
                                        },
                                        data: [{value: 50, name: '完成率'}]
                                    }
                                ]
                            };
                            myChart.setOption(option);
                        }
                );
                $(".back").click(function() {
    //                  history.back();
//                    location.replace(document.referrer);//不要用history.back(),它不会刷新页面
                      window.location.href="index.jsp";
                });
                $(".item").click(function() {
                    window.location.href = "oneFactory.jsp";
                });
                $(".matrix_tabs").click(function() {
                    window.location.href = "oneFactory.jsp";
                });
                $("#matrix_list").hide();
                $(".nav_fd2").toggle(function() {
                    $("#li_1").removeClass("focus");
                    $("#li_2").addClass("focus");
                    $("#matrix_play").hide();
                    $("#matrix_list").show();
                }, function() {
                    $("#li_2").removeClass("focus");
                    $("#li_1").addClass("focus");
                    $("#matrix_play").show();
                    $("#matrix_list").hide();
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
                    <li id="li_1" class="focus"><a>矩阵显示</a></li>
                    <li id="li_2"><a>运行列表</a></li>
                </ul>
                <p style="margin-left: 30px">TZ2000-93&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;24台 | 总计 </p>
                <table>
                    <tr><td rowspan="2"><img src="images/man.gif"/></td><td>电话</td><td>手机</td></tr>
                    <tr><td>18661362602</td><td>18661362602</td></tr>
                </table>
            </div>
            <div>
                <div class="matrix_l" id="matrix_list">
                    <table class="matrix_tabs">
                        <th>风机编号</th>
                        <th>风机型号</th>
                        <th>日发电量[KWh]</th>
                        <th>功率[kW]</th>
                        <th>风速[m/s]</th>
                        <th>状态</th>
                        <tr><td>A1</td><td></td><td>0.5</td><td>0</td><td>3.30</td><td></td></tr>
                        <tr><td>A2</td><td></td><td>0.5</td><td>0</td><td>3.30</td><td></td></tr>
                        <tr><td>A3</td><td></td><td>0.5</td><td>0</td><td>3.30</td><td></td></tr>
                        <tr><td>A4</td><td></td><td>0.5</td><td>0</td><td>3.30</td><td></td></tr>
                        <tr><td>A5</td><td></td><td>0.5</td><td>0</td><td>3.30</td><td></td></tr>
                    </table>
                </div>
                <div class="matrix_l" id="matrix_play">
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A1</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A2</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A3</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A4</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A5</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A6</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A7</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A8</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A9</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div><div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A10</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div><div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A11</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A12</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A13</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A14</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-l"><img src="images/ff.jpg" /></div>
                        <div class="item-r">
                            <p class="bd">A15</p>
                            <p>6.3m/s</p>
                            <p>289.50KW</p>
                            <div class="wrapdiv">
                                <div class="indiv" style="width:20%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="matrix_r">
                    <div class="box">
                        <p>风场概览</p>
                        <table width="330" cellspacing="0" cellpadding="0" class="tbs">
                            <tr>
                                <td class="t1">装机容量</td><td class="t2">48000MW</td><td class="t1">年发电量</td><td class="t2">2万 kwh</td>
                            </tr><tr>
                                <td class="t1">实时功率</td><td class="t2">12.52MW</td><td class="t1">月发电量</td><td class="t2">0.2万 kwh</td>
                            </tr><tr>
                                <td class="t1">平均风速</td><td class="t2">5.8m/s</td><td class="t1">日发电量</td><td class="t2">0.07万 kwh</td>
                            </tr>
                        </table>
                    </div>
                    <div class="box">
                        <p>功率趋势图</p>
                        <div class="fdl">
                            生成Echarts 图表
                        </div>
                    </div>

                    <div class="box">
                        <p>计划任务</p>

                        <div class="fdl">
                            <div id="main" style="height:200px"></div>
                            <div class="tit">年发电量 （万kwh）</div>
                            <div class="jindu"><span>0.12%</span>0.2/85000</div>
                            <div class="tit" style="margin-top:10px;">月发电量 （万kwh）</div>
                            <div class="jindu"><span>0.22%</span>0.2/7000</div>
                        </div>
                    </div>
                    <div class="box">
                        <p>报警信息</p>
                        <div class="fdl">
                            <table cellpadding="0" cellspacing="0" class="tbs2">
                                <tr>
                                    <td width="30"><b>A15</b></td>
                                    <td width="130"><b>2015-05-15 13:20:13</b></td>
                                    <td>风速小于偏航风速</td>
                                </tr><tr>
                                    <td width="30"><b>A21</b></td>
                                    <td width="130"><b>2015-05-15 14:21:14</b></td>
                                    <td>变桨轴承进口堵塞</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
