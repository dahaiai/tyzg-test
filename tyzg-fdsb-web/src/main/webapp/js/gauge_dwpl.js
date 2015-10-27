/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
   require.config({
            paths: {
                echarts: 'js/dist'
            }
        });
            require(
            [
                'echarts',
                'echarts/chart/gauge'
            ],
            
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('dwpl')); 
                var option = {
                    tooltip : {
                        formatter: "{a}:{c}HZ"
                    },
                    toolbox: {
                        show : false,
                        feature : {
                            mark : {show: true},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    series : [
                        {
                            name:'电网频率',
                            type:'gauge',
                            startAngle:150,
                            endAngle:30,
                            min:45,
                            max:55,
                            splitNumber: 2,       // 分割段数，默认为5
                            axisLine: {            // 坐标轴线
                                lineStyle: {       // 属性lineStyle控制线条样式
                                    color: [[0.2, '#228b22'],[0.8, '#48b'],[1, '#ff4500']], 
                                    width: 5
                                }
                            },
                            axisTick: {            // 坐标轴小标记
                                splitNumber: 5,   // 每份split细分多少段
                                length :12,        // 属性length控制线长
                                lineStyle: {       // 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    color: 'auto'
                                }
                            },
                            splitLine: {           // 分隔线
                                show: true,        // 默认显示，属性show控制显示与否
                                length :30,         // 属性length控制线长
                                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            pointer : {
                                width : 5
                            },
                            title : {
                                show : true,
                                offsetCenter: ['-60%', '20%'],       // x, y，单位px
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontSize:10
                                }
                            },
                            detail : {
                                formatter:'{value}HZ',
                                width:200,
                                heigh:100,
                                offsetCenter: ['60%', '-5%'],
                                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    color: 'auto',
                                    fontSize:10
                                }
                            },
                            data:[{value: 50, name: '电网频率'}]
                        }
                    ]
                };

//                            clearInterval(timeTicket);
                var timeTicket = setInterval(function (){
                    option.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
                    myChart.setOption(option,true);
                },2000);
            }
        );
 
});