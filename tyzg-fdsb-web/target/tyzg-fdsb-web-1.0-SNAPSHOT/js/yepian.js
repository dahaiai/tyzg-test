/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
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
            function(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('yp'));
//                var myChart = ec.init($("#main")[0]); 
                var option = {
                    backgroundColor: {color: 'rgba(123,123,123,0.5)'},
                    tooltip: {
                        formatter: "{a} {c} {b}"
                    },
                    toolbox: {
                        show: false
                    },
                    series: [
                        {
                            name: '叶片1',
                            type: 'gauge',
                            center: ['110px', '25%'], //圆心坐标
                            radius: [0, '100px'],
                            startAngle: 180,
                            endAngle: 90,
                            min: -5,
                            max: 95,
                            splitNumber: 5,
                            pointer: {width: 5},
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 5
                                }
                            },
                            axisTick: {// 坐标轴小标记
                                length: 10, // 属性length控制线长
                                lineStyle: {// 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            splitLine: {// 分隔线
                                length: 15, // 属性length控制线长
                                lineStyle: {// 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            title: {
                                show: true,
                                offsetCenter: ['0%', '30%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            detail: {
                                show: true,
                                offsetCenter: ['0%', '-50%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            data: [{value: 40, name: '叶片1'}]
                        },
                        {
                            name: '叶片2',
                            type: 'gauge',
                            center: ['110px', '55%'],
                            radius: [0, '100px'],
                            startAngle: 180,
                            endAngle: 90,
                            min: -5,
                            max: 95,
                            splitNumber: 5,
                            pointer: {width: 5},
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 5
                                }
                            },
                            axisTick: {// 坐标轴小标记
                                length: 10, // 属性length控制线长
                                lineStyle: {// 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            splitLine: {// 分隔线
                                length: 15, // 属性length控制线长
                                lineStyle: {// 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            title: {
                                show: true,
                                offsetCenter: ['0%', '30%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            detail: {
                                show: true,
                                offsetCenter: ['0%', '-50%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            data: [{value: 40, name: '叶片2'}]
                        },
                        {
                            name: '叶片3',
                            type: 'gauge',
                            center: ['110px', '90%'],
                            radius: [0, '100px'],
                            startAngle: 180,
                            endAngle: 90,
                            min: -5,
                            max: 95,
                            splitNumber: 5,
                            pointer: {width: 5},
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 5
                                }
                            },
                            axisTick: {// 坐标轴小标记
                                length: 10, // 属性length控制线长
                                lineStyle: {// 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            splitLine: {// 分隔线
                                length: 15, // 属性length控制线长
                                lineStyle: {// 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            title: {
                                show: true,
                                offsetCenter: ['0%', '30%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            detail: {
                                show: true,
                                offsetCenter: ['0%', '-50%'],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 15
                                }
                            },
                            data: [{value: 40, name: '叶片3'}]
                        }
                    ]
                };

//clearInterval(timeTicket);
                timeTicket = setInterval(function() {
                    option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
                    option.series[1].data[0].value = (Math.random() * 7).toFixed(2) - 0;
                    option.series[2].data[0].value = (Math.random() * 2).toFixed(2) - 0;
                    myChart.setOption(option, true);
                }, 2000);
            }
    );
});

