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

// 使用
require(
        [
            'echarts',
            'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
        ],
        function(ec) {
            // 基于准备好的dom，初始化echarts图表
            var myChart = ec.init(document.getElementById('line_l'));


            var option = {
                title: {
                    text: '当日风速与功率实时曲线',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['风速', '实时功率'],
                    y: "40px"
                },
                toolbox: {
                    show: false
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'tim',
                        boundaryGap: false,
                        data: ['0', '2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24']
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '风速',
                        type: 'line',
                        data: [12, 12, 43, 234, 564, 34]
                    },
                    {
                        name: '实时功率',
                        type: 'line',
                        data: [12, 12, 43, 234, 564, 34]
                    }
                ]
            };
            myChart.setOption(option);
        }
);
});
