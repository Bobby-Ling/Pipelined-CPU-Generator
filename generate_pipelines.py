#!/bin/python3
# Authored by Bobby Ling
import re
import textwrap

# config

stages = ["IF", "ID", "EX", "MEM", "WB"]
# ['IF_ID', 'ID_EX', 'EX_MEM', 'MEM_WB']
pipelines = [f"{stages[i]}_{stages[i+1]}" for i in range (len(stages)-1)]
wire_defines_path = "include/PipelineStageWireDefs.vh"
module_template_path = "templates/PipelineInterfaceTemplate.v"
module_inst_template_path = "templates/PipelineInterfaceInstTemplate.v"
generated_module_name = "PipelineInterface_{0}"
gen_module_path = f"generated/{generated_module_name}.v"
gen_inst_module_path = f"include/generated/{generated_module_name}_Inst.vh"

def wire_defines_parser(wire_defines_path:str) -> tuple[dict[str, tuple[list[str], str]], dict[str, list]]:
    """由信号定义得到每个stage的信号信息和每个信号的stage信息

    Args:
        wire_defines_path (str): 文件名

    Returns:
        tuple[dict[str, tuple[list[str], str]], dict[str, list]]: (signal_dict, stage_dict)
    """    
    with open(wire_defines_path) as defines_file:
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
        
def generate(dry_run = True):
    with open(module_template_path) as template_file, open(module_inst_template_path) as inst_template_file:
        TAB1 = "    "
        TAB2 = TAB1 + TAB1
        TAB3 = TAB1 + TAB1 + TAB1
        module_template = re.sub(r'/\*placeholder(\{\d+\})\*/', r'\1', template_file.read()) # \1: 第一个匹配组
        inst_template = re.sub(r'/\*placeholder(\{\d+\})\*/', r'\1', inst_template_file.read())
        
        signal_dict, stage_dict = wire_defines_parser(wire_defines_path)
        
        for pipeline, src_stage, dest_stage in zip(pipelines, stages[:-1], stages[1:]):
            with open(gen_module_path.format(pipeline), '+w') as gen_module_file, open(gen_inst_module_path.format(pipeline), 'w') as gen_inst_module_file:
                # module/inst   /*placeholder{0}*/
                module_name_suffix_tmpl:str = "{0}"
                module_name_suffix_gen:str = module_name_suffix_tmpl.format(pipeline)
                
                # module        /*placeholder{1}*/
                # dedent去除前导空格, """\去除首行\n
                io_define_tmpl:str = textwrap.dedent("""\
                {0}input      {1} {2}_i,
                {0}output reg {1} {2}_i,
                """)
                io_define_gen = ""
                """e.g.
                input      [31:0] signal_i;
                output reg [31:0] signal_o;
                """
                
                # module        /*placeholder{2}*/
                reset_tmpl:str = "{0}{1}_o <= 0;\n"
                reset_gen:str = ""
                """e.g.
                signal_o <= 0;
                """
                
                # module        /*placeholder{3}*/
                propagate_tmpl:str = "{0}{1}_o <= {1}_i;\n"
                propagate_gen:str = ""
                """e.g.
                signal_o <= signal_i;
                """
                
                # inst          /*placeholder{1}*/
                inst_args_tmpl:str = textwrap.dedent("""\
                {0}.{1}_i({2}_{1}_w),
                {0}.{1}_o({3}_{1}_w),
                """)
                inst_args_gen:str = ""
                """e.g.
                .signal_i(ID_signal_w),
                .signal_o(EX_signal_w),
                """
                
                # 取两个阶段所需传递的信号交集为当前流水线传递信号
                # stage_dict[src_stage] 和 stage_dict[dest_stage] 是两个有序列表
                # signals = set(stage_dict[src_stage]) & set(stage_dict[dest_stage]) 会丢失顺序
                signals = [item for item in stage_dict[src_stage] if item in stage_dict[dest_stage]]
                
                for signal in signals:
                    signal_width = signal_dict[signal][1]
                    io_define_gen += io_define_tmpl.format(TAB1, signal_width, signal)
                    reset_gen += reset_tmpl.format(TAB3, signal)
                    propagate_gen += propagate_tmpl.format(TAB3, signal)
                    inst_args_gen += inst_args_tmpl.format(TAB2, signal, src_stage, dest_stage)
                    
                generated_module = module_template.format(module_name_suffix_gen, io_define_gen[:-2], reset_gen[:-1], propagate_gen[:-1])
                generated_inst = inst_template.format(module_name_suffix_gen, inst_args_gen[:-2]) # remove last ','
                
                if dry_run:
                    print(generated_module)
                    print(generated_inst)
                else:
                    gen_module_file.write(generated_module)
                    print(f"writing {pipeline} module to {gen_inst_module_path.format(pipeline)}")
                    gen_inst_module_file.write(generated_inst)
                    print(f"writing {pipeline} module to {gen_module_path.format(pipeline)}") 
                    
generate(dry_run=False)