#!/bin/python3
# Authored by Bobby Ling
import re
import textwrap

# config
stages = ["IF", "ID", "EX", "MEM", "WB"]
# ['IF_ID', 'ID_EX', 'EX_MEM', 'MEM_WB']
pipelines = [f"{stages[i]}_{stages[i+1]}" for i in range (len(stages)-1)]
wire_defines_file = "inc/PipelineStageWireDefs.vh"
pipeline_interface_template_file = "PipelineInterfaceTemplate.v"
generated_module_name = "PipelineInterface_{0}"
inst_module_name = f"{generated_module_name}_U"
inst_module_file = f"{generated_module_name}.v"
inst_module_include_file = f"inc/{generated_module_name}_Inst.vh"

def wire_defines_parser(wire_defines_file:str) -> tuple[dict[str, tuple[list[str], str]], dict[str, list]]:
    """由信号定义得到每个stage的信号信息和每个信号的stage信息

    Args:
        wire_defines_file (str): 文件名

    Returns:
        tuple[dict[str, tuple[list[str], str]], dict[str, list]]: (signal_dict, stage_dict)
    """    
    with open(wire_defines_file) as defines_file:
        signal_dict: dict[str, tuple[list[str], str]] = {}
        stage_dict: dict[str, list] = {}
        for line in defines_file.readlines():
            # match总是从字符串开头查找, 返回Match对象
            if (line_match := re.match(r"^(?:wire|reg) +(\[.*\])?(.*)", line)) is not None:
                # 每一合法的定义
                # 信号位宽定义
                singnal_width = line_match.group(1) if line_match.group(1) is not None else ""
                signals = line_match.group(2)
                # findall查找所有符合正则表达式的部分, 返回包含每一个匹配组查找结果的列表
                # e.g. [('IF', 'PC'), ('ID', 'PC'), ('EX', 'PC'), ('MEM', 'PC'), ('WB', 'PC')]
                signal_infos = re.findall(r"(IF|ID|EX|MEM|WB)_(\w+)_w", signals)
                signal_dict[signal_infos[0][1]] = ([group[0] for group in signal_infos], singnal_width)
                for signal_info in signal_infos:
                    stage, signal = signal_info
                    if stage not in stage_dict:
                        stage_dict[stage] = []
                    stage_dict[stage].append(signal)
        return signal_dict, stage_dict
        
with open(wire_defines_file) as defines_file, open(pipeline_interface_template_file) as template_file:
    TAB1 = "    "
    TAB2 = TAB1 + TAB1
    TAB3 = TAB1 + TAB1 + TAB1
    template = template_file.read().replace("//placeholder", "")
    
    signal_dict, stage_dict = wire_defines_parser(wire_defines_file)
    
    for pipeline, src_stage, dest_stage in zip(pipelines, stages[:-1], stages[1:]):
        with open(inst_module_file.format(pipeline)) as module_file, open(inst_module_include_file.format(pipeline)) as include_file:
            # //placeholder{0}
            module_name_suffix_tmpl:str = "_{0}"
            module_name_suffix_gen:str = module_name_suffix_tmpl.format(pipeline)
            # //placeholder{1}
            # dedent去除前导空格, """\去除首行\n
            io_define_tmpl:str = textwrap.dedent("""\
            {0}input      {1} {2}_i;
            {0}output reg {1} {2}_i;
            """)
            io_define_gen = ""
            # //placeholder{2}
            reset_tmpl:str = "{0}{1}_o <= 0;\n"
            reset_gen:str = ""
            # //placeholder{3}
            propagate_tmpl:str = "{0}{1}_o <= {1}_i;\n"
            propagate_gen:str = ""
            
            # 取两个阶段所需传递的信号交集为当前流水线传递信号
            signals = set(stage_dict[src_stage]) & set(stage_dict[dest_stage])
            for signal in signals:
                signal_width = signal_dict[signal][1]
                io_define_gen += io_define_tmpl.format(TAB1, signal_width, signal)
                reset_gen += reset_tmpl.format(TAB3, signal)
                propagate_gen += propagate_tmpl.format(TAB3, signal)
                
            generated = template.format(module_name_suffix_gen, io_define_gen, reset_gen, propagate_gen)
            print(generated)
                    
            
exit(0)