/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
                var myChart = ec.init(document.getElementById('g_three'));
                var option = {
                    tooltip: {
                        formatter: "{a} <br/>{c} {b}"
                    },
                    toolbox: {
                        show: false
                    },
                    series: [
                        {
                            name: '转速',
                            type: 'gauge',
                            center: ['50%', '55%'], // 默认全局居中
                            radius: '90%',
                            z: 3,
                            min: 0,
                            max: 1500,
                            startAngle: 180,
                            endAngle: 0,
                            splitNumber: 5,
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 5
                                }
                            },
                            axisTick: {// 坐标轴小标记
                                length: 12, // 属性length控制线长
                                lineStyle: {// 属性lineStyle控制线条样式
                                    color: 'auto'
                                }
                            },
                            splitLine: {// 分隔线
                                length: 17, // 属性length控制线长
                                lineStyle: {// 属性lineStyle（详见lineStyle）控制线条样式
                                    color: 'auto'
                                }
                            },
                            pointer: {
                                width: 6
                            },
                            title: {
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 17,
                                    fontStyle: 'italic'
                                }
                            },
                            detail: {
                                offsetCenter: [0, 10],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontSize: 25,
                                    fontWeight: 'bolder'
                                }
                            },
                            data: [{value: 50, name: 'r/min'}]
                        },
                        {
                            name: '发电功率',
                            type: 'gauge',
                            center: ['85%', '55%'], // 默认全局居中
                            radius: '70%',
                            z: 3,
                            min: 0,
                            max: 1500,
                            startAngle: 180,
                            endAngle: 0,
                            splitNumber: 5,
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 4.5
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
                            pointer: {
                                width: 4
                            },
                            title: {
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 12,
                                    fontStyle: 'italic'
                                }
                            },
                            detail: {
                                offsetCenter: [0, 10],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontSize: 20,
                                    fontWeight: 'bolder'
                                }
                            },
                            data: [{value: 40, name: 'kW.h'}]
                        },
                        {
                            name: '速度',
                            type: 'gauge',
                            center: ['15%', '55%'], // 默认全局居中
                            radius: '70%',
                            z: 3,
                            min: 0,
                            max: 1500,
                            startAngle: 180,
                            endAngle: 0,
                            splitNumber: 5,
                            axisLine: {// 坐标轴线
                                lineStyle: {// 属性lineStyle控制线条样式
                                    width: 4.5
                                }
                            },
                            pointer: {
                                width: 4
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
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontWeight: 'bolder',
                                    fontSize: 12,
                                    fontStyle: 'italic'
                                }
                            },
                            detail: {
                                offsetCenter: [0, 10],
                                textStyle: {// 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                    fontSize: 20,
                                    fontWeight: 'bolder'
                                }
                            },
                            data: [{value: 40, name: 'km/h'}]
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
