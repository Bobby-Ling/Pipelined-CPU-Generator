# CPU Pipeline Parts Verilog Code Auto Generator

## 简介

这里是一个简单的流水线接口自动生成脚本，可以极大简化Verilog CPU设计工作
在[FluorineDog/Pipelined-CPU-Generator](https://github.com/FluorineDog/Pipelined-CPU-Generator)基础上重写了生成脚本并重新组织项目结构

## 功能

输入:   
- include/PipelineStageWireDefs.vh
    流水线变量名定义文件
- templates/PipelineInterfaceTemplate.v
    流水接口模块定义模板(使用`str.format()`填充)

输出:   
- generated/*.v
    流水线模块定义
- include/generated/*.vh
    流水线模块连接代码(实例化生成的模块并连接至include/PipelineStageWireDefs.vh的wire)

## 使用

见RiscV32CoreDemo.v

## 命名规范

合法的一行定义: `r"^(wire|reg) +(\[.*\])?(.*);"`
信号识别规则: `r"(IF|ID|EX|MEM|WB)_(\w+)_w"`
见include/PipelineStageWireDefs.vh文件

## 参考样例

见include/PipelineStageWireDefs.vh文件
